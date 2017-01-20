#ifndef MetalShaderStructs_h
#define MetalShaderStructs_h

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

#endif
