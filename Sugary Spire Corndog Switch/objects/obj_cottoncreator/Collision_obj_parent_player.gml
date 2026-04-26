with (obj_parent_player)
{
    if (state != UnknownEnum.Value_87 && state != UnknownEnum.Value_96 && state != UnknownEnum.Value_72 && state != UnknownEnum.Value_97)
    {
        global.ComboFreeze = 30;
        state = UnknownEnum.Value_87;
        
        if (movespeed > 6)
            movespeed = 6;
        
        with (instance_create(x, y, obj_poofeffect))
            color = 2;
        
        sprite_index = spr_cottonidle;
        var myButton = get_control_string(global.key_slap);
        scr_controlprompt("[spr_buttonfont]" + myButton + "[spr_promptfont] Attack");
    }
}
