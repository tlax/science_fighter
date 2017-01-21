import UIKit
import MetalKit

class MetalSpatialCharTextures
{
    let frontTextures:[MTLTexture]
    
    init(
        frontImages:[UIImage],
        device:MTLDevice)
    {
        var frontTextures:[MTLTexture] = []
        
        let textureLoader:MTKTextureLoader = MTKTextureLoader(device:device)
        
        for image:UIImage in frontImages
        {
            guard
                
                let cgImage:CGImage = image.cgImage
                
            else
            {
                continue
            }
            
            let texture:MTLTexture
            
            do
            {
                texture = try textureLoader.newTexture(
                    with:cgImage,
                    options:[
                        MTKTextureLoaderOptionTextureUsage:MetalConstants.kTextureUsage,
                        MTKTextureLoaderOptionSRGB:MetalConstants.kTextureSrgb])
            }
            catch
            {
                continue
            }
            
            frontTextures.append(texture)
        }
        
        self.frontTextures = frontTextures
    }
}
