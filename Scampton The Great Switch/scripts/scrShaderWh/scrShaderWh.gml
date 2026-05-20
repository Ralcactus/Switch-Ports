function scrShaderWh(arg0)
{
    if (arg0 == 0)
    {
        scrSha_RGBa(0.5 + White, 0.5 + White, 0.5 + White, 0);
        
        if (Glow)
            scrSha_RGBa(GlowWhite, GlowWhite, GlowWhite, 0);
    }
    else
    {
        shader_reset();
    }
}
