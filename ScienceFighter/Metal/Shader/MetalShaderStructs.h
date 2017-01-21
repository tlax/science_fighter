#ifndef MetalShaderStructs_h
#define MetalShaderStructs_h

struct vertex_source
{
    packed_float3 coords;
    packed_float2 texture;
};

struct vertex_destination
{
    float4 coords [[position]];
    float2 texture;
};

struct projection_matrix
{
    packed_float3 matrix;
};

#endif
