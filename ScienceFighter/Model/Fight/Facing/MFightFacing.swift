import Foundation

class MFightFacing
{
    let kInitialX:Float = 200
    let kInitialY:Float = -50
    
    //MARK: public
    
    func initialPosition() -> MFightPosition
    {
        fatalError()
    }
    
    func direction() -> MetalSpatialBaseTexturedDirection
    {
        fatalError()
    }
    
    func normalizeDistance(distance:Float) -> Float
    {
        return distance
    }
}
