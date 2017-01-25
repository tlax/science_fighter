import UIKit

class VFightControlsMenuActionHalo:UIView
{
    private weak var imageView:UIImageView!
    private weak var layoutImageTop:NSLayoutConstraint!
    private weak var layoutImageBottom:NSLayoutConstraint!
    private weak var layoutImageLeft:NSLayoutConstraint!
    private weak var layoutImageRight:NSLayoutConstraint!
    private let kAnimationDuration:TimeInterval = 0.3
    private let kStandMargin:CGFloat = 25
    
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
        layoutImageTop.constant = kStandMargin
        layoutImageBottom.constant = -kStandMargin
        layoutImageLeft.constant = kStandMargin
        layoutImageRight.constant = -kStandMargin
        
        UIView.animate(
            withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.imageView.tintColor = UIColor(white:0.9, alpha:1)
            self?.layoutIfNeeded()
        }
    }
    
    func active()
    {
        layoutImageTop.constant = 0
        layoutImageBottom.constant = 0
        layoutImageLeft.constant = 0
        layoutImageRight.constant = 0
        
        UIView.animate(
            withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.imageView.tintColor = UIColor.mainColor
            self?.layoutIfNeeded()
        }
    }
}
