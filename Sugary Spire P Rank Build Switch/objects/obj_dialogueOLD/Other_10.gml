var curMsg = global.dialogmsg[current_message];
var dialogLength = array_length(global.dialogmsg);
var _func = curMsg[3];

if (_func != noone)
    _func();

if (state != dialogstate.choices)
{
    drawchar = 0;
    
    if (current_message == (dialogLength - 1))
        state = dialogstate.outro;
    else
        current_message++;
}

force_next = false;
