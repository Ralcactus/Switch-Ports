instance_create(x, y, obj_bombExplosionHarmless);

for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
{
    with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_minecartdebris))
        image_index = i;
}
