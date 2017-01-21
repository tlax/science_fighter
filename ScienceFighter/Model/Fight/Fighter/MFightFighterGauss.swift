import MetalKit
import Foundation

class MFightFighterGauss:MFightFighter
{
    override init(
        device:MTLDevice,
        facing:MFightFacing)
    {
        let frontImages:[UIImage] = [
            #imageLiteral(resourceName: "assetCharTuringStand1")
        ]
        
        let charTextures:MetalSpatialCharTextures = MetalSpatialCharTextures(
            device:device,
            frontImages:frontImages)
        
        let spatialChar:MetalSpatialChar = MetalSpatialChar(
            device:device,
            textures:charTextures)
        
        super.init(
            spatialChar:spatialChar,
            facing:facing)
    }
}
