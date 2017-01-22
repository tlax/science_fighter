import Foundation
import MetalKit

class MetalSpatialScene:MetalSpatialBaseTextured
{
    let textures:MetalSpatialCharTextures
    private let kWidth:Float = 100
    private let kHeight:Float = 100
    
    init(
        device:MTLDevice,
        textures:MetalSpatialCharTextures)
    {
        self.textures = textures
        
        super.init(
            device:device,
            width:kWidth,
            height:kHeight)
        currentTexture = textures.frontTextures.first
    }
}
