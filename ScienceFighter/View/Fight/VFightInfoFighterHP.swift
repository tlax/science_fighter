import UIKit

class VFightInfoFighterHP:UIView
{
    private weak var viewBar:UIView!
    private weak var layoutBarWidth:NSLayoutConstraint!
    private let kCornerRadius:CGFloat = 10
    private let kBarMargin:CGFloat = 3
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = UIColor(white:0, alpha:0.2)
        layer.cornerRadius = kCornerRadius
        
        let viewBar:UIView = UIView()
        viewBar.isUserInteractionEnabled = false
        viewBar.translatesAutoresizingMaskIntoConstraints = false
        viewBar.clipsToBounds = true
        self.viewBar = viewBar
        
        addSubview(viewBar)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBar,
            toView:self,
            margin:kBarMargin)
        NSLayoutConstraint.leftToLeft(
            view:viewBar,
            toView:self,
            constant:kBarMargin)
        layoutBarWidth = NSLayoutConstraint.width(
            view:viewBar)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
