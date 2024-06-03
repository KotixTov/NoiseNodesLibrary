#include "Random.hlsl"
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

// circular
float smin( float a, float b, float k )
{
    k *= 1.0/(1.0-sqrt(0.5));
    float h = max( k-abs(a-b), 0.0 )/k;
    return min(a,b) - k*0.5*(1.0+h-sqrt(1.0-h*(h-2.0)));
}

float Voronoi(float value, float offset, float scale, out float cell)
{
    value *= scale;
    float id = floor(value);
    float localValue = frac(value);
    float nearestCellPoint = 0.0;
    
    float resultDistance = 10.0;
    
    for (int x = -1; x <= 1; x++)
    {
        //float cellPoint = sin(random(id + x) * offset) * 0.5 + 0.5;
        float cellPoint = random(id + x);
        float distance = cellPoint + x - localValue;
        if (distance < resultDistance)
        {
            resultDistance = distance;
            nearestCellPoint = cellPoint;
        }
    }

    cell = nearestCellPoint;
    return resultDistance;
}

float Voronoi2D(float2 value, float offset, float scale, out float2 cell)
{
    value *= scale;
    float2 id = floor(value);
    float2 localValue = frac(value);
    float2 nearestCellPoint = 0.0;
    
    float resultDistance = 10.0;
    
    for (int x = -1; x <= 1; x++)
    {
        for (int y = -1; y <= 1; y++)
        {
            float2 cellOffset = float2(x, y);
            float2 cellPoint = sin(_2Drandom2D(id + cellOffset) * offset) * 0.5 + 0.5;
            float distance = length(cellPoint + cellOffset - localValue);
            if (distance < resultDistance)
            {
                resultDistance = distance;
                nearestCellPoint = cellPoint;
            }
        }
    }

    cell = nearestCellPoint;
    return resultDistance;
}

float Voronoi3D(float3 value, float offset, float scale, out float3 cell)
{
    value *= scale;
    float3 id = floor(value);
    float3 localValue = frac(value);
    float3 nearestCellPoint = 0.0;
    
    float resultDistance = 10.0;
    
    for (int x = -1; x <= 1; x++)
    {
        for (int y = -1; y <= 1; y++)
        {
            for (int z = -1; z <= 1; z++)
            {
                float3 cellOffset = float3(x, y, z);
                float3 cellPoint = sin(_3Drandom3D(id + cellOffset) * offset) * 0.5 + 0.5;
                float distance = length(cellPoint + cellOffset - localValue);
                if (distance < resultDistance)
                {
                    resultDistance = distance;
                    nearestCellPoint = cellPoint;
                }
            }
        }
    }

    cell = nearestCellPoint;
    return resultDistance;
}

float Voronoi4D(float4 value, float offset, float scale, out float4 cell)
{
    value *= scale;
    float4 id = floor(value);
    float4 localValue = frac(value);
    float4 nearestCellPoint = 0.0;
    
    float resultDistance = 10.0;
    
    for (int x = -1; x <= 1; x++)
    {
        for (int y = -1; y <= 1; y++)
        {
            for (int z = -1; z <= 1; z++)
            {
                for (int w = -1; w <= 1; w++)
                {
                    float4 cellOffset = float4(x, y, z, w);
                    float4 cellPoint = sin(_4Drandom4D(id + cellOffset) * offset) * 0.5 + 0.5;
                    float distance = length(cellPoint + cellOffset - localValue);
                    if (distance < resultDistance)
                    {
                        resultDistance = distance;
                        nearestCellPoint = cellPoint;
                    }
                }
            }
        }
    }

    cell = nearestCellPoint;
    return resultDistance;
}

float Voronoi2DEdge(float2 value, float offset, float scale, out float2 cell)
{
    value *= scale;
    float2 id = floor(value);
    float2 localValue = frac(value);
    
    float resultDistance = 10.0;
    float2 nearestCellPoint = 0.0;
    float2 nearestCellOffset = 0.0;
    float2 toNearestCellPoint = 0.0;
    
    for (int x = -1; x <= 1; x++)
    {
        for (int y = -1; y <= 1; y++)
        {
            float2 cellOffset = float2(x, y);
            float2 cellPoint = sin(_2Drandom2D(id + cellOffset) * offset) * 0.5 + 0.5;
            float distance = length(cellPoint + cellOffset - localValue);
            if (distance < resultDistance)
            {
                resultDistance = distance;
                nearestCellOffset = cellOffset;
                toNearestCellPoint = cellPoint + cellOffset - localValue;
                nearestCellPoint = cellPoint;
            }
        }
    }

    cell = nearestCellPoint;
    
    resultDistance = 10.0;
    for (int x = -2; x <= 2; x++)
    {
        for (int y = -2; y <= 2; y++)
        {
            float2 cellOffset = nearestCellOffset + float2(x, y);
            float2 cellPoint = sin(_2Drandom2D(id + cellOffset) * offset) * 0.5 + 0.5;
            float2 toCellPoint = cellPoint + cellOffset - localValue;
            float distanceToEdge = dot((toCellPoint + toNearestCellPoint) * 0.5, normalize(toCellPoint - toNearestCellPoint));
            resultDistance = min(resultDistance, distanceToEdge);
        }
    }
    
    return resultDistance;
}

float Voronoi2DEdgeSmooth(float2 value, float offset, float scale, float smoothness, out float2 cell)
{
    value *= scale;
    float2 id = floor(value);
    float2 localValue = frac(value);
    
    float resultDistance = 10.0;
    float2 nearestCellPoint = 0.0;
    float2 nearestCellOffset = 0.0;
    float2 toNearestCellPoint = 0.0;
    
    for (int x = -1; x <= 1; x++)
    {
        for (int y = -1; y <= 1; y++)
        {
            float2 cellOffset = float2(x, y);
            float2 cellPoint = sin(_2Drandom2D(id + cellOffset) * offset) * 0.5 + 0.5;
            float distance = length(cellPoint + cellOffset - localValue);
            if (distance < resultDistance)
            {
                resultDistance = distance;
                nearestCellOffset = cellOffset;
                toNearestCellPoint = cellPoint + cellOffset - localValue;
                nearestCellPoint = cellPoint;
            }
        }
    }

    cell = nearestCellPoint;
    
    resultDistance = 10.0;
    for (int x = -2; x <= 2; x++)
    {
        for (int y = -2; y <= 2; y++)
        {
            float2 cellOffset = nearestCellOffset + float2(x, y);
            float2 cellPoint = sin(_2Drandom2D(id + cellOffset) * offset) * 0.5 + 0.5;
            float2 toCellPoint = cellPoint + cellOffset - localValue;
            float distanceToEdge = dot((toCellPoint + toNearestCellPoint) * 0.5, normalize(toCellPoint - toNearestCellPoint));
            resultDistance = smin(resultDistance, distanceToEdge, smoothness);
        }
    }
    
    return resultDistance;
}