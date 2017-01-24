import Foundation

class MFightFighterStateStand:MFightFighterState
{
    private let kUpdateTextureRate:UInt32 = 10
    
    override func updateTexture()
    {
        fighter.spatialChar.currentTexture = fighter.spatialChar.textures.standTextures.random()
    }
    
    override func tick(timestamp:TimeInterval)
    {
        let shouldUpdateTexture:UInt32 = arc4random_uniform(kUpdateTextureRate)
        
        if shouldUpdateTexture == 0
        {
            updateTexture()
        }
    }
}
