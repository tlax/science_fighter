import MetalKit

class VFightMetal:MTKView
{
    private weak var controller:CFight!
    var turing:MetalSpatialCharTuring?
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
    private let kBlendingEnabled:Bool = true
    private let kColorAttachmentIndex:Int = 0
    
    init?(controller:CFight)
    {
        guard
            
            let device:MTLDevice = MTLCreateSystemDefaultDevice(),
            let library:MTLLibrary = device.newDefaultLibrary(),
            let vertexFunction:MTLFunction = library.makeFunction(name:kVertexFunction)
        
        else
        {
            return nil
        }
        
        commandQueue = device.makeCommandQueue()
        
        let pipelineDescriptor:MTLRenderPipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        
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
        
        super.init(
            frame:CGRect.zero,
            device:device)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        
        let vertexTopLeft:MetalVertexTextured = MetalVertexTextured(
            positionX:-1,
            positionY:-1,
            horizontal:0,
            vertical:0)
        let vertexTopRight:MetalVertexTextured = MetalVertexTextured(
            positionX:-1,
            positionY:1,
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
        renderEncoder.setCullMode(MTLCullMode.front)
        renderEncoder.setRenderPipelineState(pipelineState)
        renderEncoder.endEncoding()
        
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
