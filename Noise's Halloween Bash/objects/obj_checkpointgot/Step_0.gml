if (game_paused())
{
    alarm[0]--;
    exit;
}

anim1total = min(anim1total + 0.2, animmax);

if (anim1total >= animmax && !didanim1)
{
    didanim1 = true;
    alarm[0] = 45;
}

if (doanim2)
    anim2total += 0.25;

if (!didanim1 && point_distance(x, y, obj_player.x, obj_player.y) > 800)
    instance_destroy();

if (woosh < floor(anim1total + min(anim2total, animmax)))
{
    woosh++;
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/checkpointwoosh", x, y - 30);
}
