import Foundation

class MetalSpatialCharState:MFightTickerProtocol
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
    
    //MARK: tickerProtocol
    
    func tick(timestamp:TimeInterval)
    {
    }
}
