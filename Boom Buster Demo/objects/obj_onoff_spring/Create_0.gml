event_inherited();
anim_init();

event_animend = function()
{
    var _anim = anim_sprite;
    
    if (_anim == spr_spring_bounce)
        anim_play(spr_spring);
};

image_speed = 0;
state = 0;
scale = 1;
anim_sprite = spr_spring;
set = false;
