import Foundation

class MFight
{
    let fighterUser:MFightFighter
    let fighterNPC:MFightFighter
    
    init()
    {
        fighterUser = MFightFighterTuring()
        fighterNPC = MFightFighterGauss()
    }
}
