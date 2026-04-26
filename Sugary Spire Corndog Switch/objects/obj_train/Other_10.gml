camera_shake_add(10, 30);

repeat (15)
{
    for (var i = 0; i < (sprite_get_number(spr_spraydebris) - 1); i++)
    {
        with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_spraydebris))
            image_index = i;
    }
}

repeat (5)
    instance_create(x + irandom_range(-90, 90), y + irandom_range(20, -20), obj_bombExplosion);

with (instance_create(random_range(bbox_left, bbox_right), y, obj_baddieDead))
    sprite_index = spr_spraypizzano;

image_index = 0;
x = xstart;
y = ystart;
image_xscale = start_xscale;
sprite_index = spr_spray;

repeat (5)
    create_debris(x + irandom_range(-90, 90), y + irandom_range(20, -20), spr_poofeffect);

vsp = 0;
movespeed = 10;
state = UnknownEnum.Value_0;
