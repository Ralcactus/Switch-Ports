mask_index = spr_acidpuddle;

if (grounded)
{
    var target_angle = scr_slopeanglenonplayer(x, y);
    var rotation_step = (((abs(hsp) / 16) + (abs(hsp) / 32)) - 2) * -1;
    hsp = approach(hsp, 0, 0.1);
    draw_angle = darctan2(dsin(target_angle) + (dsin(draw_angle) * rotation_step), dcos(target_angle) + (dcos(draw_angle) * rotation_step));
}
else
{
    if (draw_angle <= 0)
        draw_angle += 360;
    
    if (draw_angle < 180)
        draw_angle = max(draw_angle - 2.8125, 0);
    else
        draw_angle = min(draw_angle + 2.8125, 360);
}

if (grounded && sprite_index != spr_acidpuddle)
    sprite_index = spr_juicepuddlesplash;

if (animation_end() && sprite_index == spr_juicepuddlesplash)
    sprite_index = spr_acidpuddle;

if (scr_solid(x, y))
    instance_destroy();
