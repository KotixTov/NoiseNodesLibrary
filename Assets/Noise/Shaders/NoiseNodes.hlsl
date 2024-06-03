#include "Noise.hlsl"

void Noise_float(float value, float scale, out float Out)
{
    Out = Noise(value, scale);
}

void Noise2D_float(float2 value, float scale, out float Out)
{
    Out = Noise2D(value, scale);
}

void Noise3D_float(float3 value, float scale, out float Out)
{
    Out = Noise3D(value, scale);
}

void Noise4D_float(float4 value, float scale, out float Out)
{
    Out = Noise4D(value, scale);
}

void Perlin_float(float value, float scale, out float Out)
{
    Out = Perlin(value, scale);
}

void Perlin2D_float(float2 value, float scale, out float Out)
{
    Out = Perlin2D(value, scale);
}

void Perlin3D_float(float3 value, float scale, out float Out)
{
    Out = Perlin3D(value, scale);
}

void Perlin4D_float(float4 value, float scale, out float Out)
{
    Out = Perlin4D(value, scale);
}

void Voronoi_float(float value, float offset, float scale, out float Out, out float Cell)
{
    Out = Voronoi(value, offset, scale, Cell);
}

void Voronoi2D_float(float2 value, float offset, float scale, out float Out, out float2 Cell)
{
    Out = Voronoi2D(value, offset, scale, Cell);
}

void Voronoi3D_float(float3 value, float offset, float scale, out float Out, out float3 Cell)
{
    Out = Voronoi3D(value, offset, scale, Cell);
}

void Voronoi4D_float(float4 value, float offset, float scale, out float Out, out float4 Cell)
{
    Out = Voronoi4D(value, offset, scale, Cell);
}

void Voronoi2DEdge_float(float2 value, float offset, float scale, out float Out, out float2 Cell)
{
    Out = Voronoi2DEdge(value, offset, scale, Cell);
}
void Voronoi2DEdgeSmooth_float(float2 value, float offset, float scale, float smoothness, out float Out, out float2 Cell)
{
    Out = Voronoi2DEdgeSmooth(value, offset, scale, smoothness, Cell);
}
