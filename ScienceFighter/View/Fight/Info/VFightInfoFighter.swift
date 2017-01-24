import UIKit

class VFightInfoFighter:UIView
{
    private weak var fighter:MFightFighter?
    private weak var viewHP:VFightInfoFighterHP!
    private weak var viewName:VFightInfoFighterName!
    private let kMarginHorizontal:CGFloat = 2
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let viewHP:VFightInfoFighterHP = VFightInfoFighterHP()
        self.viewHP = viewHP
        
        let viewName:VFightInfoFighterName = VFightInfoFighterName()
        self.viewName = viewName
        
        addSubview(viewName)
        addSubview(viewHP)
        
        NSLayoutConstraint.equalsHorizontal(
            view:viewHP,
            toView:self,
            margin:kMarginHorizontal)
        NSLayoutConstraint.equalsHorizontal(
            view:viewName,
            toView:self,
            margin:kMarginHorizontal)
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
