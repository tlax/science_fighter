import Foundation

class MFight
{
    let fighterUser:MFightFighter
    let fighterNPC:MFightFighter
    
    init()
    {
        let facingPositive:MFightFacingPositive = MFightFacingPositive()
        let facingNegative:MFightFacingNegative = MFightFacingNegative()
        
        fighterUser = MFightFighterTuring(
            facing:facingPositive)
        fighterNPC = MFightFighterGauss(
            facing:facingNegative)
    }
}
