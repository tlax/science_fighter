import Foundation
import MetalKit

class MetalSpatialBaseTextured:MetalSpatialBase
{
    weak var currentTexture:MTLTexture?
    private let kHalf:Float = 2.0
    
    init(
        device:MTLDevice,
        width:Float,
        height:Float,
        direction:MetalSpatialBaseTexturedDirection)
    {
        let width_2:Float = width / kHalf
        let height_2:Float = height / kHalf
        let top:Float = height_2
        let bottom:Float = -height_2
        let left:Float = -width_2
        let right:Float = width_2
        
        let vertexTopLeft:MetalVertexTextured = MetalVertexTextured(
            positionX:left,
            positionY:top,
            horizontal:direction.left,
            vertical:direction.top)
        let vertexTopRight:MetalVertexTextured = MetalVertexTextured(
            positionX:right,
            positionY:top,
            horizontal:direction.right,
            vertical:direction.top)
        let vertexBottomLeft:MetalVertexTextured = MetalVertexTextured(
            positionX:left,
            positionY:bottom,
            horizontal:direction.left,
            vertical:direction.bottom)
        let vertexBottomRight:MetalVertexTextured = MetalVertexTextured(
            positionX:right,
            positionY:bottom,
            horizontal:direction.right,
            vertical:direction.bottom)
        
        let vertexFace:MetalVertexFace = MetalVertexFace(
            topLeft:vertexTopLeft,
            topRight:vertexTopRight,
            bottomLeft:vertexBottomLeft,
            bottomRight:vertexBottomRight)
        
        let vertexBuffer:MetalBufferableData = device.generateBuffer(bufferable:vertexFace)
        super.init(vertexBuffer:vertexBuffer)
    }
}
