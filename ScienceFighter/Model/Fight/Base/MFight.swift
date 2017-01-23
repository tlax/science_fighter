import UIKit
import MetalKit

class MFight
{
    private(set) var round:MFightRound?
    
    init()
    {
    }
    
    //MARK: public
    
    func load(device:MTLDevice)
    {
        round = MFightRound(device:device)
    }
    
    func tick()
    {
        
    }
}
