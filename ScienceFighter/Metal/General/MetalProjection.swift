import Foundation

class MetalProjection:MetalBufferableProtocol
{
    private let ratioX:Float
    private let ratioY:Float
    private let kRatioZ:Float = 0
    
    init(
        screenWidth:Float,
        screenHeight:Float)
    {
        ratioY = 1
        ratioX = 1
    }
    
    //MARK: bufferableProtocol
    
    func buffer() -> [Float]
    {
        let bufferArray:[Float] = [
            ratioX,
            ratioY,
            kRatioZ
        ]
        
        return bufferArray
    }
}
