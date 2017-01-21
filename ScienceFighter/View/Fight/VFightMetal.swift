import MetalKit

class VFightMetal:MTKView
{
    private weak var controller:CFight!
    var turing:MetalSpatialCharTuring?
    var turingBuffer:MTLBuffer?
    var texture:MTLTexture
    let samplerState:MTLSamplerState
    private let commandQueue:MTLCommandQueue
    private let pipelineState:MTLRenderPipelineState
    private let kPixelFormat:MTLPixelFormat = MTLPixelFormat.bgra8Unorm
    private let kRgbBlendOperation:MTLBlendOperation = MTLBlendOperation.add
    private let kAlphaBlendOperation:MTLBlendOperation = MTLBlendOperation.add
    private let kSourceRgbBlendFactor:MTLBlendFactor = MTLBlendFactor.one
    private let kSourceAlphaBlendFactor:MTLBlendFactor = MTLBlendFactor.one
    private let kDestinationRgbBlendFactor:MTLBlendFactor = MTLBlendFactor.oneMinusSourceAlpha
    private let kDestinationAlphaBlendFactor:MTLBlendFactor = MTLBlendFactor.oneMinusSourceAlpha
    private let kVertexFunction:String = "vertex_textured"
    private let kFragmentFunction:String = "fragment_simple"
    private let kBlendingEnabled:Bool = true
    private let kColorAttachmentIndex:Int = 0
    
    var vertexLength:Int = 0
    
    init?(controller:CFight)
    {
        guard
            
            let device:MTLDevice = MTLCreateSystemDefaultDevice(),
            let library:MTLLibrary = device.newDefaultLibrary(),
            let vertexFunction:MTLFunction = library.makeFunction(name:kVertexFunction),
            let fragmentFunction:MTLFunction = library.makeFunction(name:kFragmentFunction)
        
        else
        {
            return nil
        }
        
        commandQueue = device.makeCommandQueue()
        
        let pSamplerDescriptor:MTLSamplerDescriptor? = MTLSamplerDescriptor();
        
        if let sampler = pSamplerDescriptor {
            sampler.minFilter             = MTLSamplerMinMagFilter.nearest
            sampler.magFilter             = MTLSamplerMinMagFilter.nearest
            sampler.mipFilter             = MTLSamplerMipFilter.nearest
            sampler.maxAnisotropy         = 1
            sampler.sAddressMode          = MTLSamplerAddressMode.clampToEdge
            sampler.tAddressMode          = MTLSamplerAddressMode.clampToEdge
            sampler.rAddressMode          = MTLSamplerAddressMode.clampToEdge
            sampler.normalizedCoordinates = true
            sampler.lodMinClamp           = 0
            sampler.lodMaxClamp           = FLT_MAX
        }
        
        samplerState = device.makeSamplerState(descriptor: pSamplerDescriptor!)
        
        let pipelineDescriptor:MTLRenderPipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        
        let colorAttachment:MTLRenderPipelineColorAttachmentDescriptor = pipelineDescriptor.colorAttachments[kColorAttachmentIndex]
        colorAttachment.pixelFormat = kPixelFormat
        colorAttachment.isBlendingEnabled = kBlendingEnabled
        colorAttachment.rgbBlendOperation = kRgbBlendOperation
        colorAttachment.alphaBlendOperation = kAlphaBlendOperation
        colorAttachment.sourceRGBBlendFactor = kSourceRgbBlendFactor
        colorAttachment.sourceAlphaBlendFactor = kSourceAlphaBlendFactor
        colorAttachment.destinationRGBBlendFactor = kDestinationRgbBlendFactor
        colorAttachment.destinationAlphaBlendFactor = kDestinationAlphaBlendFactor
        
        do
        {
            try pipelineState = device.makeRenderPipelineState(descriptor:pipelineDescriptor)
        }
        catch
        {
            return nil
        }
        
        let textureLoader:MTKTextureLoader = MTKTextureLoader(device:device)
        let imageTexture:UIImage = #imageLiteral(resourceName: "assetCharTuringStand1")
        
        guard
            
            let cgImage:CGImage = imageTexture.cgImage
            
        else
        {
            return nil
        }
        
        do
        {
            texture = try textureLoader.newTexture(
                with:cgImage,
                options:[
                    MTKTextureLoaderOptionTextureUsage:
                        MTLTextureUsage.shaderRead.rawValue as NSObject,
                    MTKTextureLoaderOptionSRGB:
                        true as NSObject
                ])
        }
        catch
        {
            return nil
        }
        
        
        super.init(
            frame:CGRect.zero,
            device:device)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        contentMode = UIViewContentMode.center
        autoResizeDrawable = false
        
        let vertexTopLeft:MetalVertexTextured = MetalVertexTextured(
            positionX:-1,
            positionY:-1,
            horizontal:0,
            vertical:0)
        let vertexTopRight:MetalVertexTextured = MetalVertexTextured(
            positionX:1,
            positionY:-1,
            horizontal:1,
            vertical:0)
        let vertexBottomLeft:MetalVertexTextured = MetalVertexTextured(
            positionX:-1,
            positionY:1,
            horizontal:0,
            vertical:1)
        let vertexBottomRight:MetalVertexTextured = MetalVertexTextured(
            positionX:1,
            positionY:1,
            horizontal:1,
            vertical:1)
        
        let turingFace:MetalVertexFace = MetalVertexFace(
            topLeft:vertexTopLeft,
            topRight:vertexTopRight,
            bottomLeft:vertexBottomLeft,
            bottomRight:vertexBottomRight)
        turing = MetalSpatialCharTuring(vertexFace:turingFace)
        let turingData:[Float] = turing!.vertexFace.asBuffer()
        let turingDataLength:Int = turingData.count
        vertexLength = turingDataLength
        let turingDataSize:Int = turingDataLength * turing!.vertexFace.sizeOfItem()
        
        turingBuffer = device.makeBuffer(
            bytes:turingData,
            length:turingDataSize,
            options:MTLResourceOptions())
    }
    
    required init(coder:NSCoder)
    {
        fatalError()
    }
    
    override func draw()
    {
        super.draw()
        
        guard
        
            let drawable:CAMetalDrawable = currentDrawable,
            let passDescriptor:MTLRenderPassDescriptor = currentRenderPassDescriptor
        
        else
        {
            return
        }
        
        let commandBuffer:MTLCommandBuffer = commandQueue.makeCommandBuffer()
        let renderEncoder:MTLRenderCommandEncoder = commandBuffer.makeRenderCommandEncoder(
            descriptor:passDescriptor)
        renderEncoder.setCullMode(MTLCullMode.none)
        renderEncoder.setRenderPipelineState(pipelineState)
        renderEncoder.setVertexBuffer(turingBuffer, offset:0, at:0)
        renderEncoder.setFragmentTexture(texture, at:0)
        renderEncoder.setFragmentSamplerState(samplerState, at:0)
        renderEncoder.drawPrimitives(type:MTLPrimitiveType.triangle, vertexStart:0, vertexCount:vertexLength)
        renderEncoder.endEncoding()
        
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
