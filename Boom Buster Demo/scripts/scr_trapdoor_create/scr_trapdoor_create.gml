function scr_trapdoor_create()
{
    anim_init();
    
    event_animend = function()
    {
        var _spr = anim_sprite;
        
        if (_spr == spr_trapdoor_open)
            anim_play(spr_trapdoor_opened);
        else if (_spr == spr_trapdoor_open_fun)
            anim_play(spr_trapdoor_opened_fun);
        else if (_spr == spr_trapdoor_close || _spr == spr_trapdoor_close_fun)
            anim_play(spr_trapdoor);
    };
    
    anim_play(spr_trapdoor);
}
