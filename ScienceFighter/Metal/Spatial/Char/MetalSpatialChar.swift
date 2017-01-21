import Foundation

class MetalSpatialChar:MetalSpatialBaseTextured
{
    private let kWidth:Float = 100
    private let kHeight:Float = 100
    
    init(positionX:Float, positionY:Float)
    {
        super.init(
            positionX:positionX,
            positionY:positionY,
            width:kWidth,
            height:kHeight)
    }
}
