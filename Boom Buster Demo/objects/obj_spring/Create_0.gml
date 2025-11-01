anim_init();

event_animend = function()
{
    var _anim = anim_sprite;
    
    if (_anim == spr_spring_bounce)
        anim_play(spr_spring);
};
