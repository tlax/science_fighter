import UIKit
import MetalKit

class MFight:MFightTickerProtocol
{
    enum State
    {
        case loading
        case countDown
        case fight
        case finished
    }
    
    private(set) var remainingTime:TimeInterval
    private(set) var state:State
    private(set) var round:MFightRound?
    private var created:TimeInterval?
    private var lastTimestamp:TimeInterval
    private let kMaxDuration:TimeInterval = 30
    
    init()
    {
        state = State.loading
        lastTimestamp = 0
        remainingTime = kMaxDuration
    }
    
    //MARK: public
    
    func load(device:MTLDevice)
    {
        round = MFightRound(device:device)
    }
    
    func startCoundDown()
    {
        state = State.countDown
    }
    
    func startFight()
    {
        lastTimestamp = Date().timeIntervalSince1970
        created = lastTimestamp
        state = State.fight
        round?.fighterUser.stateAdvance()
        round?.fighterNPC.stateAdvance()
    }
    
    //MARK: tickerProtocol
    
    func tick(timestamp:TimeInterval)
    {
        round?.tick(timestamp:timestamp)
        
        if state == State.fight
        {
            let deltaTimestamp:TimeInterval = timestamp - lastTimestamp
            remainingTime -= deltaTimestamp
            lastTimestamp = timestamp
        }
    }
}
