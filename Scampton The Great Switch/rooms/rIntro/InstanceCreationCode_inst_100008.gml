oAlways.Mesg = 0;

with (instance_create_depth(0, 0, -9999, oCC2))
{
    Seed = "DrawSelf@Ghi2";
    sprite_index = sWhite;
    image_xscale = 100;
    image_yscale = 100;
    image_index = 2;
}

with (instance_create_depth(0, 0, 200, oCC2))
{
    Seed = "ScaTimeDie@DrawSelf";
    sprite_index = SC_3;
    image_xscale = 2;
    image_yscale = 2;
    image_index = 0;
}

with (instance_create_depth(0, 0, 200, oCC2))
{
    Seed = "Bars@DrawSelf";
    sprite_index = SC_4;
    image_xscale = 2;
    image_yscale = 2;
    image_index = 0;
}

with (instance_create_depth(0, 0, 200, oCC2))
{
    Seed = "Bars@DrawSelf";
    sprite_index = SC_4;
    image_xscale = 2;
    image_yscale = 2;
    image_index = 1;
}

with (instance_create_depth(0, 0, 200, oCC2))
    Seed = "(AnimatorScampton)";

with (instance_create_depth(0, 0, 200, oCC2))
    Seed = "(AnimatorScampton_2)";
