bgx += 0.5;
bgy += 0.5;

if (input_keyboard_check_pressed(vk_f1) || (input_gamepad_check_pressed(input_player_get_gamepad(), gp_stickl) && input_gamepad_check_pressed(input_player_get_gamepad(), gp_stickr)))
{
    input_profile_reset_bindings("keyboard_and_mouse");
    input_profile_reset_bindings("gamepad");
    config_set_option("Input", "bindings", input_system_export(false));
    scr_tiptext(string_get("tips/menu/options/allbindsreset"), -13500, false);
}

optiontip = string_get("menu/options/tips/generic");
var _optionmenu = id;

with (ds_stack_top(optionstack))
{
    var _theresoptions = array_length(options) != 0;
    var _curroption = _theresoptions ? options[optionselected] : undefined;
    update();
    
    if (_theresoptions)
        _curroption.highlighted(_optionmenu);
    
    if (!in_debug_menu())
    {
        if (input_check_pressed("attack") || input_check_pressed("pause"))
        {
            input_verb_consume(["attack", "pause"]);
            
            if (!locked)
                unlock(other);
            else if (_theresoptions)
                _curroption.unlock(other);
        }
        else if (input_check_pressed("jump"))
        {
            if (_theresoptions)
                _curroption.jump(other);
        }
        else if (input_check_pressed("inv"))
        {
            if (_theresoptions)
                _curroption.taunt(other);
        }
        else
        {
            var _move = input_check_pressed("right") - input_check_pressed("left");
            var _move2 = input_check("right") - input_check("left");
            var _up_down = input_check_pressed("down") - input_check_pressed("up");
            
            if (_theresoptions)
                _curroption.left_right(_move, _move2);
            
            if (!locked && _up_down != 0)
            {
                var _prev = optionselected;
                var _newoption = undefined;
                
                while (true)
                {
                    optionselected += _up_down;
                    _newoption = array_get_undefined(options, optionselected);
                    
                    if (is_undefined(_newoption))
                    {
                        optionselected = _prev;
                        break;
                    }
                    else if (!_newoption.skip)
                    {
                        event_play_oneshot("event:/sfx/pausemenu/move");
                        break;
                    }
                }
            }
        }
    }
}
