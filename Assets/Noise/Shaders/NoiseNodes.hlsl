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