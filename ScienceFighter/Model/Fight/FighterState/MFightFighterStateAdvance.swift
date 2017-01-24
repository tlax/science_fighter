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
        guard
            
            let enemy:MFightFighter = fighter.enemy
        
        else
        {
            return
        }
        
        let timeTranscurred:TimeInterval = timestamp - lastStep
        
        if timeTranscurred >= fighter.kMovingSpeed
        {
            let nextPosition:Float = fighter.nextPositionPoint()
            
            if enemy.positionOverlap(position:nextPosition)
            {
                fighter.stateStand()
            }
            else
            {
                fighter.position.positionX = nextPosition
                lastStep = timestamp
                updateTexture()
            }
        }
    }
}
