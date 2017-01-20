import MetalKit

class VFightMetal:MTKView
{
    private weak var controller:CFight!
    private let commandQueue:MTLCommandQueue
    private let pipelineState:MTLRenderPipelineState
    var turing:MetalSpatialCharTuring?
    
    init?(controller:CFight)
    {
        guard
            
            let device:MTLDevice = MTLCreateSystemDefaultDevice()
        
        else
        {
            return nil
        }
        
        commandQueue = device.makeCommandQueue()
        
        let pipelineDescriptor:MTLRenderPipelineDescriptor = MTLRenderPipelineDescriptor()
        
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
