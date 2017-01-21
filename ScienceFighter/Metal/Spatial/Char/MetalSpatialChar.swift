import Foundation

class MetalSpatialChar:MetalSpatialBaseTextured
{
    let textures:MetalSpatialCharTextures
    private let kWidth:Float = 100
    private let kHeight:Float = 100
    
    init(textures:MetalSpatialCharTextures)
    {
        self.textures = textures
        
        super.init(
            width:kWidth,
            height:kHeight)
        currentTexture = textures.frontTextures.first
    }
}
