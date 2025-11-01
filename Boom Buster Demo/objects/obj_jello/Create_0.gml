anim_init();

event_animend = function()
{
    var _spr = anim_sprite;
    
    if (_spr == spr_jello_bounce)
        anim_play(spr_jello);
};

path_init(false);
hspd = 0;
vspd = 0;
on_path = true;
onoff = -4;
die_outside_room = false;
sub_movement = false;
