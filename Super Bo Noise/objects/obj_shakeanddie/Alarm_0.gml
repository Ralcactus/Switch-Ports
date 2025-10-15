with (instance_create(x, y, obj_baddieDead))
{
    scr_soundeffect(sfx_killenemy)
    sprite_index = other.sprite_index
    image_xscale = other.image_xscale
}
instance_destroy()
