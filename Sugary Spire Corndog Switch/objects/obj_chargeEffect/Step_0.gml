updateEffectPosition();

if (playerID.sprite_index == playerID.spr_dive || (playerID.state != UnknownEnum.Value_65 && !(playerID.state == UnknownEnum.Value_100 && playerID.movespeed < 12) && !(playerID.state == UnknownEnum.Value_3 && playerID.movespeed >= 12) && playerID.state != UnknownEnum.Value_28 && playerID.state != UnknownEnum.Value_82))
    instance_destroy();
