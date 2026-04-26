scr_getinput();

if (floor(image_index) >= (image_number - 1))
    image_speed = 0;

if (obj_parent_player.character == UnknownEnum.Value_0)
{
    if (global.rank == "s")
        sprite_index = spr_rankS;
    else if (global.rank == "a")
        sprite_index = spr_rankA;
    else if (global.rank == "b")
        sprite_index = spr_rankB;
    else if (global.rank == "c")
        sprite_index = spr_rankC;
    else if (global.rank == "d")
        sprite_index = spr_rankD;
    else if (global.rank == "e")
        sprite_index = spr_rankS;
}
