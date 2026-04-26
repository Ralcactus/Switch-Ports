if (obj_parent_player.costumeBlockDetails[0] == 0)
    sprite_index = spr_iceplacehold;
else if (obj_parent_player.costumeBlockDetails[0] == 1)
    sprite_index = spr_iceplacecracked;
else if (obj_parent_player.costumeBlockDetails[0] == 2)
    sprite_index = spr_iceplacehard;

if (obj_parent_player.state == UnknownEnum.Value_136)
{
    x = obj_parent_player.x;
    y = obj_parent_player.y - 75;
}
else
{
    instance_destroy();
}
