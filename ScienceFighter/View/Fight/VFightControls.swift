import UIKit

class VFightControls:UIView
{
    private weak var controller:CFight!
    
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
