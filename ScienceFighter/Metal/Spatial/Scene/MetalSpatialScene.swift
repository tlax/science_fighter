import Foundation
import MetalKit

class MetalSpatialScene:MetalSpatialBaseTexturedPositive
{
    let textures:MetalSpatialSceneTextures
    private let kWidth:Float = 792
    private let kHeight:Float = 396
    
    init(
        device:MTLDevice,
        textures:MetalSpatialSceneTextures)
    {
        self.textures = textures
        
        super.init(
            device:device,
            width:kWidth,
            height:kHeight)
        currentTexture = textures.textures.first
    }
}
