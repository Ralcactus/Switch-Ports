if (scr_map_exit_freeze())
    exit;

var _spun = false;

with (obj_map_player)
{
    if (instance_place_3d(x, y, z, other))
    {
        if (coyote_spin)
            _spun = true;
        else
            event_hurt();
    }
}

if (_spun)
    event_spun();

anim_logic();
grounded = instance_place_3d(x, y, z + 1, obj_solid);
scr_shadow_z();
inside = collision_rectangle_3d(x - xradius, y - yradius, x + xradius, y + yradius, z, 1920, obj_map_player, true, true);
var _xradius = xradius + 0;
var _yradius = yradius + 0;
inside_chase = collision_rectangle_3d(x - _xradius, y - _yradius, x + _xradius, y + _yradius, z, 1920, obj_map_player, true, true);

if (inside && state == state_free)
{
    state = state_spotted;
    audio_play_sound(snd_button, 0, 0);
    timer[0] = 40;
}

event_user(state);
timer_logic(0);
timer_logic(1);
physics_apply_3d();
