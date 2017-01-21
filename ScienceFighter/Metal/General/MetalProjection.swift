import UIKit

class MetalProjection
{
    let minY:Float
    let maxY:Float
    let minX:Float
    let maxX:Float
    let projectionBuffer:MetalBufferableData
    
    init(
        device:MTLDevice,
        size:CGSize)
    {
        let projectionMatrix:MetalProjectionMatrix = MetalProjectionMatrix(
            size:size)
        
        projectionBuffer = device.generateBuffer(
            bufferable:projectionMatrix)
        minY = projectionMatrix.minY
        maxY = projectionMatrix.maxY
        minX = projectionMatrix.minX
        maxX = projectionMatrix.maxX
    }
}
