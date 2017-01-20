import Foundation

class MetalVertexTextured:MetalVertex
{
    private let horizontal:Float
    private let vertical:Float
    
    init(
        positionX:Float,
        positionY:Float,
        positionZ:Float,
        horizontal:Float,
        vertical:Float)
    {
        self.horizontal = horizontal
        self.vertical = vertical
        
        super.init(
            positionX:positionX,
            positionY:positionY,
            positionZ:positionZ)
    }
    
    override func asBuffer() -> [Float]
    {
        var buffer:[Float] = super.asBuffer()
        buffer.append(horizontal)
        buffer.append(vertical)
        
        return buffer
    }
}
