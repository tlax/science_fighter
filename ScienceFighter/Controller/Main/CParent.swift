import UIKit

class CParent:UIViewController
{
    enum TransitionVertical:CGFloat
    {
        case fromTop = -1
        case fromBottom = 1
        case none = 0
    }
    
    enum TransitionHorizontal:CGFloat
    {
        case fromLeft = -1
        case fromRight = 1
        case none = 0
    }
    
    weak var viewParent:VParent!
    private var statusBarStyle:UIStatusBarStyle
    private var barHidden:Bool
    
    init()
    {
        statusBarStyle = UIStatusBarStyle.default
        barHidden = false
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let loops:CLoops = CLoops()
        mainController(controller:loops)
        
        MSession.sharedInstance.loadSettings()
    }
    
    override func loadView()
    {
        let viewParent:VParent = VParent(controller:self)
        self.viewParent = viewParent
        view = viewParent
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        return statusBarStyle
    }
    
    override var prefersStatusBarHidden:Bool
    {
        return barHidden
    }
    
    //MARK: private
    
    private func slide(controller:CController, left:CGFloat)
    {
        guard
            
            let currentController:CController = childViewControllers.last as? CController,
            let newView:VView = controller.view as? VView,
            let currentView:VView = currentController.view as? VView
            
        else
        {
            return
        }
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        viewParent.slide(
            currentView:currentView,
            newView:newView,
            left:left)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
            currentController.removeFromParentViewController()
        }
    }
    
    //MARK: public
    
    func changeBar(barHidden:Bool)
    {
        self.barHidden = barHidden
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func mainController(controller:CController)
    {
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:false)
        
        guard
            
            let newView:VView = controller.view as? VView
        
        else
        {
            return
        }
            
        viewParent.mainView(view:newView)
        controller.endAppearanceTransition()
    }
    
    func moveToCamera()
    {
        let left:CGFloat = -viewParent.bounds.maxX
        let controller:CCamera = CCamera()
        
        slide(controller:controller, left:left)
    }
    
    func moveToStore()
    {
        let left:CGFloat = viewParent.bounds.maxX
        let controller:CStore = CStore()
        
        slide(controller:controller, left:left)
    }
    
    func moveToLoops()
    {
        let left:CGFloat
        
        if let _:CStore = childViewControllers.last as? CStore
        {
            left = -viewParent.bounds.maxX
        }
        else
        {
            left = viewParent.bounds.maxX
        }
        
        let controller:CLoops = CLoops()
        
        slide(controller:controller, left:left)
    }
    
    func push(
        controller:CController,
        horizontal:TransitionHorizontal = TransitionHorizontal.none,
        vertical:TransitionVertical = TransitionVertical.none)
    {
        let width:CGFloat = viewParent.bounds.maxX
        let height:CGFloat = viewParent.bounds.maxY
        let left:CGFloat = width * horizontal.rawValue
        let top:CGFloat = height * vertical.rawValue
        
        guard
            
            let currentController:CController = childViewControllers.last as? CController,
            let newView:VView = controller.view as? VView
            
        else
        {
            return
        }
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        viewParent.push(
            newView:newView,
            left:left,
            top:top)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
        }
    }
    
    func animateOver(controller:CController)
    {
        guard
            
            let currentController:CController = childViewControllers.last as? CController,
            let newView:VView = controller.view as? VView
            
        else
        {
            return
        }
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        viewParent.animateOver(
            newView:newView)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
        }
    }
    
    func removeBetweenFirstAndLast()
    {
        var controllers:Int = childViewControllers.count - 1
        
        while controllers > 1
        {
            controllers -= 1
            
            guard
                
                let controller:CController = childViewControllers[controllers] as? CController,
                let view:VView = controller.view as? VView
                
            else
            {
                continue
            }
            
            controller.beginAppearanceTransition(false, animated:false)
            view.removeFromSuperview()
            controller.endAppearanceTransition()
            controller.removeFromParentViewController()
        }
    }
    
    func removeAllButLast()
    {
        var controllers:Int = childViewControllers.count - 1
        
        while controllers > 0
        {
            controllers -= 1
            
            guard
                
                let controller:CController = childViewControllers[controllers] as? CController,
                let view:VView = controller.view as? VView
                
            else
            {
                continue
            }
            
            controller.beginAppearanceTransition(false, animated:false)
            view.removeFromSuperview()
            controller.endAppearanceTransition()
            controller.removeFromParentViewController()
        }
    }
    
    func pop(
        horizontal:TransitionHorizontal = TransitionHorizontal.none,
        vertical:TransitionVertical = TransitionVertical.none)
    {
        let width:CGFloat = viewParent.bounds.maxX
        let height:CGFloat = viewParent.bounds.maxY
        let left:CGFloat = width * horizontal.rawValue
        let top:CGFloat = height * vertical.rawValue
        let controllers:Int = childViewControllers.count
        
        if controllers > 1
        {
            guard
                
                let currentController:CController = childViewControllers[controllers - 1] as? CController,
                let previousController:CController = childViewControllers[controllers - 2] as? CController,
                let currentView:VView = currentController.view as? VView
                
            else
            {
                return
            }
            
            currentController.beginAppearanceTransition(false, animated:true)
            previousController.beginAppearanceTransition(true, animated:true)
            
            viewParent.pop(
                currentView:currentView,
                left:left,
                top:top)
            {
                previousController.endAppearanceTransition()
                currentController.endAppearanceTransition()
                currentController.removeFromParentViewController()
            }
        }
    }
    
    func dismissAnimateOver(completion:(() -> ())?)
    {
        guard
            
            let currentController:CController = childViewControllers.last as? CController,
            let currentView:VView = currentController.view as? VView
            
        else
        {
            return
        }
        
        currentController.removeFromParentViewController()
        
        guard
            
            let previousController:CController = childViewControllers.last as? CController
            
        else
        {
            return
        }
        
        currentController.beginAppearanceTransition(false, animated:true)
        previousController.beginAppearanceTransition(true, animated:true)
        
        viewParent.dismissAnimateOver(
            currentView:currentView)
        {
            currentController.endAppearanceTransition()
            previousController.endAppearanceTransition()
            
            completion?()
        }
    }
}
