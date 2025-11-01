z = -192;
scene[0] = "Dialogue/W1/boomtown_interactions.json";
scene[1] = "Dialogue/W1/boomtown_interactions.json";
starts = 
{
    _0: 62,
    _1: 66
};

var _func_stopanim = function()
{
    with (obj_map_npc_endisnear)
        anim_speed = 0;
};

var _func_ok = function()
{
    with (obj_map_npc_endisnear)
    {
        anim_idle = spr_npc_boomtown_endisnormal;
        anim_play(anim_idle);
        idle_is_talk = true;
        anim_speed = 0;
    }
};

events = 
{
    _64: _func_stopanim,
    _65: _func_ok
};
