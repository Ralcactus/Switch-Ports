yoff += yspd;
yAxis = global.input[0].check[3] - global.input[0].check[2];
yspdTo = yAxis * 5;
yspd = lerp(yspd, yspdTo, 0.2);
yoff += yspd;
yoff = clamp(yoff, 0, credits_h);

if (global.input[0].pressed[5] || global.input[0].pressed[4])
{
    instance_destroy();
    input_clear(global.input[0], 5);
    input_clear(global.input[0], 4);
    audio_stop_play(snd_spin, 0, 0);
    
    if (!instance_exists(obj_controls_popup))
    {
        var _controls = instance_create_depth(0, 0, depth - 1, obj_controls_popup);
        _controls.image_alpha = 0.55;
    }
}

if (yoff > 0)
    alpha_top = lerp(alpha_top, 1, 0.33);
else
    alpha_top = lerp(alpha_top, 0, 0.33);

if (yoff >= credits_h)
    alpha_bottom = lerp(alpha_bottom, 0, 0.33);
else
    alpha_bottom = lerp(alpha_bottom, 1, 0.33);
