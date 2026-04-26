var curMsg = global.DialogMessage[current_message];
var dialogLength = array_length(global.DialogMessage);
var _text = curMsg[0];
var _textLength = string_length(_text);
var _sound = curMsg[2];
var _func = curMsg[3];
var _states = obj_parent_player.state == UnknownEnum.Value_93 || obj_parent_player.state == UnknownEnum.Value_110;
var _spd = (yoffset < 50) ? (((yoffset / 50) * 8) + 0.3) : 8;
snddelay = drawspd * 3;

if (!_states && state != UnknownEnum.Value_1)
    instance_destroy();

switch (state)
{
    case UnknownEnum.Value_0:
        yoffset = approach(yoffset, 0, _spd);
        
        if (yoffset == 0 || (_states && obj_parent_player.key_jump))
            state = UnknownEnum.Value_2;
        
        break;
    
    case UnknownEnum.Value_1:
        yoffset = approach(yoffset, 200, _spd);
        
        if (yoffset == 200 || instant_destroy)
            instance_destroy();
        
        break;
    
    case UnknownEnum.Value_2:
        yoffset = 0;
        
        if ((_states && obj_parent_player.key_jump) || force_next)
        {
            if (drawchar >= _textLength || force_next)
            {
                event_user(0);
            }
            else
            {
                real_drawchar = _textLength;
                drawchar = _textLength;
            }
        }
        
        break;
    
    case UnknownEnum.Value_3:
        yoffset = 0;
        var totalChoices = array_length(global.dialogchoices);
        move2 = obj_parent_player.key_down2 - obj_parent_player.key_up2;
        choice_selected += (1 * move2);
        choice_selected = wrap(choice_selected, 0, totalChoices - 1);
        
        if (obj_parent_player.state == UnknownEnum.Value_93 && obj_parent_player.key_jump)
        {
            drawchar = 0;
            
            if (current_message == (dialogLength - 1))
            {
                state = UnknownEnum.Value_1;
                obj_parent_player.state = UnknownEnum.Value_1;
            }
            else
            {
                current_message++;
            }
            
            if (_func != -4)
            {
                if (whos_talkin != -4 && instance_exists(whos_talkin))
                {
                    with (whos_talkin)
                        _func();
                }
                else
                {
                    _func();
                }
            }
        }
        
        break;
}

pause_time--;

if (pause_time <= 0)
{
    if (drawchar < (_textLength + 1) && (state == UnknownEnum.Value_2 || state == UnknownEnum.Value_3))
    {
        drawchar += drawspd;
        
        if (_sound != -4)
        {
            if (sndcnt < snddelay)
                sndcnt++;
            else
                sndcnt = 0;
        }
    }
}
else
{
    show_debug_message(pause_time);
}
