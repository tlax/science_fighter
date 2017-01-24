import UIKit

class VFightInfoFighterNegative:VFightInfoFighter
{
    override init()
    {
        super.init()
        
        viewName.label.textAlignment = NSTextAlignment.left
        
        NSLayoutConstraint.rightToRight(
            view:viewHP.viewBar,
            toView:viewHP,
            constant:-viewHP.kBarMargin)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
