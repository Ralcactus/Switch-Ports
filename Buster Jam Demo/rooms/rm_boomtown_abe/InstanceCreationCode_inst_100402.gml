scene[0] = "Dialogue/W1/boomtown_interactions.json";
scene[1] = "Dialogue/W1/boomtown_interactions.json";
starts = 
{
    _0: 8,
    _1: 163
};

var _func_inhale = function()
{
    with (my_character)
    {
        override_animations = true;
        anim_play(spr_npc_boomtown_vapekid_inhale);
    }
};

var _func_exhale = function()
{
    with (my_character)
    {
        override_animations = true;
        anim_play(spr_npc_boomtown_vapekid_exhale);
    }
};

var _func_hold = function()
{
    with (my_character)
    {
        override_animations = false;
        anim_idle = spr_npc_boomtown_vapekid_hold_idle;
        anim_talk = spr_npc_boomtown_vapekid_hold_talk;
    }
};

events = 
{
    _12: _func_inhale,
    _14: _func_exhale,
    _15: _func_hold
};
