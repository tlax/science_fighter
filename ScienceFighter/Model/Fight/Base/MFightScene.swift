import Foundation
import MetalKit

class MFightScene:MetalRenderableProtocol
{
    let spatialScene:MetalSpatialScene
    let dataPosition:MetalBufferableData
    
    init(device:MTLDevice)
    {
        fatalError()
    }
    
    init(
        device:MTLDevice,
        spatialScene:MetalSpatialScene)
    {
        let position:MFightPosition = MFightPosition.zero()
        dataPosition = device.generateBuffer(bufferable:position)
        self.spatialScene = spatialScene
    }
    
    //MARK: renderableProtocol
    
    func render(renderEncoder:MTLRenderCommandEncoder)
    {
        guard
            
            let texture:MTLTexture = spatialScene.currentTexture
            
        else
        {
            return
        }
        
        renderEncoder.setVertexBuffer(
            spatialScene.vertexBuffer.buffer,
            offset:0,
            at:MetalConstants.kVertexIndex)
        renderEncoder.setVertexBuffer(
            dataPosition.buffer,
            offset:0,
            at:MetalConstants.kPositionIndex)
        renderEncoder.setFragmentTexture(
            texture,
            at:MetalConstants.kTextureIndex)
        renderEncoder.drawPrimitives(
            type:MetalConstants.kPrimitiveType,
            vertexStart:0,
            vertexCount:spatialScene.vertexBuffer.length)
    }
}
