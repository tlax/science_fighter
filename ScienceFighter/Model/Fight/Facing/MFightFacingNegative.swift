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
}
