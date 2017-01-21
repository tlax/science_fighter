import MetalKit

extension MTLDevice
{
    func generateBuffer(bufferable:MetalBufferableProtocol) -> MetalBufferableData
    {
        let data:[Float] = bufferable.buffer()
        let dataLength:Int = data.count
        let dataSize:Int = dataLength * MetalConstants.kBufferElementSize
        let buffer:MTLBuffer = makeBuffer(
            bytes:data,
            length:dataSize,
            options:MTLResourceOptions())
        let bufferableData:MetalBufferableData = MetalBufferableData(
            buffer:buffer,
            length:dataLength)
        
        return bufferableData
    }
}
