import UIKit

class VFightInfoFighterHP:UIView
{
    private weak var layoutBarWidth:NSLayoutConstraint!
    private(set) weak var viewBar:UIView!
    private let kCornerRadius:CGFloat = 7
    let kMargin:CGFloat = 2
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = UIColor(white:0, alpha:0.8)
        layer.cornerRadius = kCornerRadius
        
        let viewBar:UIView = UIView()
        viewBar.isUserInteractionEnabled = false
        viewBar.translatesAutoresizingMaskIntoConstraints = false
        viewBar.clipsToBounds = true
        viewBar.backgroundColor = UIColor.red
        viewBar.layer.cornerRadius = kCornerRadius - kMargin
        self.viewBar = viewBar
        
        addSubview(viewBar)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBar,
            toView:self,
            margin:kMargin)
        layoutBarWidth = NSLayoutConstraint.width(
            view:viewBar)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: private
    
    private func percentColor(percent:CGFloat) -> UIColor
    {
        if percent > 0.9
        {
            return UIColor.green
        }
        else if percent > 0.7
        {
            return UIColor.yellow
        }
        else if percent > 0.4
        {
            return UIColor.orange
        }
        else
        {
            return UIColor.red
        }
    }
    
    //MARK: public
    
    func update(percent:CGFloat)
    {
        let color:UIColor = percentColor(percent:percent)
        let width:CGFloat = bounds.maxX
        let remain:CGFloat = width - (kMargin + kMargin)
        let barWidth:CGFloat = percent * remain
        layoutBarWidth.constant = barWidth
        
        viewBar.backgroundColor = color
    }
}
