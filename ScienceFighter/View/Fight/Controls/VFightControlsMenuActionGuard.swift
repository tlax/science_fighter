import UIKit

class VFightControlsMenuActionGuard:VFightControlsMenuAction
{
    init(controller:CFight)
    {
        let image:UIImage = #imageLiteral(resourceName: "assetGenericAttack")
        let color:UIColor = UIColor.red
        
        super.init(
            controller:controller,
            image:image,
            color:color)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
