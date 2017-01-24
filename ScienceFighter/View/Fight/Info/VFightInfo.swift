import UIKit

class VFightInfo:UIView
{
    private weak var controller:CFight!
    private weak var viewUser:VFightInfoFighter!
    private weak var viewNPC:VFightInfoFighter!
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        self.controller = controller
        
        let viewUser:VFightInfoFighterPositive = VFightInfoFighterPositive()
        self.viewUser = viewUser
        
        let viewNPC:VFightInfoFighterNegative = VFightInfoFighterNegative()
        self.viewNPC = viewNPC
        
        addSubview(viewUser)
        addSubview(viewNPC)
        
        
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
