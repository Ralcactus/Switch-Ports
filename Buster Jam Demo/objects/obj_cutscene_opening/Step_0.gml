testvariablenothing = false;
event_inherited();

for (var i = 0; i < array_length(array_timers); i++)
{
    var _time = array_timers[i][0];
    var _func = array_timers[i][1];
    
    if (_time > -1)
        array_timers[i][0] -= global.delta_game_factor;
    
    if (array_timers[i][0] <= 0)
    {
        _func();
        array_delete(array_timers, i, 1);
    }
}

if (instance_exists(obj_wizard_laugh_test))
{
    var _inst = -4;
    var _wizard = act_wizard;
    
    with (obj_map_actor)
    {
        if (ID == _wizard)
            _inst = id;
    }
    
    if (_inst)
        _inst.anim_index = obj_wizard_laugh_test.image_index;
}

if (global.debug && keyboard_check_pressed(ord("0")))
{
    var _inst = instance_create_layer(0, 0, "FX", obj_map_wizard_poof);
    _inst.debugging = true;
    _inst.act_wizard = act_wizard;
    
    with (_inst)
        event_user(0);
}
