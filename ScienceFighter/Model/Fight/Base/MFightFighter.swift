import Foundation
import MetalKit

class MFightFighter:MetalRenderableProtocol, MFightTickerProtocol
{
    let name:String
    let spatialChar:MetalSpatialChar
    let position:MFightPosition
    let facing:MFightFacing
    let kMaxHP:CGFloat = 100
    let kMovingSpeed:TimeInterval = 0.6
    weak var enemy:MFightFighter?
    private(set) var currentState:MFightFighterState?
    private(set) var currentHP:CGFloat
    private let kMovingDistance:Float = 20
    
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
        currentHP = kMaxHP
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
    
    //MARK: private
    
    private func reachPosition() -> Float
    {
        let normalizedReach:Float = facing.normalizeReach(
            position:position.positionX)
        
        return normalizedReach
    }
    
    //MARK: public
    
    func nextPositionPoint() -> Float
    {
        let positionDelta:Float = facing.normalizeDistance(distance:kMovingDistance)
        let nextPosition:Float = positionDelta + position.positionX
        
        return nextPosition
    }
    
    func positionOverlap(position:Float) -> Bool
    {
        let reach:Float = reachPosition()
        let isOverlaping:Bool = facing.overlaps(
            outsider:position,
            me:reach)
        
        return isOverlaping
    }
    
    //MARK: -states
    
    func stateStand()
    {
        currentState = MFightFighterStateStand(fighter:self)
    }
    
    func stateAdvance()
    {
        currentState = MFightFighterStateAdvance(fighter:self)
    }
    
    //MARK: tickerProtocol
    
    func tick(timestamp:TimeInterval)
    {
        currentState?.tick(timestamp:timestamp)
    }
}
