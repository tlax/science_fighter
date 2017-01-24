import Foundation

class MFightFacing
{
    let kInitialX:Float = 200
    let kInitialY:Float = -50
    let kReachDelta:Float = 30
    
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
        fatalError()
    }
    
    func normalizeReach(position:Float) -> Float
    {
        fatalError()
    }
    
    func overlaps(outsider:Float, me:Float) -> Bool
    {
        fatalError()
    }
}
