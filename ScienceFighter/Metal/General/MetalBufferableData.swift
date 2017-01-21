import MetalKit

class MetalBufferableData
{
    let buffer:MTLBuffer
    let size:Int
    
    init(buffer:MTLBuffer, size:Int)
    {
        self.buffer = buffer
        self.size = size
    }
}
