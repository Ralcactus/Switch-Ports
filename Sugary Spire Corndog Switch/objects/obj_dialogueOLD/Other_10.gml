var curMsg = global.DialogMessage[current_message];
var dialogLength = array_length(global.DialogMessage);
var _func = curMsg[3];

if (_func != -4)
    _func();

if (state != UnknownEnum.Value_3)
{
    drawchar = 0;
    
    if (current_message == (dialogLength - 1))
        state = UnknownEnum.Value_1;
    else
        current_message++;
}

force_next = false;
