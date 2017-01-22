import Foundation

class MFightFacingPositive:MFightFacing
{
    override func initialPosition() -> MFightPosition
    {
        let position:MFightPosition = MFightPosition(
            positionX:-kInitialX,
            positionY:kInitialY)
        
        return position
    }
    
    override func direction() -> MetalSpatialBaseTexturedDirection
    {
        let direction:MetalSpatialBaseTexturedDirectionPositive = MetalSpatialBaseTexturedDirectionPositive()
        
        return direction
    }
}
