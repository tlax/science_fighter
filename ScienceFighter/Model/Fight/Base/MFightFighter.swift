import Foundation
import MetalKit

class MFightFighter
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
        position = MFightPosition()
        self.spatialChar = spatialChar
        self.facing = facing
    }
}
