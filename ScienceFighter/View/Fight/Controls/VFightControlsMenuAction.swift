import UIKit

class VFightControlsMenuAction:UIView
{
    private(set) weak var controller:CFight!
    private(set) weak var imageView:UIImageView!
    private(set) weak var halo:VFightControlsMenuActionHalo!
    private let color:UIColor
    
    init(
        controller:CFight,
        image:UIImage,
        color:UIColor)
    {
        self.color = color
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        self.controller = controller
        
        let imageView:UIImageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image.withRenderingMode(
            UIImageRenderingMode.alwaysTemplate)
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
        imageView.tintColor = UIColor.mainColor
    }
    
    func deActivate()
    {
        halo.stand()
        imageView.tintColor = UIColor(white:0.9, alpha:1)
    }
}
