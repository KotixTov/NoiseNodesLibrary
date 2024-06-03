float random(float value)
{
    return frac(sin(value) * 230419);
}

float random2D(float2 value)
{
    //make value smaller to avoid artefacts
    float2 smallValue = sin(value);
    //get scalar value from 2d vector
    float random = dot(smallValue, float2(13.37, 42.0));
    //make value more random by making it bigger and then taking the factional part
    return frac(sin(random) * 230419);
}

float random3D(float3 value)
{
    //make value smaller to avoid artefacts
    float3 smallValue = sin(value);
    //get scalar value from 3d vector
    float random = dot(smallValue, float3(13.37, 42.0, 22.8));
    //make value more random by making it bigger and then taking the factional part
    return frac(sin(random) * 230419);
}

float random4D(float4 value)
{
    //make value smaller to avoid artefacts
    float4 smallValue = sin(value);
    //get scalar value from 4d vector
    float random = dot(smallValue, float4(13.37, 42.0, 22.8, 69.69));
    //make value more random by making it bigger and then taking the factional part
    return frac(sin(random) * 230419);
}

float2 _2Drandom2D(float2 value)
{
    //make value smaller to avoid artefacts
    float2 smallValue = sin(value);
    //get scalar value from 2d vector
    float2 random = float2(dot(smallValue, float2(13.37, 42.0)), dot(smallValue, float2(22.8, 69.69)));
    //make value more random by making it bigger and then taking the factional part
    return frac(sin(random) * 230419);
}

float3 _3Drandom3D(float3 value)
{
    //make value smaller to avoid artefacts
    float3 smallValue = sin(value);
    //get scalar value from 3d vector
    float3 random = float3(dot(smallValue, float3(13.37, 42.0, 22.8)), dot(smallValue, float3(69.69, 13.37, 42.0)), dot(smallValue, float3(22.8, 69.69, 13.37)));
    //make value more random by making it bigger and then taking the factional part
    return frac(sin(random) * 230419);
}

float4 _4Drandom4D(float4 value)
{
    //make value smaller to avoid artefacts
    float4 smallValue = sin(value);
    //get scalar value from 3d vector
    float4 random = float4(dot(smallValue, float3(13.37, 42.0, 22.8)),
        dot(smallValue, float3(69.69, 13.37, 42.0)),
        dot(smallValue, float3(22.8, 69.69, 13.37)),
        dot(smallValue, float3(69.69, 22.8, 13.37)));
    //make value more random by making it bigger and then taking the factional part
    return frac(sin(random) * 230419);
}
