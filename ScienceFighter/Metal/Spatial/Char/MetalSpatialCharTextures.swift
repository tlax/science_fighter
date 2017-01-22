import UIKit
import MetalKit

class MetalSpatialCharTextures
{
    let frontTextures:[MTLTexture]
    
    init(
        device:MTLDevice,
        frontImages:[UIImage])
    {
        var frontTextures:[MTLTexture] = []
        
        let textureLoader:MTKTextureLoader = MTKTextureLoader(device:device)
        
        for image:UIImage in frontImages
        {
            guard
                
                let texture:MTLTexture = textureLoader.loadImage(image:image)
                
            else
            {
                continue
            }
            
            frontTextures.append(texture)
        }
        
        self.frontTextures = frontTextures
    }
}
