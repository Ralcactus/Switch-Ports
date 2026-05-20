oAlways.Mesg = 0;
Seed = "FadeIntro2";

with (instance_create_depth(0, 0, -500, oCC2))
{
    Seed = "DrawSelf@(Ghi4)";
    sprite_index = sWhite;
    image_xscale = 100;
    image_yscale = 100;
    image_index = 2;
}

with (instance_create_depth(0, 0, -500, oCC2))
    Seed = "(PepIn2)";

layer_set_visible(layer_get_id("BC_Rail"), false);
