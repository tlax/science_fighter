#include <metal_stdlib>

using namespace metal;
#include "MetalShaderStructs.h"

vertex vertex_destination vertex_textured(const device vertex_source* vertex_array [[buffer(0)]],
                                           unsigned int vid [[vertex_id]])
{
    float4 asd = float4(0.1,0.2,1,1);
    
    vertex_source source = vertex_array[vid];
    vertex_destination destination;
    destination.position = asd * float4(source.position, 1);
    destination.texture = source.texture;
    
    return destination;
}
