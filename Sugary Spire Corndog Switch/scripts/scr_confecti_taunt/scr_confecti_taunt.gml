function scr_confecti_taunt()
{
    sprite_index = spr_taunt;
    drawxscale = image_xscale;
    
    if (obj_parent_player.sprite_index != obj_parent_player.spr_taunt)
        state = UnknownEnum.Value_0;
}
