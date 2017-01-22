import Foundation
import MetalKit

class MetalSpatialScene:MetalSpatialBaseTextured
{
    let textures:MetalSpatialSceneTextures
    private let kWidth:Float = 100
    private let kHeight:Float = 100
    
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
