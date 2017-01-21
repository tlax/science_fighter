#include <metal_stdlib>

using namespace metal;
#include "MetalShaderStructs.h"

vertex vertex_destination vertex_textured(const device vertex_source* vertex_array [[buffer(0)]],
                                          const device projection_matrix& projection [[buffer(1)]],
                                          unsigned int vid [[vertex_id]])
{
    vertex_source source = vertex_array[vid];
    vertex_destination destination;
    destination.coords = float4(source.coords * projection.matrix, 1);
    destination.texture = source.texture;
    
    return destination;
}
