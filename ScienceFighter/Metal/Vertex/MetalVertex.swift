import Foundation

class MetalVertex
{
    private let positionX:Float
    private let positionY:Float
    private let kPositionZ:Float = 0
    
    init(
        positionX:Float,
        positionY:Float)
    {
        self.positionX = positionX
        self.positionY = positionY
    }
    
    //MARK: public
    
    func asBuffer() -> [Float]
    {
        let buffer:[Float] = [
            positionX,
            positionY,
            kPositionZ
        ]
        
        return buffer
    }
}
