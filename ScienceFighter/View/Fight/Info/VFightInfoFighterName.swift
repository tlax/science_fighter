import UIKit

class VFightInfoFighterName:UIView
{
    private(set) weak var label:UILabel!
    
    init()
    {
        super.init(frame:CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.bold(size:16)
        self.label = label
        
        addSubview(label)
        
        NSLayoutConstraint.equals(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
