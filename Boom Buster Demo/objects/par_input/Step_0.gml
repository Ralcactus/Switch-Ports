var _deadzone;

if (global.deadzone == 0)
    _deadzone = 0.3;
else if (global.deadzone == 1)
    _deadzone = 0.55;
else if (global.deadzone == 2)
    _deadzone = 0.72;

device_name = "NOT CONNECTED";

for (var i = 0; i < gamepad_get_device_count(); i++)
{
    if (gamepad_is_connected(i))
    {
        device = i;
        gamepad_set_axis_deadzone(device, _deadzone);
        device_name = gamepad_get_description(device);
        break;
    }
}

for (var i = 0; i <= 10; i++)
{
    if (pressed[i])
        pressed[i] = false;
    
    var _key;
    
    if (key[i] == 1 || key[i] == 2 || key[i] == 3)
        _key = mouse_check_button(key[i]);
    else
        _key = keyboard_check(key[i]);
    
    if (_key)
        input_last = 0;
    
    if (gamepad_get(device, i))
        input_last = 1;
    
    check[i] = _key || gamepad_get(device, i);
    
    if (check[i] && !pressed_clear[i])
    {
        pressed[i] = true;
        pressed_clear[i] = true;
    }
    
    if (!check[i])
    {
        pressed[i] = false;
        pressed_clear[i] = false;
    }
}
