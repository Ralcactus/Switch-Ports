event_inherited();
value = 10;
depth += 7;
z = depth;
image_speed = 0.35;
sparkletimer = random_range(1, 14);
do_specific(function()
{
    sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
    goldspr = asset_get_index(sprite_get_name(sprite_index) + "_gold");
    image_index = irandom(image_number - 1);
});
