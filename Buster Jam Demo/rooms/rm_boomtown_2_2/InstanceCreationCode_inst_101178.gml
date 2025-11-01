scene[0] = "Dialogue/W1/boomtown_interactions.json";
scene[1] = "Dialogue/W1/boomtown_interactions.json";
starts = 
{
    _0: 135,
    _1: 151
};

var _read = function()
{
    with (my_character)
    {
        override_animations = true;
        anim_play(spr_npc_boomtown_fortune_read);
    }
};

var _stopread = function()
{
    with (my_character)
    {
        override_animations = false;
        anim_play(anim_talk);
    }
};

events = 
{
    _146: _read,
    _147: _stopread
};
z = -192;
