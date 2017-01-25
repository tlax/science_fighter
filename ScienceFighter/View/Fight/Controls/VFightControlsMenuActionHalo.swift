import UIKit

class VFightControlsMenuActionHalo:UIView
{
    private weak var imageView:UIImageView!
    private weak var layoutImageTop:NSLayoutConstraint!
    private weak var layoutImageBottom:NSLayoutConstraint!
    private weak var layoutImageLeft:NSLayoutConstraint!
    private weak var layoutImageRight:NSLayoutConstraint!
    private let kAnimationDuration:TimeInterval = 0.3
    private let kStandMaxMargin:CGFloat = 25
    private let kStandMinMargin:CGFloat = 2
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "assetGenericHalo").withRenderingMode(
            UIImageRenderingMode.alwaysTemplate)
        self.imageView = imageView
        
        addSubview(imageView)
        
        layoutImageTop = NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self)
        layoutImageBottom = NSLayoutConstraint.bottomToBottom(
            view:imageView,
            toView:self)
        layoutImageLeft = NSLayoutConstraint.leftToLeft(
            view:imageView,
            toView:self)
        layoutImageRight = NSLayoutConstraint.rightToRight(
            view:imageView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func stand()
    {
        layoutImageTop.constant = kStandMaxMargin
        layoutImageBottom.constant = -kStandMaxMargin
        layoutImageLeft.constant = kStandMaxMargin
        layoutImageRight.constant = -kStandMaxMargin
        
        UIView.animate(
            withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.imageView.tintColor = UIColor(white:0.9, alpha:1)
            self?.layoutIfNeeded()
        }
    }
    
    func active()
    {
        layoutImageTop.constant = kStandMinMargin
        layoutImageBottom.constant = -kStandMinMargin
        layoutImageLeft.constant = kStandMinMargin
        layoutImageRight.constant = -kStandMinMargin
        
        UIView.animate(
            withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.imageView.tintColor = UIColor.mainColor
            self?.layoutIfNeeded()
        }
    }
}
