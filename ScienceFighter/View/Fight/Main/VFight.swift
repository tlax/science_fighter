import UIKit

class VFight:VView
{
    weak var viewMetal:VFightMetal?
    weak var viewInfo:VFightInfo!
    weak var viewControls:VFightControls!
    private weak var spinner:VSpinner!
    private weak var controller:CFight!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CFight
        
        let viewInfo:VFightInfo = VFightInfo(controller:self.controller)
        self.viewInfo = viewInfo
        
        let viewControls:VFightControls = VFightControls(controller:self.controller)
        self.viewControls = viewControls
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        addSubview(viewInfo)
        addSubview(viewControls)
        addSubview(spinner)
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
        NSLayoutConstraint.equals(
            view:viewInfo,
            toView:self)
        NSLayoutConstraint.equals(
            view:viewControls,
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
        insertSubview(viewMetal, belowSubview:viewInfo)
        
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
