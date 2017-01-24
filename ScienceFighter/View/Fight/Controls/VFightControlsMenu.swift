import UIKit

class VFightControlsMenu:UIView
{
    private weak var controller:CFight!
    private weak var buttonPause:VFightControlsMenupau
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        clipsToBounds = true
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:1, alpha:0.5))
        
        addSubview(border)
        
        NSLayoutConstraint.equals(
            view:border,
            toView:self)
        
        
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
