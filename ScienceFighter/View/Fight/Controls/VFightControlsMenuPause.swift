import UIKit

class VFightControlsMenuPause:UIView
{
    private weak var button:UIButton!
    
    init()
    {
        super.init(frame:CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
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
        
    }
}
