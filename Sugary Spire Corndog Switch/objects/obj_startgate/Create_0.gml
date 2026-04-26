image_index = 0;
image_speed = 0;
depth = 49;
level = "none";
showtext = false;
surf = -4;
fadewhite = 1;
details = [gate_createlayer(spr_default_startgate, 0), gate_createlayer(spr_default_startgate, 1), gate_createlayer(bg_thumbnail_cone, 0, 1, 1)];
confecti_sprs[0] = 
{
    sprite: spr_marshmellow_taunt,
    image: choose(0, 1)
};
confecti_sprs[1] = 
{
    sprite: spr_chocolate_taunt,
    image: choose(0, 1)
};
confecti_sprs[2] = 
{
    sprite: spr_crack_taunt,
    image: choose(0, 1)
};
confecti_sprs[3] = 
{
    sprite: spr_gummyworm_taunt,
    image: choose(0, 1)
};
confecti_sprs[4] = 
{
    sprite: spr_candy_taunt,
    image: choose(0, 1)
};
info = 
{
    bginfo: [spr_entrycard_bg, UnknownEnum.Value_2, UnknownEnum.Value_4, UnknownEnum.Value_8, 0, 0],
    titleinfo: [spr_entrycard_title, UnknownEnum.Value_0, UnknownEnum.Value_5, UnknownEnum.Value_6, 672, 160],
    song: "event:/music/w1/entryway_titlecard"
};
