import Foundation
import MetalKit

class MFightFighter:MetalRenderableProtocol
{
    let spatialChar:MetalSpatialChar
    let position:MFightPosition
    let facing:MFightFacing
    private let kVertexIndex:Int = 0
    private let kPositionIndex:Int = 2
    private let kTextureIndex:Int = 0
    
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
        
        let dataPosition:MetalBufferableData = renderEncoder.device.generateBuffer(
            bufferable:position)
        
        renderEncoder.setVertexBuffer(
            spatialChar.vertexBuffer.buffer,
            offset:0,
            at:kVertexIndex)
        renderEncoder.setVertexBuffer(
            dataPosition.buffer,
            offset:0,
            at:kPositionIndex)
        renderEncoder.setFragmentTexture(
            texture,
            at:kTextureIndex)
        renderEncoder.drawPrimitives(
            type:MetalConstants.kPrimitiveType,
            vertexStart:0,
            vertexCount:spatialChar.vertexBuffer.length)
    }
}
