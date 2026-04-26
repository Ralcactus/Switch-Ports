for (var i = 0; i < array_length(menus[selectedmenu].options); i++)
{
    var _i_opt = menus[selectedmenu].options[i];
    
    if (_i_opt.type == UnknownEnum.Value_1)
    {
        if (_i_opt.sound != -4)
            kill_sounds(_i_opt.sound);
    }
}

with (obj_pause)
{
    alarm[0] = 3;
    alarm[1] = 1;
    key_jump = false;
}
