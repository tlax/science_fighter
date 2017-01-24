import Foundation
import MetalKit

class MFightFighter:MetalRenderableProtocol, MFightTickerProtocol
{
    let name:String
    let spatialChar:MetalSpatialChar
    let position:MFightPosition
    let facing:MFightFacing
    let kMovingSpeed:TimeInterval = 0.6
    let kMovingDistance:Float = 20
    private(set) var currentState:MFightFighterState?
    
    init(
        device:MTLDevice,
        facing:MFightFacing)
    {
        fatalError()
    }
    
    init(
        spatialChar:MetalSpatialChar,
        facing:MFightFacing,
        name:String)
    {
        position = facing.initialPosition()
        self.spatialChar = spatialChar
        self.facing = facing
        self.name = name
        
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
        currentState = MFightFighterStateStand(fighter:self)
    }
    
    func stateAdvance()
    {
        currentState = MFightFighterStateAdvance(fighter:self)
    }
}
