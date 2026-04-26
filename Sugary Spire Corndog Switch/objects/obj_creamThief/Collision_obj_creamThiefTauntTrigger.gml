if (state == UnknownEnum.Value_1 && other.canTaunt)
{
    other.canTaunt = false;
    tauntTimer = 20;
    scr_taunt_storeVariables();
    sprite_index = spr_creamthief_taunt;
    image_index = irandom_range(0, sprite_get_number(spr_creamthief_taunt));
    state = UnknownEnum.Value_3;
    hsp = 0;
    vsp = 0;
    instance_create(x, y, obj_confectitaunt);
}
