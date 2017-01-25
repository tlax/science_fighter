import UIKit

class VFightControlsMenuAction:UIView
{
    private(set) weak var imageView:UIImageView!
    private(set) weak var halo:VFightControlsMenuActionHalo!
    private let kAlphaActive:CGFloat = 1
    private let kAlphaDeActive:CGFloat = 0.3
    
    init(image:UIImage)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        
        let imageView:UIImageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.isUserInteractionEnabled = false
        self.imageView = imageView
        
        let halo:VFightControlsMenuActionHalo = VFightControlsMenuActionHalo()
        self.halo = halo
        
        addSubview(halo)
        addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:halo,
            toView:self)
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
        
        halo.stand()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    //MARK: public
    
    func activate()
    {
        halo.active()
        imageView.alpha = kAlphaActive
    }
    
    func deActivate()
    {
        halo.stand()
        imageView.alpha = kAlphaDeActive
    }
}
