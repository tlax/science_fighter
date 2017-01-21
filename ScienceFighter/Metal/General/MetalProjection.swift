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
        let minSize:Float = min(floatWidth, floatHeight)
        let deltaScale:Float = 1 / minSize
        let proportionX:Float = floatHeight / minSize
        let proportionY:Float = floatWidth / minSize
        ratioX = proportionX * deltaScale
        ratioY = proportionY * deltaScale
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
