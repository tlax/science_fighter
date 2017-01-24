import UIKit

class VFightInfoFighterHP:UIView
{
    private weak var layoutBarWidth:NSLayoutConstraint!
    private(set) weak var viewBar:UIView!
    let kBarMargin:CGFloat = 3
    private let kCornerRadius:CGFloat = 10
    
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
        layoutBarWidth = NSLayoutConstraint.width(
            view:viewBar)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
