float random(float value)
{
    return frac(sin(value) * 2746313);
}

float random2D(float2 value)
{
    //make value smaller to avoid artefacts
    float2 smallValue = sin(value);
    //get scalar value from 2d vector
    float random = dot(smallValue, float2(13.37, 42.0));
    //make value more random by making it bigger and then taking the factional part
    return frac(sin(random) * 2746313);
}

float random3D(float3 value)
{
    //make value smaller to avoid artefacts
    float3 smallValue = sin(value);
    //get scalar value from 3d vector
    float random = dot(smallValue, float3(13.37, 42.0, 22.8));
    //make value more random by making it bigger and then taking the factional part
    return frac(sin(random) * 2746313);
}

float random4D(float4 value)
{
    //make value smaller to avoid artefacts
    float4 smallValue = sin(value);
    //get scalar value from 4d vector
    float random = dot(smallValue, float4(13.37, 42.0, 22.8, 69.69));
    //make value more random by making it bigger and then taking the factional part
    return frac(sin(random) * 2746313);
}

float Noise(float value, float scale)
{
    value *= scale;
    float id = floor(value);
    float localValue = frac(value);

    float x0 = random(id);
    float x1 = random(id + 1);

    float4 smoothstep = localValue * localValue * (3 - 2 * localValue);

    return lerp(x0, x1, smoothstep);
}

float Noise2D(float2 value, float scale)
{
    value *= scale;
    float2 id = floor(value);
    float2 localValue = frac(value);
    
    float x0y0 = random2D(id);
    float x1y0 = random2D(id + float2(1, 0));
    float x0y1 = random2D(id + float2(0, 1));
    float x1y1 = random2D(id + float2(1, 1));

    float2 smoothstep = localValue * localValue * (3 - 2 * localValue);


    float2 ylerp = lerp(float2(x0y0, x1y0), float2(x0y1, x1y1), smoothstep.y);

    return  lerp(ylerp.x, ylerp.y, smoothstep.x);
}

float Noise3D(float3 value, float scale)
{
    value *= scale;
    float3 id = floor(value);
    float3 localValue = frac(value);
    
    float x0y0z0 = random3D(id);
    float x1y0z0 = random3D(id + float3(1, 0, 0));
    float x0y1z0 = random3D(id + float3(0, 1, 0));
    float x1y1z0 = random3D(id + float3(1, 1, 0));
    float x0y0z1 = random3D(id + float3(0, 0, 1));
    float x1y0z1 = random3D(id + float3(1, 0, 1));
    float x0y1z1 = random3D(id + float3(0, 1, 1));
    float x1y1z1 = random3D(id + float3(1, 1, 1));

    float3 smoothstep = localValue * localValue * (3 - 2 * localValue);

    float4 zlerp = lerp(float4(x0y0z0, x1y0z0, x0y1z0, x1y1z0), float4(x0y0z1, x1y0z1, x0y1z1, x1y1z1), smoothstep.z);
    float2 ylerp = lerp(zlerp.xy, zlerp.zw, smoothstep.y);

    return  lerp(ylerp.x, ylerp.y, smoothstep.x);
}

float Noise4D(float4 value, float scale)
{
    value *= scale;
    float4 id = floor(value);
    float4 localValue = frac(value);
    
    float x0y0z0w0 = random4D(id);
    float x1y0z0w0 = random4D(id + float4(1, 0, 0, 0));
    float x0y1z0w0 = random4D(id + float4(0, 1, 0, 0));
    float x1y1z0w0 = random4D(id + float4(1, 1, 0, 0));
    float x0y0z1w0 = random4D(id + float4(0, 0, 1, 0));
    float x1y0z1w0 = random4D(id + float4(1, 0, 1, 0));
    float x0y1z1w0 = random4D(id + float4(0, 1, 1, 0));
    float x1y1z1w0 = random4D(id + float4(1, 1, 1, 0));
    float x0y0z0w1 = random4D(id + float4(0, 0, 0, 1));
    float x1y0z0w1 = random4D(id + float4(1, 0, 0, 1));
    float x0y1z0w1 = random4D(id + float4(0, 1, 0, 1));
    float x1y1z0w1 = random4D(id + float4(1, 1, 0, 1));
    float x0y0z1w1 = random4D(id + float4(0, 0, 1, 1));
    float x1y0z1w1 = random4D(id + float4(1, 0, 1, 1));
    float x0y1z1w1 = random4D(id + float4(0, 1, 1, 1));
    float x1y1z1w1 = random4D(id + float4(1, 1, 1, 1));

    float4 smoothstep = localValue * localValue * (3 - 2 * localValue);

    float4 wLerp1 = lerp(float4(x0y0z0w0, x1y0z0w0, x0y1z0w0, x1y1z0w0), float4(x0y0z0w1, x1y0z0w1, x0y1z0w1, x1y1z0w1), smoothstep.w);
    float4 wLerp2 = lerp(float4(x0y0z1w0, x1y0z1w0, x0y1z1w0, x1y1z1w0), float4(x0y0z1w1, x1y0z1w1, x0y1z1w1, x1y1z1w1), smoothstep.w);

    float4 zlerp = lerp(wLerp1, wLerp2, smoothstep.z);
    float2 ylerp = lerp(zlerp.xy, zlerp.zw, smoothstep.y);

    return lerp(ylerp.x, ylerp.y, smoothstep.x);
}

float Perlin(float value, float scale)
{
    float octave1 = Noise(value, scale * 2) * 0.0375;
    float octave2 = Noise(value, scale) * 0.0625;
    float octave3 = Noise(value, scale * 0.5) * 0.125;
    float octave4 = Noise(value, scale * 0.25) * 0.25;
    float octave5 = Noise(value, scale * 0.125) * 0.5;

    return octave1 + octave2 + octave3 + octave4 + octave5;
}

float Perlin2D(float2 value, float scale)
{
    float octave1 = Noise2D(value, scale * 2) * 0.0375;
    float octave2 = Noise2D(value, scale) * 0.0625;
    float octave3 = Noise2D(value, scale * 0.5) * 0.125;
    float octave4 = Noise2D(value, scale * 0.25) * 0.25;
    float octave5 = Noise2D(value, scale * 0.125) * 0.5;

    return octave1 + octave2 + octave3 + octave4 + octave5;
}

float Perlin3D(float3 value, float scale)
{
    float octave1 = Noise3D(value, scale * 2) * 0.0375;
    float octave2 = Noise3D(value, scale) * 0.0625;
    float octave3 = Noise3D(value, scale * 0.5) * 0.125;
    float octave4 = Noise3D(value, scale * 0.25) * 0.25;
    float octave5 = Noise3D(value, scale * 0.125) * 0.5;

    return octave1 + octave2 + octave3 + octave4 + octave5;
}

float Perlin4D(float4 value, float scale)
{
    float octave1 = Noise4D(value, scale * 2) * 0.0375;
    float octave2 = Noise4D(value, scale) * 0.0625;
    float octave3 = Noise4D(value, scale * 0.5) * 0.125;
    float octave4 = Noise4D(value, scale * 0.25) * 0.25;
    float octave5 = Noise4D(value, scale * 0.125) * 0.5;

    return octave1 + octave2 + octave3 + octave4 + octave5;
}