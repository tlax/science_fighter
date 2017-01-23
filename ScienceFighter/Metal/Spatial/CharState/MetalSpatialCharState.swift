import Foundation

class MetalSpatialCharState
{   
    private weak var character:MetalSpatialChar!
    
    init(character:MetalSpatialChar)
    {
        self.character = character
    }
    
    //MARK: public
    
    func updateTexture()
    {
        character.currentTexture = character.textures.standTextures.random()
    }
}
