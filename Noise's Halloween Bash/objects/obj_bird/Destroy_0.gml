event_inherited();

with (instance_create_depth(x, y, depth - 7, obj_birdrespawner))
{
    image_xscale = other.dir;
    path = other.path;
    movespeed = other.movespeed;
    
    if (irandom(9) >= 7)
        scr_fmod_soundeffectONESHOT("event:/sfx/enemy/birdjohndeath", x, y);
}
