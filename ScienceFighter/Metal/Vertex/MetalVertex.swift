import Foundation

class MetalVertex
{
    private let positionX:Float
    private let positionY:Float
    private let positionZ:Float
    
    init(
        positionX:Float,
        positionY:Float,
        positionZ:Float)
    {
        self.positionX = positionX
        self.positionY = positionY
        self.positionZ = positionZ
    }
    
    //MARK: public
    
    func asBuffer() -> [Float]
    {
        let buffer:[Float] = [
            positionX,
            positionY,
            positionZ
        ]
        
        return buffer
    }
}
