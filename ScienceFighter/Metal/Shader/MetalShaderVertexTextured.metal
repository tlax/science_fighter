#include <metal_stdlib>

using namespace metal;
#include "MetalShaderStructs.h"

vertex vertex_destination vertex_textured(const device vertex_source* vertex_array [[buffer(0)]],
                                          const device float* projection [[buffer(1)]],
                                          unsigned int vid [[vertex_id]])
{
    float3 asd = float3(projection[0], projection[1], projection[2]);
    
    vertex_source source = vertex_array[vid];
    vertex_destination destination;
    destination.coords = float4(source.coords * asd, 1);
    destination.texture = source.texture;
    
    return destination;
}
