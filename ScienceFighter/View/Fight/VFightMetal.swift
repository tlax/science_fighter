import MetalKit

class VFightMetal:MTKView
{
    private weak var controller:CFight!
    var turing:MetalSpatialCharTuring?
    var turingBuffer:MetalBufferableData?
    var gauss:MetalSpatialCharTuring?
    var gaussBuffer:MetalBufferableData?
    var projection:MetalProjection?
    var projectionBuffer:MetalBufferableData?
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
            sampler.minFilter             = MTLSamplerMinMagFilter.linear
            sampler.magFilter             = MTLSamplerMinMagFilter.linear
            sampler.mipFilter             = MTLSamplerMipFilter.linear
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
        isHidden = true
        isPaused = true
        
        turing = MetalSpatialCharTuring()
        turingBuffer = device.generateBuffer(bufferable:turing!.vertexFace)
        
        gauss = MetalSpatialCharTuring()
        gaussBuffer = device.generateBuffer(bufferable:gauss!.vertexFace)
    }
    
    required init(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        projection = MetalProjection(size:bounds.size)
        projectionBuffer = device?.generateBuffer(
            bufferable:projection!)
        
        super.layoutSubviews()
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
        renderEncoder.setVertexBuffer(turingBuffer!.buffer, offset:0, at:0)
        renderEncoder.setVertexBuffer(projectionBuffer!.buffer, offset:0, at:1)
        renderEncoder.setFragmentTexture(texture, at:0)
        renderEncoder.setFragmentSamplerState(samplerState, at:0)
        renderEncoder.drawPrimitives(type:MTLPrimitiveType.triangle, vertexStart:0, vertexCount:turingBuffer!.length)
        
        renderEncoder.setVertexBuffer(gaussBuffer!.buffer, offset:0, at:0)
//        renderEncoder.setVertexBuffer(projectionBuffer!.buffer, offset:0, at:1)
        renderEncoder.setFragmentTexture(texture, at:0)
//        renderEncoder.setFragmentSamplerState(samplerState, at:0)
        renderEncoder.drawPrimitives(type:MTLPrimitiveType.triangle, vertexStart:0, vertexCount:gaussBuffer!.length)
        
        renderEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
