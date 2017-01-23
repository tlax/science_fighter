import Foundation

class MFighterState:MFightTickerProtocol
{
    private(set) weak var fighter:MFightFighter!
    
    init(fighter:MFightFighter)
    {
        self.fighter = fighter
    }
    
    //MARK: public
    
    func updateTexture()
    {
        
    }
    
    //MARK: tickerProtocol
    
    func tick(timestamp:TimeInterval)
    {
    }
}
