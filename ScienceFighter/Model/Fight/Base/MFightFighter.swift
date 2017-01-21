import Foundation

class MFightFighter
{
    let position:MFightPosition
    let facing:MFightFacing
    
    init(facing:MFightFacing)
    {
        position = MFightPosition()
        self.facing = facing
    }
}
