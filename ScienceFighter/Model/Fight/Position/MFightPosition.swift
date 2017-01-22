import Foundation

class MFightPosition:MetalBufferableProtocol
{
    class func zero() -> MFightPosition
    {
        let position:MFightPosition = MFightPosition(positionX:0, positionY:0)
        
        return position
    }
    
    var positionX:Float
    var positionY:Float
    
    init(positionX:Float, positionY:Float)
    {
        self.positionX = positionX
        self.positionY = positionY
    }
    
    //MARK: bufferableProtocol
    
    func buffer() -> [Float]
    {
        let bufferArray:[Float] = [
            positionX,
            positionY
        ]
        
        return bufferArray
    }
}
