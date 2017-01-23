import Foundation
import MetalKit

class MFightFighter:MetalRenderableProtocol, MFightTickerProtocol
{
    let spatialChar:MetalSpatialChar
    let position:MFightPosition
    let facing:MFightFacing
    private let kUpdateTextureRate:UInt32 = 4
    
    init(
        device:MTLDevice,
        facing:MFightFacing)
    {
        fatalError()
    }
    
    init(
        spatialChar:MetalSpatialChar,
        facing:MFightFacing)
    {
        position = facing.initialPosition()
        self.spatialChar = spatialChar
        self.facing = facing
    }
    
    //MARK: renderableProtocol
    
    func render(renderEncoder:MTLRenderCommandEncoder)
    {
        guard
        
            let texture:MTLTexture = spatialChar.currentTexture
        
        else
        {
            return
        }
        
        let positionBuffer:MTLBuffer = renderEncoder.device.generateBuffer(
            bufferable:position)
        
        renderEncoder.render(
            vertex:spatialChar.vertexBuffer,
            position:positionBuffer,
            texture:texture)
    }
    
    //MARK: tickerProtocol
    
    func tick(timestamp:TimeInterval)
    {
        let updateTexture:UInt32 = arc4random_uniform(kUpdateTextureRate)
        
        if updateTexture == 0
        {
            spatialChar.state?.updateTexture()
        }
    }
}
