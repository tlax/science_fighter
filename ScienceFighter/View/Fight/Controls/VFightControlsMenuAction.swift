import UIKit

class VFightControlsMenuAction:UIView
{
    private(set) weak var controller:CFight!
    private(set) weak var halo:UIView
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
