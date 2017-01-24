import UIKit

class VFightControlsMenu:UIView
{
    private weak var controller:CFight!
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        clipsToBounds = true
        self.controller = controller
        
        let blur:VBlur = VBlur.light()
        
        addSubview(blur)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
