if (delay <= 0)
{
    with (obj_parent_player)
    {
        if (state != UnknownEnum.Value_45 && state != UnknownEnum.Value_46)
        {
            state = UnknownEnum.Value_45;
            movespeed = other.sethsp;
            verticalMovespeed = other.setvsp;
            ufoTimer = 750;
        }
    }
}

var myButton3 = get_control_string(global.key_slap);
scr_controlprompt("[spr_buttonfont]" + myButton3 + "[spr_promptfont] Shoot");
