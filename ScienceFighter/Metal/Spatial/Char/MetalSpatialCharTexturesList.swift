import Foundation
import MetalKit

class MetalSpatialCharTexturesList
{
    private let textures:[MTLTexture]
    private let count:UInt32
    
    init(textures:[MTLTexture])
    {
        self.textures = textures
        count = UInt32(textures.count)
    }
    
    //MARK: public
    
    func random() -> MTLTexture
    {
        let randomIndex:Int = Int(arc4random_uniform(count))
        let randomTexture:MTLTexture = textures[randomIndex]
        
        return randomTexture
    }
}
