if (exit_freeze())
    exit;

anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;

if (collected)
{
    vspd += grav;
    x += hspd;
    y += vspd;
    
    if (collected_speedup)
        anim_speed += 0.15;
    
    timer_logic(2);
    image_alpha = 1;
    exit;
}

timer_logic(0);
timer_logic(1);

if (timer[0] <= life_flicker)
{
    if (timer[1] == -1)
        timer[1] = 4;
    
    image_alpha = 0.6 + (0.3 * flicker);
}
else
{
    image_alpha = 1;
}

path_follow();
vspd += grav;

if (mypath != -4 && on_path)
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
