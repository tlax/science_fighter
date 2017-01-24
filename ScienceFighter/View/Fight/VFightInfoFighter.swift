import UIKit

class VFightInfoFighter:UIView
{
    
    
    private weak var fighter:MFightFighter?
    privare weak var viewHP:VFightInfoFighterHP!
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let viewHP:VFightInfoFighterHP = VFightInfoFighterHP()
        self.viewHP = viewHP
        
        addSubview(viewHP)
        
        NSLayoutConstraint.equalsHorizontal(
            view: <#T##UIView#>, toView: <#T##UIView#>)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func update()
    {
        
    }
}
