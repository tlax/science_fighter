import UIKit

class VFightInfoFighterPositive:VFightInfoFighter
{
    override init()
    {
        super.init()
        
        viewName.label.textAlignment = NSTextAlignment.left
        
        NSLayoutConstraint.leftToLeft(
            view:viewHP.viewBar,
            toView:viewHP,
            constant:viewHP.kBarMargin)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
