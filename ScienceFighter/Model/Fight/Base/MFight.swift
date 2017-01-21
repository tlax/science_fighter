import UIKit
import MetalKit

class MFight
{
    var projection:MetalProjection?
    var fighterUser:MFightFighter?
    var fighterNPC:MFightFighter?
    private(set) var loaded:Bool
    
    init()
    {
        loaded = false
    }
    
    //MARK: public
    
    func load(
        device:MTLDevice,
        size:CGSize)
    {
        if !loaded
        {
            loaded = true
         
            projection = MetalProjection(size:size)
            
            let facingPositive:MFightFacingPositive = MFightFacingPositive()
            let facingNegative:MFightFacingNegative = MFightFacingNegative()
            
            fighterUser = MFightFighterTuring(
                facing:facingPositive)
            fighterNPC = MFightFighterGauss(
                facing:facingNegative)
        }
    }
}
