import UIKit

class VFight:VView
{
    private weak var controller:CFight!
    private weak var viewMetal:VFightMetal!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CFight
        
        let viewMetal:VFightMetal = VFightMetal(
            controller:self.controller)
        self.viewMetal = viewMetal
        
        addSubview(viewMetal)
        
        NSLayoutConstraint.equals(
            view:viewMetal,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
