import Foundation
import MetalKit

class MFightFighter:MetalRenderableProtocol
{
    let spatialChar:MetalSpatialChar
    let position:MFightPosition
    let facing:MFightFacing
    
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
    }
}
