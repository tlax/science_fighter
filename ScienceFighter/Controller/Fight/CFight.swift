import UIKit

class CFight:CController
{
    let model:MFight
    private weak var viewFight:VFight!
    private var previousTimestamp:TimeInterval
    private let kUpdateThreshold:TimeInterval = 0.2
    
    override init()
    {
        model = MFight()
        previousTimestamp = 0
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
    
    override func loadView()
    {
        let viewFight:VFight = VFight(controller:self)
        self.viewFight = viewFight
        view = viewFight
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        if model.round == nil
        {
            viewFight.loadMetal()
            
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak self] in
                
                guard
                    
                    let device:MTLDevice = self?.viewFight.viewMetal?.device
                
                else
                {
                    self?.errorLoading()
                    
                    return
                }
                
                self?.model.load(device:device)
                
                DispatchQueue.main.async
                { [weak self] in
                    
                    self?.viewFight.loadFinished()
                }
            }
        }
    }
    
    //MARK: private
    
    private func errorLoading()
    {
        
    }
    
    //MARK: public
    
    func tick()
    {
        let currentTimestamp:TimeInterval = Date().timeIntervalSince1970
        let deltaTimestamp:TimeInterval = currentTimestamp - previousTimestamp
        
        if deltaTimestamp >= kUpdateThreshold
        {
            previousTimestamp = currentTimestamp
            model.tick(timestamp:currentTimestamp)
        }
    }
    
    func countDownFinish()
    {
        viewFight.startFight()
    }
}
