import Foundation
import MetalKit

class MFightScene:MetalRenderableProtocol
{
    let spatialScene:MetalSpatialScene
    let positionBuffer:MTLBuffer
    
    init(device:MTLDevice)
    {
        fatalError()
    }
    
    init(
        device:MTLDevice,
        spatialScene:MetalSpatialScene)
    {
        let position:MFightPosition = MFightPosition.zero()
        positionBuffer = device.generateBuffer(bufferable:position)
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
        
        renderEncoder.render(
            vertex:spatialScene.vertexBuffer,
            position:positionBuffer,
            texture:texture)
    }
}
