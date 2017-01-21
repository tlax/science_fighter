import UIKit

class MetalProjection:MetalBufferableProtocol
{
    private let ratioX:Float
    private let ratioY:Float
    private let kRatioZ:Float = 0
    
    init(size:CGSize)
    {
        let floatWidth:Float = Float(size.width)
        let floatHeight:Float = Float(size.height)
        ratioX = floatWidth / floatHeight
        ratioY = floatHeight / floatWidth
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
