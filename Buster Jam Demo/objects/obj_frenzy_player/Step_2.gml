if (scr_map_exit_freeze())
    exit;

anim_logic();
depth_pos = -bbox_bottom;

if (global.beat && !obj_map_frenzy_controller.started)
{
    switch (obj_map_frenzy_controller.state_beat)
    {
        case 0:
            anim_play(anim_spin);
            break;
        
        case 2:
            anim_play(anim_got_bom);
            break;
    }
}

var _donot = false;

if (instance_exists(obj_microgame_controller) && obj_microgame_controller.ready)
    _donot = true;

if (global.beat && !_donot)
{
    if (anim_sprite == anim_aim)
        anim_play(anim_aim_beat);
}
