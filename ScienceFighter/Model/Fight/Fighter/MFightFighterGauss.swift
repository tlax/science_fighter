import Foundation
import MetalKit

class MFightFighterGauss:MFightFighter
{
    override init(
        device:MTLDevice,
        facing:MFightFacing)
    {
        let frontImages:[UIImage] = [
            #imageLiteral(resourceName: "assetCharTuringStand1")
        ]
        
        let direction:MetalSpatialBaseTexturedDirection = facing.direction()
        
        let charTextures:MetalSpatialCharTextures = MetalSpatialCharTextures(
            device:device,
            frontImages:frontImages)
        
        let spatialChar:MetalSpatialChar = MetalSpatialChar(
            device:device,
            textures:charTextures,
            direction:direction)
        
        super.init(
            spatialChar:spatialChar,
            facing:facing)
    }
}
