depth = -1;
image_speed = 0.35;

if (global.Donutfollow)
    sprite_index = spr_rosettegavetreatIDLE;

if (global.panic)
{
    instance_destroy();
    
    with (instance_create(x, y, obj_escaperosette))
    {
        lap = false;
        state = 3;
        sprite_index = spr_rosette_exitsign;
    }
}
