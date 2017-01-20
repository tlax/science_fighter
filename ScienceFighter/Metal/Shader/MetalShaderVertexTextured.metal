#include <metal_stdlib>
using namespace metal;

struct vertex_source
{
    packed_float3 position;
    packed_float2 texture;
};

struct vertex_destination
{
    float4 position [[position]];
    float2 texture;
};

vertex vertex_destination vertex_textured(const device vertex_source* vertex_array [[buffer(0)]],
                                           unsigned int vid [[vertex_id]])
{
    vertex_source source = vertex_array[vid];
    vertex_destination destination;
    destination.position = float4(source.position, 1);
    destination.texture = source.texture;
    
    return destination;
}
