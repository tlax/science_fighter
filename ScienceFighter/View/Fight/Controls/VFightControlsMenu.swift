import UIKit

class VFightControlsMenu:UIView
{
    private weak var controller:CFight!
    private weak var pause:VFightControlsMenuPause!
    private weak var actionGuard:VFightControlsMenuAction!
    private weak var actionAttack:VFightControlsMenuAction!
    private weak var layoutPauseLeft:NSLayoutConstraint!
    private let kPauseWidth:CGFloat = 70
    private let kActionWidth:CGFloat = 100
    private let kActionMargin:CGFloat = 20
    
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
        
        let actionGuard:VFightControlsMenuAction = VFightControlsMenuAction(image:#imageLiteral(resourceName: "assetGenericPause"))
        self.actionGuard = actionGuard
        
        let actionAttack:VFightControlsMenuAction = VFightControlsMenuAction(image:#imageLiteral(resourceName: "assetGenericPause"))
        self.actionAttack = actionAttack
        
        addSubview(border)
        addSubview(pause)
        addSubview(actionGuard)
        addSubview(actionAttack)
        
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
        
        NSLayoutConstraint.equalsVertical(
            view:actionGuard,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:actionAttack,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:actionAttack,
            toView:self,
            constant:-kActionMargin)
        NSLayoutConstraint.width(
            view:actionAttack,
            constant:kActionWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:actionGuard,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:actionGuard,
            toView:self,
            constant:kActionMargin)
        NSLayoutConstraint.width(
            view:actionGuard,
            constant:kActionWidth)
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
