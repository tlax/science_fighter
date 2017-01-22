import Foundation
import MetalKit

class MetalSpatialBaseTextured:MetalSpatialBase
{
    weak var currentTexture:MTLTexture?
    private let kHalf:Float = 2.0
    private let kTextureTop:Float = 0
    private let kTextureBottom:Float = 1
    private let kTextureLeft:Float = 0
    private let kTextureRight:Float = 1
    
    init(
        device:MTLDevice,
        width:Float,
        height:Float,
        textureDirections:Float)
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
            horizontal:kTextureLeft,
            vertical:kTextureTop)
        let vertexTopRight:MetalVertexTextured = MetalVertexTextured(
            positionX:right,
            positionY:top,
            horizontal:kTextureRight,
            vertical:kTextureTop)
        let vertexBottomLeft:MetalVertexTextured = MetalVertexTextured(
            positionX:left,
            positionY:bottom,
            horizontal:kTextureLeft,
            vertical:kTextureBottom)
        let vertexBottomRight:MetalVertexTextured = MetalVertexTextured(
            positionX:right,
            positionY:bottom,
            horizontal:kTextureRight,
            vertical:kTextureBottom)
        
        let vertexFace:MetalVertexFace = MetalVertexFace(
            topLeft:vertexTopLeft,
            topRight:vertexTopRight,
            bottomLeft:vertexBottomLeft,
            bottomRight:vertexBottomRight)
        
        let vertexBuffer:MetalBufferableData = device.generateBuffer(bufferable:vertexFace)
        super.init(vertexBuffer:vertexBuffer)
    }
}
