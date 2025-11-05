if (game_paused())
{
    image_index -= image_speed;
    exit;
}

x += hsp;
y += vsp;
vsp += 0.5;
image_angle = point_direction(0, 0, hsp, vsp);

if (!instance_exists(parent))
{
    instance_destroy();
    scr_createparticle(true, x, y, depth, spr_projectilesplat, image_xscale, image_yscale, 0, 0.35, 0, 0, 0, 0, 0, 4771936);
}
else if (scr_solid(x, y))
{
    instance_destroy();
    scr_createparticle(true, x, y, depth, spr_projectilesplat, image_xscale, image_yscale, 0, 0.35, 0, 0, 0, 0, 0, 4771936);
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/flyguybulletsplat", x, y);
}
