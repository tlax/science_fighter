import UIKit

class VFightControlsMenu:UIView
{
    private weak var controller:CFight!
    private weak var pause:VFightControlsMenuPause!
    private weak var layoutPauseLeft:NSLayoutConstraint!
    private let kPauseWidth:CGFloat = 100
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        clipsToBounds = true
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:1, alpha:0.3))
        
        let pause:VFightControlsMenuPause = VFightControlsMenuPause(
            controller:controller)
        self.pause = pause
        
        addSubview(border)
        addSubview(pause)
        
        NSLayoutConstraint.equals(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:pause,
            toView:self)
        layoutPauseLeft = NSLayoutConstraint.leftToLeft(
            view:pause,
            toView:self)
        NSLayoutConstraint.width(
            view:pause,
            constant:kPauseWidth)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainPause:CGFloat = width - kPauseWidth
        let marginPause:CGFloat = remainPause / 2.0
        layoutPauseLeft.constant = marginPause
        
        super.layoutSubviews()
    }
}
