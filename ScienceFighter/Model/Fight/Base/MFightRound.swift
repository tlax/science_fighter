import UIKit
import MetalKit

class MFightRound:MetalRenderableProtocol, MFightTickerProtocol
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
        fighterUser.enemy = fighterNPC
        fighterNPC.enemy = fighterUser
        scene = MFightSceneLondon(device:device)
        projection = MetalProjection(device:device)
    }
    
    //MARK: renderableProtocol
    
    func render(renderEncoder:MTLRenderCommandEncoder)
    {
        renderEncoder.projectionMatrix(
            projection:projection.projectionBuffer)
        
        scene.render(renderEncoder:renderEncoder)
        fighterNPC.render(renderEncoder:renderEncoder)
        fighterUser.render(renderEncoder:renderEncoder)
    }
    
    //MARK: tickerProtocol
    
    func tick(timestamp:TimeInterval)
    {
        fighterUser.tick(timestamp:timestamp)
        fighterNPC.tick(timestamp:timestamp)
        scene.tick(timestamp:timestamp)
    }
}
