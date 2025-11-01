if (exit_freeze() && path_lock_timer == -1)
    exit;

if (path_lock_timer > -1)
    path_lock_timer--;

path_follow();

if (sub_movement)
{
    repeat (abs(hspd))
        x += sign(hspd);
    
    repeat (abs(vspd))
        y += sign(vspd);
}
else
{
    x += hspd;
    y += vspd;
}

if (die_outside_room != 0)
{
    if ((die_outside_room == 1 && x > (room_width + 256)) || (die_outside_room == -1 && x < -256))
        instance_destroy();
}

anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;

if (onoff != -4)
{
    if (global.onoff != onoff)
    {
        mask_index = spr_nothing;
        image_alpha = 0.5;
    }
    else
    {
        mask_index = spr_jello;
        image_alpha = 1;
    }
}
