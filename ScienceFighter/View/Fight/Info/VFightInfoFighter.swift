import UIKit

class VFightInfoFighter:UIView
{
    private weak var fighter:MFightFighter?
    private(set) weak var viewHP:VFightInfoFighterHP!
    private(set) weak var viewName:VFightInfoFighterName!
    private let kMarginHorizontal:CGFloat = 2
    private let kNameHeight:CGFloat = 20
    
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
        
        NSLayoutConstraint.topToTop(
            view:viewHP,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:viewHP,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewHP,
            toView:self,
            margin:kMarginHorizontal)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewName,
            toView:self)
        NSLayoutConstraint.height(
            view:viewName,
            constant:kNameHeight)
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
