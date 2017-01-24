import UIKit

class VFightInfoCountDown:UIView
{
    private weak var controller:CFight!
    private weak var label:UILabel!
    private weak var layoutLabelTop:NSLayoutConstraint!
    private let kLabelHeight:CGFloat = 50
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        self.controller = controller
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(white:0, alpha:0.5)
        label.font = UIFont.bold(size:18)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.text = "Ready"
        self.label = label
        
        addSubview(label)
        
        layoutLabelTop = NSLayoutConstraint.topToTop(
            view:label,
            toView:self)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.maxY
        let remain:CGFloat = height - kLabelHeight
        let margin:CGFloat = remain / 2.0
        layoutLabelTop.constant = margin
        
        super.layoutSubviews()
    }
}
