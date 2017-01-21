import MetalKit

class MetalConstants
{
    static let kPixelFormat:MTLPixelFormat = MTLPixelFormat.bgra8Unorm
    static let kRgbBlendOperation:MTLBlendOperation = MTLBlendOperation.add
    static let kAlphaBlendOperation:MTLBlendOperation = MTLBlendOperation.add
    static let kSourceRgbBlendFactor:MTLBlendFactor = MTLBlendFactor.one
    static let kSourceAlphaBlendFactor:MTLBlendFactor = MTLBlendFactor.one
    static let kDestinationRgbBlendFactor:MTLBlendFactor = MTLBlendFactor.oneMinusSourceAlpha
    static let kDestinationAlphaBlendFactor:MTLBlendFactor = MTLBlendFactor.oneMinusSourceAlpha
    static let kSamplerMinFilter:MTLSamplerMinMagFilter = MTLSamplerMinMagFilter.linear
    static let kSamplerMagFilter:MTLSamplerMinMagFilter = MTLSamplerMinMagFilter.linear
    static let kSamplerMipFilter:MTLSamplerMipFilter = MTLSamplerMipFilter.linear
    static let kSamplerSAddressMode:MTLSamplerAddressMode = MTLSamplerAddressMode.clampToEdge
    static let kSamplerTAddressMode:MTLSamplerAddressMode = MTLSamplerAddressMode.clampToEdge
    static let kSamplerRAddressMode:MTLSamplerAddressMode = MTLSamplerAddressMode.clampToEdge
    static let kTextureUsage:NSObject = MTLTextureUsage.renderTarget.rawValue as NSObject
    static let kTextureSrgb:NSObject = true as NSObject
    static let kVertexFunction:String = "vertex_textured"
    static let kFragmentFunction:String = "fragment_simple"
    static let kSamplerLodMaxClamp:Float = FLT_MAX
    static let kSamplerLodMinClamp:Float = 0
    static let kSamplerMaxAnisotropy:Int = 1
    static let kBufferElementSize:Int = 4
    static let kColorAttachmentIndex:Int = 0
    static let kBlendingEnabled:Bool = true
    static let kSamplerNormalizedCoordinates:Bool = true
}
