import Foundation
import MetalKit

class MFightScene:MetalRenderableProtocol
{
    let spatialScene:MetalSpatialScene
    
    init(device:MTLDevice)
    {
        fatalError()
    }
    
    init(spatialScene:MetalSpatialScene)
    {
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
        renderEncoder.setFragmentTexture(
            texture,
            at:MetalConstants.kTextureIndex)
        renderEncoder.drawPrimitives(
            type:MetalConstants.kPrimitiveType,
            vertexStart:0,
            vertexCount:spatialScene.vertexBuffer.length)
    }
}
