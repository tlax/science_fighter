import UIKit

class VFightControlsMenu:UIView
{
    private weak var controller:CFight!
    private weak var pause:VFightControlsMenuPause!
    private weak var actionGuard:VFightControlsMenuActionGuard!
    private weak var actionAttack:VFightControlsMenuActionAttack!
    private weak var layoutPauseLeft:NSLayoutConstraint!
    private let kPauseWidth:CGFloat = 70
    private let kActionWidth:CGFloat = 80
    private let kActionMargin:CGFloat = 10
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        clipsToBounds = true
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:1, alpha:0.5))
        
        let pause:VFightControlsMenuPause = VFightControlsMenuPause(
            controller:controller)
        self.pause = pause
        
        let actionGuard:VFightControlsMenuActionGuard = VFightControlsMenuActionGuard(
            controller:controller)
        self.actionGuard = actionGuard
        
        let actionAttack:VFightControlsMenuActionAttack = VFightControlsMenuActionAttack(
            controller:controller)
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
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        guard
        
            let touch:UITouch = touches.first,
            let viewAction:VFightControlsMenuAction = touch.view as? VFightControlsMenuAction
        
        else
        {
            return
        }
        
        viewAction.activate()
    }
    
    override func touchesMoved(_ touches:Set<UITouch>, with event:UIEvent?)
    {
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        guard
            
            let touch:UITouch = touches.first,
            let viewAction:VFightControlsMenuAction = touch.view as? VFightControlsMenuAction
            
        else
        {
            return
        }
        
        viewAction.deActivate()
    }
    
    override func touchesCancelled(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        guard
            
            let touch:UITouch = touches.first,
            let viewAction:VFightControlsMenuAction = touch.view as? VFightControlsMenuAction
            
        else
        {
            return
        }
        
        viewAction.deActivate()
    }
}
