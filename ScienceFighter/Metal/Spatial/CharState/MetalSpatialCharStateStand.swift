import Foundation

class MetalSpatialCharStateStand:MetalSpatialCharState
{
    private let kUpdateTextureRate:UInt32 = 20
    
    override func tick(timestamp:TimeInterval)
    {
        let shouldUpdateTexture:UInt32 = arc4random_uniform(kUpdateTextureRate)
        
        if shouldUpdateTexture == 0
        {
            updateTexture()
        }
        else
        {
            print("don't update")
        }
    }
}
