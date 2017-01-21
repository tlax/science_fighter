import Foundation

class MetalVertexFace
{
    private let topLeft:MetalVertex
    private let topRight:MetalVertex
    private let bottomLeft:MetalVertex
    private let bottomRight:MetalVertex
    
    init(
        topLeft:MetalVertex,
        topRight:MetalVertex,
        bottomLeft:MetalVertex,
        bottomRight:MetalVertex)
    {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
    }
    
    //MARK: public
    
    func asBuffer() -> [Float]
    {
        var buffer:[Float] = []
        
        buffer.append(contentsOf:topLeft.asBuffer())
        buffer.append(contentsOf:bottomLeft.asBuffer())
        buffer.append(contentsOf:topRight.asBuffer())
        buffer.append(contentsOf:topRight.asBuffer())
        buffer.append(contentsOf:bottomLeft.asBuffer())
        buffer.append(contentsOf:bottomRight.asBuffer())
        
        return buffer
    }
    
    func sizeOfItem() -> Int
    {
        let size:Int = topLeft.sizeOfItem()
        
        return size
    }
}
