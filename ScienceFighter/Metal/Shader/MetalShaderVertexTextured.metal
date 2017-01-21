#include <metal_stdlib>

using namespace metal;
#include "MetalShaderStructs.h"

static constant float coord_z = 0;
static constant float destination_position = 1;

vertex vertex_destination
vertex_textured(const device vertex_source* vertex_array [[buffer(0)]],
                const device projection_matrix& projection [[buffer(1)]],
                unsigned int vid [[vertex_id]])
{
    vertex_source source = vertex_array[vid];
    vertex_destination destination;
    
    float coord_x = source.coords[0];
    float coord_y = source.coords[1];
    float projected_x = coord_x * projection.project_width;
    float projected_y = coord_y * projection.project_height;
    float final_x = projected_x;
    float final_y = projected_y;
    float4 coords = float4(final_x, final_y, coord_z, destination_position);
    
    destination.coords = coords;
    destination.texture = source.texture;
    
    return destination;
}
