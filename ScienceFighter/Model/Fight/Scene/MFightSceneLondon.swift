import Foundation
import MetalKit

class MFightSceneLondon:MFightScene
{
    override init(device:MTLDevice)
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetSceneLondon01")
        ]
        
        let sceneTextures:MetalSpatialSceneTextures = MetalSpatialSceneTextures(
            device:device,
            images:images)
        
        let spatialScene:MetalSpatialScene = MetalSpatialScene(
            device:device,
            textures:sceneTextures)
        
        super.init(spatialScene:spatialScene)
    }
}
