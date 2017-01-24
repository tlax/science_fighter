import Foundation

class MFightFacingNegative:MFightFacing
{
    override func initialPosition() -> MFightPosition
    {
        let position:MFightPosition = MFightPosition(
            positionX:kInitialX,
            positionY:kInitialY)
        
        return position
    }
    
    override func direction() -> MetalSpatialBaseTexturedDirection
    {
        let direction:MetalSpatialBaseTexturedDirectionNegative = MetalSpatialBaseTexturedDirectionNegative()
        
        return direction
    }
    
    override func normalizeDistance(distance:Float) -> Float
    {
        return -distance
    }
    
    override func normalizeReach(position:Float) -> Float
    {
        return position - kReachDelta
    }
    
    override func overlaps(outsider:Float, me:Float) -> Bool
    {
        let isOverlaping:Bool = outsider >= me
        
        return isOverlaping
    }
}
