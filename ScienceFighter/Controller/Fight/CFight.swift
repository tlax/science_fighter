import UIKit

class CFight:CController
{
    let model:MFight
    private weak var viewFight:VFight!
    
    override init()
    {
        model = MFight()
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
}
