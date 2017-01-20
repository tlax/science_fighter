import UIKit

@UIApplicationMain
class AppDelegate:UIResponder, UIApplicationDelegate
{
    var window:UIWindow?
    private let kTtlDelta:Int16 = 1

    func application(_ application:UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool
    {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
        let parent:CParent = CParent()
        window.rootViewController = parent
        self.window = window
        
        return true
    }
    
    func applicationWillEnterForeground(_ application:UIApplication)
    {/*
        guard
        
            let settings:DSettings = MSession.sharedInstance.settings
        
        else
        {
            return
        }
        
        settings.ttl += kTtlDelta
        DManager.sharedInstance.save()*/
    }
}
