import Foundation

class MFighterStateAdvance:MFighterState
{
    private var lastStep:TimeInterval
    
    override init(fighter:MFightFighter)
    {
        lastStep = 0
        super.init(fighter:fighter)
    }
    
    override func updateTexture()
    {
        fighter.spatialChar.currentTexture = fighter.spatialChar.textures.standTextures.next()
    }
    
    override func tick(timestamp:TimeInterval)
    {
        let timeTranscurred:TimeInterval = timestamp - lastStep
        
        if timeTranscurred >= fighter.kMovingSpeed
        {
            lastStep = timestamp
            updateTexture()
        }
    }
}
