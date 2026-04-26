if (playerID.state != UnknownEnum.Value_65 && playerID.state != UnknownEnum.Value_5 && playerID.state != UnknownEnum.Value_64 && playerID.state != UnknownEnum.Value_16 && playerID.state != UnknownEnum.Value_66 && playerID.state != UnknownEnum.Value_34 && playerID.state != 28 && playerID.state != UnknownEnum.Value_31 && playerID.state != UnknownEnum.Value_33 && playerID.state != UnknownEnum.Value_100 && playerID.state != UnknownEnum.Value_28 && playerID.state != UnknownEnum.Value_58 && playerID.state != UnknownEnum.Value_92 && playerID.state != UnknownEnum.Value_95 && playerID.state != 125 && (playerID.state != UnknownEnum.Value_55 && playerID.state != UnknownEnum.Value_88 && playerID.state != UnknownEnum.Value_102 && !global.Cane && playerID.state != UnknownEnum.Value_103 && playerID.state != UnknownEnum.Value_125 && playerID.state != UnknownEnum.Value_63))
    vanish = 1;

if (vanish == 1)
{
    if (gonealpha > 0)
        gonealpha -= 0.15;
    else
        instance_destroy();
}

visible = playerID.visible;

if (obj_parent_player.state != UnknownEnum.Value_0)
    image_alpha = obj_parent_player.frozenMoveSpeed / 16;
else
    image_alpha = obj_parent_player.movespeed / 16;

with (realcol)
{
    switch (other.color)
    {
        case 1:
            r = 48;
            g = 168;
            b = 248;
            r2 = 15;
            g2 = 57;
            b2 = 121;
            break;
        
        case 2:
            r = 232;
            g = 80;
            b = 152;
            r2 = 95;
            g2 = 9;
            b2 = 32;
            break;
    }
}
