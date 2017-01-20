import MetalKit

class VFightMetal:MTKView
{
    private weak var controller:CFight!
    
    init(controller:CFight)
    {
        let device:MTLDevice? = MTLCreateSystemDefaultDevice()
        
        super.init(
            frame:CGRect.zero,
            device:device)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
    }
    
    required init(coder:NSCoder)
    {
        fatalError()
    }
}
