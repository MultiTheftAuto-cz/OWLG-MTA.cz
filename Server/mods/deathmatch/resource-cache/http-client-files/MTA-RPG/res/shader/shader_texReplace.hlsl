#include "mta-helper.hlsl"
#define GENERATE_NORMALS 

texture skinTexture;

sampler MainSampler = sampler_state
{
    Texture = <gTexture0>;
};


sampler TextureSampler = sampler_state
{
    Texture = <skinTexture>;
};


struct VertexShaderInput
{
    float3 Position		: POSITION;
	float4 Diffuse 		: COLOR0;
	float3 Normal 		: NORMAL0;
    float2 TexCoords	: TEXCOORD0;
};


struct VertexShaderOutput
{
	float4 Position		: POSITION;
	float4 Diffuse 		: COLOR0;
	float2 TexCoords	: TEXCOORD0;
};


VertexShaderOutput VertexShaderFunction(VertexShaderInput input)
{
    VertexShaderOutput output;
	
	MTAFixUpNormal(input.Normal);

	output.Position = MTACalcScreenPosition(input.Position);
    output.TexCoords = input.TexCoords;
	float3 worldNormal = MTACalcWorldNormal(input.Normal);
	output.Diffuse = MTACalcGTACompleteDiffuse(worldNormal, input.Diffuse);

    return output;
}


float4 PixelShaderFunction(VertexShaderOutput input) : COLOR0
{
	float4 mainColor = tex2D(MainSampler, input.TexCoords);
	float4 finalColor = tex2D(TextureSampler, input.TexCoords);
	finalColor.rgb *= 0.5;
	
	//float4 finalColor = tex2D(TextureSampler, input.TexCoords) * input.Diffuse;
	
    return float4(finalColor.rgb, mainColor.a);
}
 
technique TexReplace
{
    pass Pass0
    {
		AlphaBlendEnable = true;
        VertexShader = compile vs_2_0 VertexShaderFunction();
        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}


// Fallback
technique fallback
{
    pass P0
    {
        // Just draw normally
    }
}