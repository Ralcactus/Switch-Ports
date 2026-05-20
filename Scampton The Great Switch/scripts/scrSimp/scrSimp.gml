function des(arg0)
{
    if (arg0 == 0)
        instance_destroy();
    else
        instance_destroy(arg0);
}

function drawPulse(arg0, arg1)
{
    try
    {
        draw_sprite_ext(sprite_index, image_index + DPE, arg0, arg1, image_xscale + (sin(oP.Tyme * 0.1) * GlowSiz), image_yscale + (sin(oP.Tyme * 0.1) * GlowSiz), image_angle, make_color_rgb(0, 255, 255), image_alpha * 0.5);
        draw_sprite_ext(sprite_index, image_index + DPE, arg0, arg1, image_xscale + (sin(8 + (oP.Tyme * 0.1)) * GlowSiz), image_yscale + (sin(8 + (oP.Tyme * 0.1)) * GlowSiz), image_angle, make_color_rgb(0, 255, 255), image_alpha * 0.5);
        draw_sprite_ext(sprite_index, image_index + DPE, arg0, arg1, image_xscale + (sin(16 + (oP.Tyme * 0.1)) * GlowSiz), image_yscale + (sin(16 + (oP.Tyme * 0.1)) * GlowSiz), image_angle, make_color_rgb(0, 255, 255), image_alpha * 0.5);
    }
    catch (_)
    {
        draw_sprite_ext(sprite_index, image_index, arg0, arg1, image_xscale + (sin(oP.Tyme * 0.1) * GlowSiz), image_yscale + (sin(oP.Tyme * 0.1) * GlowSiz), image_angle, make_color_rgb(0, 255, 255), image_alpha * 0.5);
        draw_sprite_ext(sprite_index, image_index, arg0, arg1, image_xscale + (sin(8 + (oP.Tyme * 0.1)) * GlowSiz), image_yscale + (sin(8 + (oP.Tyme * 0.1)) * GlowSiz), image_angle, make_color_rgb(0, 255, 255), image_alpha * 0.5);
        draw_sprite_ext(sprite_index, image_index, arg0, arg1, image_xscale + (sin(16 + (oP.Tyme * 0.1)) * GlowSiz), image_yscale + (sin(16 + (oP.Tyme * 0.1)) * GlowSiz), image_angle, make_color_rgb(0, 255, 255), image_alpha * 0.5);
    }
}

function eS()
{
    return irandom_range(-LimbShake, LimbShake);
}

function rTyme(arg0, arg1)
{
    if ((round(arg1 / arg0) * arg0) == arg1)
        return true;
    else
        return false;
}

function rgb(arg0, arg1, arg2)
{
    return make_color_rgb(arg0, arg1, arg2);
}

function TPmakeRGB(arg0, arg1, arg2)
{
    if (oTP.TP >= arg0)
        RGB = arg1;
    else
        RGB = arg2;
}

function DrawOutline(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    draw_sprite_ext(arg0, arg1, arg2 - 1, arg3, arg4, arg5, arg6, c_black, arg8);
    draw_sprite_ext(arg0, arg1, arg2 + 1, arg3, arg4, arg5, arg6, c_black, arg8);
    draw_sprite_ext(arg0, arg1, arg2, arg3 - 1, arg4, arg5, arg6, c_black, arg8);
    draw_sprite_ext(arg0, arg1, arg2, arg3 + 1, arg4, arg5, arg6, c_black, arg8);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}

function DrawOutlineT(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    draw_sprite_ext(arg0, arg1, arg2 - 2, arg3, arg4, arg5, arg6, c_black, arg8);
    draw_sprite_ext(arg0, arg1, arg2 + 2, arg3, arg4, arg5, arg6, c_black, arg8);
    draw_sprite_ext(arg0, arg1, arg2, arg3 - 2, arg4, arg5, arg6, c_black, arg8);
    draw_sprite_ext(arg0, arg1, arg2, arg3 + 2, arg4, arg5, arg6, c_black, arg8);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}

function iRan(arg0, arg1)
{
    return irandom_range(arg0, arg1);
}

function oneRan(arg0, arg1)
{
    return irandom_range(-arg0, arg0) * arg1;
}

function pepAN(arg0, arg1)
{
    if (sprite_index == ans[arg0] && image_index == arg1)
    {
        image_speed = 0;
        image_index = arg1;
    }
}
