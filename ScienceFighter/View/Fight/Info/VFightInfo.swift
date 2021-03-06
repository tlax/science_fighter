import UIKit

class VFightInfo:UIView
{
    private weak var controller:CFight!
    private weak var viewUser:VFightInfoFighter!
    private weak var viewNPC:VFightInfoFighter!
    private weak var viewVs:VFightInfoVs!
    private weak var viewCountDown:VFightInfoCountDown?
    private weak var layoutVsLeft:NSLayoutConstraint!
    private let kVsWidth:CGFloat = 60
    private let kContentTop:CGFloat = 5
    private let kContentHeight:CGFloat = 60
    private let kMarginHorizontal:CGFloat = 10
    private let kInitialVsLeft:CGFloat = 150
    
    init(controller:CFight)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        self.controller = controller
        
        let viewUser:VFightInfoFighterPositive = VFightInfoFighterPositive()
        self.viewUser = viewUser
        
        let viewNPC:VFightInfoFighterNegative = VFightInfoFighterNegative()
        self.viewNPC = viewNPC
        
        let viewVs:VFightInfoVs = VFightInfoVs(controller:controller)
        self.viewVs = viewVs
        
        addSubview(viewUser)
        addSubview(viewNPC)
        addSubview(viewVs)
        
        NSLayoutConstraint.topToTop(
            view:viewVs,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.height(
            view:viewVs,
            constant:kContentHeight)
        layoutVsLeft = NSLayoutConstraint.leftToLeft(
            view:viewVs,
            toView:self,
            constant:kInitialVsLeft)
        NSLayoutConstraint.width(
            view:viewVs,
            constant:kVsWidth)
        
        NSLayoutConstraint.topToTop(
            view:viewUser,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.height(
            view:viewUser,
            constant:kContentHeight)
        NSLayoutConstraint.leftToLeft(
            view:viewUser,
            toView:self,
            constant:kMarginHorizontal)
        NSLayoutConstraint.rightToLeft(
            view:viewUser,
            toView:viewVs)

        NSLayoutConstraint.topToTop(
            view:viewNPC,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.height(
            view:viewNPC,
            constant:kContentHeight)
        NSLayoutConstraint.leftToRight(
            view:viewNPC,
            toView:viewVs)
        NSLayoutConstraint.rightToRight(
            view:viewNPC,
            toView:self,
            constant:-kMarginHorizontal)
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainVs:CGFloat = width - kVsWidth
        let marginVs:CGFloat = remainVs / 2.0
        layoutVsLeft.constant = marginVs
        
        super.layoutSubviews()
    }
    
    //MARK: public
    
    func update()
    {
        viewVs.update()
        viewUser.update()
        viewNPC.update()
    }
    
    func startCountDown()
    {
        guard
            
            let fighterUser:MFightFighter = controller.model.round?.fighterUser,
            let fighterNPC:MFightFighter = controller.model.round?.fighterNPC
        
        else
        {
            return
        }
        
        viewUser.loadFighter(
            fighter:fighterUser)
        viewNPC.loadFighter(
            fighter:fighterNPC)
        
        let viewCountDown:VFightInfoCountDown = VFightInfoCountDown(controller:controller)
        self.viewCountDown = viewCountDown
        addSubview(viewCountDown)
        
        NSLayoutConstraint.equals(
            view:viewCountDown,
            toView:self)
    }
    
    func removeCountDown()
    {
        viewCountDown?.removeFromSuperview()
    }
}
