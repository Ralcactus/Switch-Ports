var _ind = angle_difference(-faceangle, point_direction(obj_jegplayer.x, obj_jegplayer.y, x, y));
_ind = wrap(_ind, 0, 360);
_ind = (round(_ind / 45) * 45) / 45;
var _sp1 = world_to_screen(x, z, y, obj_drawcontroller.viewMat, obj_drawcontroller.projMat, true);
var _sp2 = world_to_screen(x, z - sprite_get_height(spr_jeg), y, obj_drawcontroller.viewMat, obj_drawcontroller.projMat, true);

if (!experienced && !is_undefined(_sp1) && !is_undefined(_sp2) && !event_isplaying(kickass) && kickedass)
{
    obj_jegplayer.showjeg = true;
    obj_jegplayer.jegposx = _sp1[0];
    obj_jegplayer.jegposy = _sp1[1];
    obj_jegplayer.jegscale = (_sp1[1] - _sp2[1]) / sprite_get_height(spr_jeg);
    fmod_studio_event_instance_start(experience);
    visible = false;
    experienced = true;
}

if (experienced && kickedass && !event_isplaying(experience))
{
    if (!startsave)
    {
        save_easteregg("educationAndLearning");
        startsave = true;
    }
    else if (obj_savesystem.savestate == save_state.idle && event_count_description("event:/sfx/misc/secret") == 0)
    {
        if (already)
            room_goto(Titlescreen);
        else
            game_end();
    }
}
