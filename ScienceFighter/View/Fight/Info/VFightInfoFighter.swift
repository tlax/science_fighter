import UIKit

class VFightInfoFighter:UIView
{
    private weak var fighter:MFightFighter?
    private(set) weak var viewHP:VFightInfoFighterHP!
    private(set) weak var viewName:VFightInfoFighterName!
    private let kNameHeight:CGFloat = 20
    private let kNameMargin:CGFloat = 5
    
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
            toView:self,
            constant:kNameHeight)
        NSLayoutConstraint.bottomToTop(
            view:viewHP,
            toView:viewName)
        NSLayoutConstraint.equalsHorizontal(
            view:viewHP,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewName,
            toView:self)
        NSLayoutConstraint.height(
            view:viewName,
            constant:kNameHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewName,
            toView:self,
            margin:kNameMargin)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func loadFighter(fighter:MFightFighter)
    {
        self.fighter = fighter
        viewName.label.text = fighter.name
        update()
    }
    
    func update()
    {
        guard
        
            let fighter:MFightFighter = self.fighter
        
        else
        {
            return
        }
        
        let hpPercent:CGFloat = fighter.currentHP / fighter.kMaxHP
        viewHP.update(percent:hpPercent)
    }
}
