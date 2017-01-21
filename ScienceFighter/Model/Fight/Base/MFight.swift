import UIKit
import MetalKit

class MFight
{
    private(set) var round:MFightRound?
    
    init()
    {
    }
    
    //MARK: public
    
    func load(
        device:MTLDevice,
        size:CGSize)
    {
        round = MFightRound(device:device, size:size)
    }
}
