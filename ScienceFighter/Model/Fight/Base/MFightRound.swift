import UIKit
import MetalKit

class MFightRound:MetalRenderableProtocol
{
    let scene:MFightScene
    let fighterUser:MFightFighter
    let fighterNPC:MFightFighter
    let projection:MetalProjection
    
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
        scene = MFightSceneLondon(device:device)
        projection = MetalProjection(device:device)
    }
    
    //MARK: renderableProtocol
    
    func render(renderEncoder:MTLRenderCommandEncoder)
    {
        renderEncoder.setVertexBuffer(
            projection.projectionBuffer.buffer,
            offset:0,
            at:MetalConstants.kProjectionIndex)
        
//        scene.render(renderEncoder:renderEncoder)
        fighterNPC.render(renderEncoder:renderEncoder)
        fighterUser.render(renderEncoder:renderEncoder)
    }
}
