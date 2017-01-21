import UIKit

class VFight:VView
{
    weak var viewMetal:VFightMetal?
    private weak var spinner:VSpinner!
    private weak var controller:CFight!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CFight
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        addSubview(spinner)
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
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
    
    func loadFinished()
    {
        spinner.stopAnimating()
        viewMetal?.isHidden = false
        viewMetal?.isPaused = false
    }
}
