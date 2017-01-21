import UIKit
import MetalKit

class MFightRound:MetalRenderableProtocol
{
    let fighterUser:MFightFighter
    let fighterNPC:MFightFighter
    let projection:MetalProjection
    private let projectionBuffer:MetalBufferableData
    
    init(
        device:MTLDevice,
        size:CGSize)
    {
        projection = MetalProjection(size:size)
        projectionBuffer = device.generateBuffer(bufferable:projection)
        
        let facingPositive:MFightFacingPositive = MFightFacingPositive()
        let facingNegative:MFightFacingNegative = MFightFacingNegative()
        
        fighterUser = MFightFighterTuring(
            device:device,
            facing:facingPositive)
        fighterNPC = MFightFighterGauss(
            device:device,
            facing:facingNegative)
    }
    
    //MARK: renderableProtocol
    
    func render(renderEncoder:MTLRenderCommandEncoder)
    {
        fighterNPC.render(renderEncoder:renderEncoder)
        fighterUser.render(renderEncoder:renderEncoder)
    }
}
