import UIKit

class VFight:VView
{
    weak var viewMetal:VFightMetal?
    private weak var controller:CFight!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CFight
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func loadMetal()
    {
        guard
            
            let viewMetal:VFightMetal = VFightMetal(
                controller:self.controller)
            
        else
        {
            return
        }
        
        self.viewMetal = viewMetal
        addSubview(viewMetal)
        
        NSLayoutConstraint.equals(
            view:viewMetal,
            toView:self)
    }
}
