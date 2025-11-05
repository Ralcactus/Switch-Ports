if (game_paused())
{
    image_index -= image_speed;
    exit;
}

x += hsp;

if (!instance_exists(parent))
{
    instance_destroy();
    scr_createparticle(true, x, y, depth, spr_projectilesplat, image_xscale, image_yscale, 0, 0.35, 0, 0, 0, 0, 0);
}
else if (scr_solid(x, y))
{
    instance_destroy();
    scr_createparticle(true, x, y, depth, spr_flyguy_bullethitwall, image_xscale, image_yscale, 0, 0.35, 0, 0, 0, 0, 0);
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/flyguybulletsplat", x, y);
}
