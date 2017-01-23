import Foundation
import MetalKit

class MFightFighterTuring:MFightFighter
{
    override init(
        device:MTLDevice,
        facing:MFightFacing)
    {
        let standImages:[UIImage] = [
            #imageLiteral(resourceName: "assetCharTuringStand1"),
            #imageLiteral(resourceName: "assetCharTuringStand2")
        ]
        
        let direction:MetalSpatialBaseTexturedDirection = facing.direction()
        
        let charTextures:MetalSpatialCharTextures = MetalSpatialCharTextures(
            device:device,
            standImages:standImages)
        
        let spatialChar:MetalSpatialChar = MetalSpatialChar(
            device:device,
            textures:charTextures,
            direction:direction)
        
        super.init(
            spatialChar:spatialChar,
            facing:facing)
    }
}
