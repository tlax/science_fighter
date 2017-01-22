import Foundation
import MetalKit

class MetalSpatialBase
{
    let vertexBuffer:MetalBufferableData
    private let kHalf:Float = 2.0
    private let kTextureTop:Float = 0
    private let kTextureBottom:Float = 1
    private let kTextureLeft:Float = 0
    private let kTextureRight:Float = 1
    
    init(vertexBuffer:MetalBufferableData)
    {
        self.vertexBuffer = vertexBuffer
    }
    
    init(
        device:MTLDevice,
        width:Float,
        height:Float)
    {
        let width_2:Float = width / kHalf
        let height_2:Float = height / kHalf
        let top:Float = height_2
        let bottom:Float = -height_2
        let left:Float = -width_2
        let right:Float = width_2
        
        let vertexTopLeft:MetalVertex = MetalVertex(
            positionX:left,
            positionY:top)
        let vertexTopRight:MetalVertex = MetalVertex(
            positionX:right,
            positionY:top)
        let vertexBottomLeft:MetalVertex = MetalVertex(
            positionX:left,
            positionY:bottom)
        let vertexBottomRight:MetalVertex = MetalVertex(
            positionX:right,
            positionY:bottom)
        
        let vertexFace:MetalVertexFace = MetalVertexFace(
            topLeft:vertexTopLeft,
            topRight:vertexTopRight,
            bottomLeft:vertexBottomLeft,
            bottomRight:vertexBottomRight)
        
        vertexBuffer = device.generateBuffer(bufferable:vertexFace)
    }
}
