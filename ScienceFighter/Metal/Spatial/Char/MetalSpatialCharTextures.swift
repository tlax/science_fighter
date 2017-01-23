import UIKit
import MetalKit

class MetalSpatialCharTextures
{
    let standTextures:MetalSpatialCharTexturesList
    
    init(
        device:MTLDevice,
        standImages:[UIImage])
    {
        var standTextures:[MTLTexture] = []
        let textureLoader:MTKTextureLoader = MTKTextureLoader(device:device)
        
        for image:UIImage in standImages
        {
            guard
                
                let texture:MTLTexture = textureLoader.loadImage(image:image)
                
            else
            {
                continue
            }
            
            standTextures.append(texture)
        }
        
        self.standTextures = MetalSpatialCharTexturesList(textures:standTextures)
    }
}
