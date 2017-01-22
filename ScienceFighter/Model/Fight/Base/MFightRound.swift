import UIKit
import MetalKit

class MFightRound:MetalRenderableProtocol
{
    let fighterUser:MFightFighter
    let fighterNPC:MFightFighter
    let projection:MetalProjection
    private let kProjectionIndex:Int = 1
    
    init(device:MTLDevice)
    {
        let facingPositive:MFightFacingPositive = MFightFacingPositive()
        let facingNegative:MFightFacingNegative = MFightFacingNegative()
        
        fighterUser = MFightFighterTuring(
            device:device,
            facing:facingPositive)
        fighterNPC = MFightFighterGauss(
            device:device,
            facing:facingNegative)
        projection = MetalProjection(device:device)
    }
    
    //MARK: renderableProtocol
    
    func render(renderEncoder:MTLRenderCommandEncoder)
    {
        renderEncoder.setVertexBuffer(
            projection.projectionBuffer.buffer,
            offset:0,
            at:kProjectionIndex)
        
        fighterNPC.render(renderEncoder:renderEncoder)
        fighterUser.render(renderEncoder:renderEncoder)
    }
}
