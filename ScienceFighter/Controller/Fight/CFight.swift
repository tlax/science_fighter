import UIKit

class CFight:CController
{
    private weak var viewFight:VFight!
    
    override func loadView()
    {
        let viewFight:VFight = VFight(controller:self)
        self.viewFight = viewFight
        view = viewFight
    }
}
