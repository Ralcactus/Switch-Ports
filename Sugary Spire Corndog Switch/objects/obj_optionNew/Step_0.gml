if (!instance_exists(obj_Options_Input))
    scr_getinput();
else
    scr_input_varinit();

var v_move = key_down2 - key_up2;
var h_move = key_left2 + key_right2;
var h_move2 = key_left + key_right;
key_back = key_slap2;

if (no_input_buffer > 0)
{
    scr_input_varinit();
    no_input_buffer--;
}

var _menu = menus[selectedmenu];
var _option = _menu.options[optionselected];
var _total_options = array_length(_menu.options);
var _old_opt = optionselected;

if (v_move != 0)
{
    optionselected += v_move;
    optionselected = clamp(optionselected, 0, _total_options - 1);
    _option = _menu.options[optionselected];
    
    if (_old_opt != optionselected)
        get_detail(_option);
}

switch (_option.type)
{
    case UnknownEnum.Value_3:
        if (key_jump)
        {
            if (!is_undefined(_option.func))
                _option.func();
        }
        
        break;
    
    case UnknownEnum.Value_0:
        if (key_jump || h_move != 0)
        {
            _option.value = !_option.value;
            
            if (!is_undefined(_option.func))
                _option.func(_option.value);
        }
        
        break;
    
    case UnknownEnum.Value_2:
        if (h_move != 0)
        {
            _option.value += h_move;
            _option.value = clamp(_option.value, 0, array_length(_option.choices) - 1);
            
            if (!is_undefined(_option.func))
                _option.func(_option.value);
        }
        
        break;
    
    case UnknownEnum.Value_1:
        if (h_move2 != 0 && scrollbuffer <= 0)
        {
            _option.value += h_move2;
            _option.value = clamp(_option.value, 0, 100);
            _option.moving = true;
            scrollbuffer = 3;
            
            if (!is_undefined(_option.on_move))
                _option.on_move(_option.value);
        }
        
        break;
}

for (var i = 0; i < _total_options; i++)
{
    var _i_opt = _menu.options[i];
    
    if (_i_opt.type == UnknownEnum.Value_1)
    {
        if (_i_opt.moving)
        {
            if (!is_undefined(_i_opt.sound) && !event_isplaying(_i_opt.sound))
                fmod_event_play(_i_opt.sound);
            
            if (_i_opt.moving && h_move2 == 0)
            {
                _i_opt.moving = false;
                fmod_event_stop(_i_opt.sound, true);
                
                if (!is_undefined(_i_opt.on_stop))
                    _i_opt.on_stop(_i_opt.value);
            }
        }
    }
}

if (key_back)
{
    if (is_undefined(_menu.backto))
    {
        instance_destroy();
        fmod_event_setParameter(obj_pause.pauseMusic, "state", 0, false);
    }
    else
    {
        goto_menu(_menu.backto);
    }
}

scrollbuffer = max(scrollbuffer - 1, 0);

if (showdesc)
{
    descalp = approach(descalp, !descfadeout, 0.15);
    
    if (descfadeout && descalp <= 0)
        descfadeout = false;
}
else
{
    descalp = approach(descalp, 0, 0.15);
}
