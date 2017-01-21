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
}
