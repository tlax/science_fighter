#include <metal_stdlib>

using namespace metal;
#include "MetalShaderStructs.h"

vertex vertex_destination vertex_textured(const device vertex_source* vertex_array [[buffer(0)]],
                                           unsigned int vid [[vertex_id]])
{
    float3 asd = float3(0.1,0.2,1);
    
    vertex_source source = vertex_array[vid];
    vertex_destination destination;
    destination.coords = float4(source.coords * asd, 1);
    destination.texture = source.texture;
    
    return destination;
}
