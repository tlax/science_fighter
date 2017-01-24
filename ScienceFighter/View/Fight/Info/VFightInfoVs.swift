import UIKit

class VFightInfoVs:UIView
{
    private weak var controller:CFight!
    private weak var label:UILabel!
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        self.controller = controller
        
        let backgroundView:UIImageView = UIImageView()
        backgroundView.isUserInteractionEnabled = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.clipsToBounds = true
        backgroundView.contentMode = UIViewContentMode.center
        backgroundView.image = #imageLiteral(resourceName: "assetGenericVs")
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.bold(size:16)
        label.textColor = UIColor.white
        self.label = label
        
        addSubview(backgroundView)
        addSubview(label)
        
        NSLayoutConstraint.equals(
            view:backgroundView,
            toView:self)
        NSLayoutConstraint.equals(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func update()
    {
        let remainSeconds:Int = Int(controller.model.remainingTime)
        label.text = "\(remainSeconds)"
    }
}
