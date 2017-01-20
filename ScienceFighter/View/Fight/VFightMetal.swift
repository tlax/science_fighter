import MetalKit

class VFightMetal:MTKView
{
    private weak var controller:CFight!
    private let commandQueue:MTLCommandQueue
    
    init?(controller:CFight)
    {
        guard
            
            let device:MTLDevice = MTLCreateSystemDefaultDevice()
        
        else
        {
            return nil
        }
        
        commandQueue = device.makeCommandQueue()
        
        super.init(
            frame:CGRect.zero,
            device:device)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
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
    }
}
/*

let renderPassDescriptor = MTLRenderPassDescriptor()
renderPassDescriptor.colorAttachments[0].texture = drawable.texture
renderPassDescriptor.colorAttachments[0].loadAction = .Clear
renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(red: 0.0, green: 104.0/255.0, blue: 5.0/255.0, alpha: 1.0)
renderPassDescriptor.colorAttachments[0].storeAction = .Store

let commandBuffer = commandQueue.commandBuffer()
commandBuffer.addCompletedHandler { (commandBuffer) -> Void in
    dispatch_semaphore_signal(self.bufferProvider.avaliableResourcesSemaphore)
}

let renderEncoder = commandBuffer.renderCommandEncoderWithDescriptor(renderPassDescriptor)
//For now cull mode is used instead of depth buffer
renderEncoder.setCullMode(MTLCullMode.Front)

renderEncoder.setRenderPipelineState(pipelineState)
renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, atIndex: 0)
renderEncoder.setFragmentTexture(texture, atIndex: 0)
if let samplerState = samplerState{
    renderEncoder.setFragmentSamplerState(samplerState, atIndex: 0)
}

renderEncoder.setFragmentTexture(texture, atIndex: 0)
if let samplerState = samplerState{
    renderEncoder.setFragmentSamplerState(samplerState, atIndex: 0)
}

let nodeModelMatrix = self.modelMatrix()
nodeModelMatrix.multiplyLeft(parentModelViewMatrix)

let uniformBuffer = bufferProvider.nextUniformsBuffer(projectionMatrix, modelViewMatrix: nodeModelMatrix)

renderEncoder.setVertexBuffer(uniformBuffer, offset: 0, atIndex: 1)
renderEncoder.drawPrimitives(.Triangle, vertexStart: 0, vertexCount: vertexCount)
renderEncoder.endEncoding()

commandBuffer.presentDrawable(drawable)
commandBuffer.commit()*/
