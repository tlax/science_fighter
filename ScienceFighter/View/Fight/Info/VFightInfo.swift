import UIKit

class VFightInfo:UIView
{
    private weak var controller:CFight!
    private weak var fighterUser:VFightInfoFighter!
    private weak var fighterNPC:VFightInfoFighter!
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
