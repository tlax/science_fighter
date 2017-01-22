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
}
