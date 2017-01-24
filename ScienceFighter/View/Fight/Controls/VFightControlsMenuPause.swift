import UIKit

class VFightControlsMenuPause:UIView
{
    private weak var controller:CFight!
    private weak var button:UIButton!
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = UIColor.clear
        self.controller = controller
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(
            #imageLiteral(resourceName: "assetGenericPause"),
            for:UIControlState.normal)
        button.setImage(
            #imageLiteral(resourceName: "assetGenericPauseSelected"),
            for:UIControlState.selected)
        button.setImage(
            #imageLiteral(resourceName: "assetGenericPauseSelected"),
            for:UIControlState.highlighted)
        button.imageView!.contentMode = UIViewContentMode.center
        button.imageView!.clipsToBounds = true
        button.addTarget(
            self,
            action:#selector(actionPause(sender:)),
            for:UIControlEvents.touchUpInside)
        self.button = button
        
        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: actions
    
    func actionPause(sender button:UIButton)
    {
        controller.viewFight.viewMetal?.isPaused = true
    }
}
