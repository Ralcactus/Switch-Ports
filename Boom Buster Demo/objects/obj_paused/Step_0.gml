if (!ready)
{
    for (var i = 0; i <= 10; i++)
    {
        input.check[i] = false;
        input.pressed[i] = false;
    }
}

if (out)
{
    spotlight_radius = sin(spotlight_percent * pi) * 1400;
    spotlight_percent = approach(spotlight_percent, 0, 0.02);
    over_scale = lerp(over_scale, 1.2, 0.08);
}
else
{
    spotlight_radius = sin(spotlight_percent * pi) * 1400;
    spotlight_percent = approach(spotlight_percent, 0.5, 0.02);
    over_scale = lerp(over_scale, 1, 0.1);
}

if (!deac && !instance_exists(obj_options))
    menu_move(menu);

if (spotlight_percent <= 0.1 && out && freeze)
{
    audio_resume_all();
    freeze = false;
    instance_activate_all();
    sprite_delete(spr);
}

if (spotlight_percent == 0 && alarm[1] == -1)
    alarm[1] = 5;

static_ind += (sprite_get_speed(spr_static) / 60);
