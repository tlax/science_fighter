import Foundation
import MetalKit

class MFightFighter:MetalRenderableProtocol, MFightTickerProtocol
{
    let spatialChar:MetalSpatialChar
    let position:MFightPosition
    let facing:MFightFacing
    private(set) var currentState:MFighterState?
    
    init(
        device:MTLDevice,
        facing:MFightFacing)
    {
        fatalError()
    }
    
    init(
        spatialChar:MetalSpatialChar,
        facing:MFightFacing)
    {
        position = facing.initialPosition()
        self.spatialChar = spatialChar
        self.facing = facing
        
        stateStand()
        currentState?.updateTexture()
    }
    
    //MARK: renderableProtocol
    
    func render(renderEncoder:MTLRenderCommandEncoder)
    {
        guard
        
            let texture:MTLTexture = spatialChar.currentTexture
        
        else
        {
            return
        }
        
        let positionBuffer:MTLBuffer = renderEncoder.device.generateBuffer(
            bufferable:position)
        
        renderEncoder.render(
            vertex:spatialChar.vertexBuffer,
            position:positionBuffer,
            texture:texture)
    }
    
    //MARK: tickerProtocol
    
    func tick(timestamp:TimeInterval)
    {
        currentState?.tick(timestamp:timestamp)
    }
    
    //MARK: public
    //MARK: -states
    
    func stateStand()
    {
        currentState = MFighterStateStand(fighter:self)
    }
}
