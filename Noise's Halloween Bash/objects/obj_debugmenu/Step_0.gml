if (input_check_pressed("debug_menu"))
    open = !open;

if (open)
{
    with (ds_stack_top(optionstack))
    {
        var _theresoptions = array_length(options) != 0;
        var _curroption = _theresoptions ? options[optionselected] : undefined;
        
        if (input_check_pressed("jump"))
        {
            if (_theresoptions)
                _curroption.jump(other, _curroption);
            
            input_verb_consume("jump");
        }
        else if (input_check_pressed("attack"))
        {
            atk(other, _curroption);
            input_verb_consume("attack");
        }
        else
        {
            var _up_down = input_check_opposing_pressed("up", "down") + input_check_opposing_repeat("up", "down");
            
            if (_up_down != 0)
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
                    else
                        break;
                }
            }
        }
    }
}
