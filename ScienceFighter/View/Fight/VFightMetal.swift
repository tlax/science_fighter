import MetalKit

class VFightMetal:MTKView
{
    private weak var controller:CFight!
    private let samplerState:MTLSamplerState
    private let commandQueue:MTLCommandQueue
    private let pipelineState:MTLRenderPipelineState
    private let kFragmentSamplerIndex:Int = 0
    
    init?(controller:CFight)
    {
        guard
            
            let device:MTLDevice = MTLCreateSystemDefaultDevice(),
            let library:MTLLibrary = device.newDefaultLibrary(),
            let vertexFunction:MTLFunction = library.makeFunction(
                name:MetalConstants.kVertexFunction),
            let fragmentFunction:MTLFunction = library.makeFunction(
                name:MetalConstants.kFragmentFunction)
        
        else
        {
            return nil
        }
        
        commandQueue = device.makeCommandQueue()
        
        let sampleDescriptor = MTLSamplerDescriptor()
        sampleDescriptor.minFilter = MetalConstants.kSamplerMinFilter
        sampleDescriptor.magFilter = MetalConstants.kSamplerMagFilter
        sampleDescriptor.mipFilter = MetalConstants.kSamplerMipFilter
        sampleDescriptor.sAddressMode = MetalConstants.kSamplerSAddressMode
        sampleDescriptor.tAddressMode = MetalConstants.kSamplerTAddressMode
        sampleDescriptor.rAddressMode = MetalConstants.kSamplerRAddressMode
        sampleDescriptor.lodMinClamp = MetalConstants.kSamplerLodMinClamp
        sampleDescriptor.lodMaxClamp = MetalConstants.kSamplerLodMaxClamp
        sampleDescriptor.maxAnisotropy = MetalConstants.kSamplerMaxAnisotropy
        sampleDescriptor.normalizedCoordinates = MetalConstants.kSamplerNormalizedCoordinates
        samplerState = device.makeSamplerState(descriptor:sampleDescriptor)
        
        let pipelineDescriptor:MTLRenderPipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        
        let colorAttachment:MTLRenderPipelineColorAttachmentDescriptor = pipelineDescriptor.colorAttachments[
            MetalConstants.kColorAttachmentIndex]
        colorAttachment.pixelFormat = MetalConstants.kPixelFormat
        colorAttachment.isBlendingEnabled = MetalConstants.kBlendingEnabled
        colorAttachment.rgbBlendOperation = MetalConstants.kRgbBlendOperation
        colorAttachment.alphaBlendOperation = MetalConstants.kAlphaBlendOperation
        colorAttachment.sourceRGBBlendFactor = MetalConstants.kSourceRgbBlendFactor
        colorAttachment.sourceAlphaBlendFactor = MetalConstants.kSourceAlphaBlendFactor
        colorAttachment.destinationRGBBlendFactor = MetalConstants.kDestinationRgbBlendFactor
        colorAttachment.destinationAlphaBlendFactor = MetalConstants.kDestinationAlphaBlendFactor
        
        do
        {
            try pipelineState = device.makeRenderPipelineState(descriptor:pipelineDescriptor)
        }
        catch
        {
            return nil
        }
        
        super.init(
            frame:CGRect.zero,
            device:device)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        contentMode = UIViewContentMode.center
        autoResizeDrawable = false
        isHidden = true
        isPaused = true
        self.controller = controller
    }
    
    required init(coder:NSCoder)
    {
        fatalError()
    }
    
    override func draw()
    {
        super.draw()
        
        guard
        
            let drawable:CAMetalDrawable = currentDrawable,
            let passDescriptor:MTLRenderPassDescriptor = currentRenderPassDescriptor
        
        else
        {
            return
        }
        
        let commandBuffer:MTLCommandBuffer = commandQueue.makeCommandBuffer()
        let renderEncoder:MTLRenderCommandEncoder = commandBuffer.makeRenderCommandEncoder(
            descriptor:passDescriptor)
        renderEncoder.setCullMode(MTLCullMode.none)
        renderEncoder.setRenderPipelineState(pipelineState)
        renderEncoder.setFragmentSamplerState(samplerState, at:kFragmentSamplerIndex)
        controller.model.round?.render(renderEncoder:renderEncoder)
        
        renderEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
