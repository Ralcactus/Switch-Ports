scene[0] = "Dialogue/W1/boomtown_interactions.json";
starts = 
{
    _0: 161
};

var _stopfight = function()
{
    with (my_character)
    {
        override_animations = true;
        anim_play(spr_npc_boomtown_homelessfight_talk);
    }
};

events = 
{
    _160: _stopfight
};

event_end = function()
{
    with (my_character)
    {
        override_animations = false;
        anim_play(anim_idle);
    }
};
