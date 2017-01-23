import UIKit
import MetalKit

class MFight:MFightTickerProtocol
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
    
    //MARK: tickerProtocol
    
    func tick(timestamp:TimeInterval)
    {
        round?.tick(timestamp:timestamp)
    }
}
