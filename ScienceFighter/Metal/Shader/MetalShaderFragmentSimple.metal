#include <metal_stdlib>

using namespace metal;
#include "MetalShaderStructs.h"

fragment float4 fragment_simple(vertex_destination interpolated [[stage_in]],
                               texture2d<float>  tex2D     [[texture(0)]],
                               sampler           sampler2D [[sampler(0)]])
{
    float4 color = tex2D.sample(sampler2D, interpolated.texture);
    return color;
}
