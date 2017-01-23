import Foundation
import MetalKit

class MetalSpatialChar:MetalSpatialBaseTextured
{
    let textures:MetalSpatialCharTextures
    var state:MetalSpatialCharState?
    private let kWidth:Float = 180
    private let kHeight:Float = 180
    
    init(
        device:MTLDevice,
        textures:MetalSpatialCharTextures,
        direction:MetalSpatialBaseTexturedDirection)
    {
        self.textures = textures
        
        super.init(
            device:device,
            width:kWidth,
            height:kHeight,
            direction:direction)
        currentTexture = textures.standTextures.first
        state = MetalSpatialCharStateStand(character:self)
    }
}
