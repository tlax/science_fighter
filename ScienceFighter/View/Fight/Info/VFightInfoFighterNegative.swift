import UIKit

class VFightInfoFighterNegative:VFightInfoFighter
{
    override init()
    {
        super.init()
        
        viewName.label.textAlignment = NSTextAlignment.right
        
        NSLayoutConstraint.rightToRight(
            view:viewHP.viewBar,
            toView:viewHP,
            constant:-viewHP.kMargin)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
