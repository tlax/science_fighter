import Foundation
import MetalKit

class MFightFighterGauss:MFightFighter
{
    override init(
        device:MTLDevice,
        facing:MFightFacing)
    {
        let standImages:[UIImage] = [
            #imageLiteral(resourceName: "assetCharTuringStand1"),
            #imageLiteral(resourceName: "assetCharTuringStand2")
        ]
        
        let advanceImages:[UIImage] = [
            #imageLiteral(resourceName: "assetCharTuringStand1")
        ]
        
        let direction:MetalSpatialBaseTexturedDirection = facing.direction()
        
        let charTextures:MetalSpatialCharTextures = MetalSpatialCharTextures(
            device:device,
            standImages:standImages,
            advanceImages:advanceImages)
        
        let spatialChar:MetalSpatialChar = MetalSpatialChar(
            device:device,
            textures:charTextures,
            direction:direction)
        
        super.init(
            spatialChar:spatialChar,
            facing:facing)
    }
}
