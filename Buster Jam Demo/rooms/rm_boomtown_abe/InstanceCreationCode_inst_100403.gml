scene[0] = "Dialogue/W1/boomtown_interactions.json";
scene[1] = "Dialogue/W1/boomtown_interactions.json";
starts = 
{
    _0: 48,
    _1: 59
};

var _func_baby = function()
{
    with (my_character)
    {
        anim_idle = spr_npc_boomtown_mother_baby_idle;
        anim_talk = spr_npc_boomtown_mother_baby_talk;
        anim_sprite = anim_talk;
        anim_play(anim_talk);
    }
};

var _func_wakeup = function()
{
    with (my_character)
    {
        anim_idle = spr_npc_boomtown_mother_awake_idle;
        anim_talk = spr_npc_boomtown_mother_awake_talk;
        anim_sprite = anim_talk;
        anim_play(anim_talk);
    }
};

var _func_gaga = function()
{
    with (my_character)
    {
        anim_talk = spr_npc_boomtown_mother_gaga_talk;
        anim_play(anim_talk);
    }
};

events = 
{
    _52: _func_baby,
    _55: _func_wakeup,
    _59: _func_wakeup,
    _60: _func_gaga
};
