if (global.panic == false)
{
    sprite_index = spr_minipillarsleep;
    x = -900;
    y = -900;
}
else if (global.panic == true)
{
    sprite_index = spr_minipillarwoke;
    x = xstart;
    y = ystart;
}
