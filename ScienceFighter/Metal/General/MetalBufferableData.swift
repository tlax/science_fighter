import MetalKit

class MetalBufferableData
{
    let buffer:MTLBuffer
    let length:Int
    
    init(buffer:MTLBuffer, length:Int)
    {
        self.buffer = buffer
        self.length = length
    }
}
