import Foundation

class MFightFighterStateAdvance:MFightFighterState
{
    private var lastStep:TimeInterval
    
    override init(fighter:MFightFighter)
    {
        lastStep = 0
        super.init(fighter:fighter)
    }
    
    override func updateTexture()
    {
        fighter.spatialChar.currentTexture = fighter.spatialChar.textures.advanceTextures.next()
    }
    
    override func tick(timestamp:TimeInterval)
    {
        let timeTranscurred:TimeInterval = timestamp - lastStep
        
        if timeTranscurred >= fighter.kMovingSpeed
        {
            let moveDistance:Float = fighter.kMovingDistance
            let normalizedDistance:Float = fighter.facing.normalizeDistance(
                distance:moveDistance)
            fighter.position.positionX += normalizedDistance
            
            lastStep = timestamp
            updateTexture()
        }
    }
}
