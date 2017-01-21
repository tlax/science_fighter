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
}
