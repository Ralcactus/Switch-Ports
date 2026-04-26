var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _mouse_x = mouse_x - _cam_x;
var _mouse_y = mouse_y - _cam_y;
stop = false;
var _stop = false;

with (obj_palettechangerscrollbar)
{
    if (selected || input_text)
        _stop = true;
}

if (input_text || _stop)
    stop = true;

if (!stop && player.key_right2 != 0)
{
    event_user(3);
    player.customSavedPalette = clamp(player.customSavedPalette + sign(player.key_right2), 1, 5);
    
    with (player)
        scr_playercolors();
    
    ini_open("Custom/" + string(player.characters) + "_" + string(player.customSavedPalette) + "_palettes.ini");
    palettename = ini_read_string("General", "PaletteName", "Palette 1");
    ini_close();
    input = palettename;
    global.oldcolorchoosen = 0;
    global.colorchoosen = 0;
    
    with (obj_palettechangerscrollbar)
        readcolor = true;
    
    for (var i = 0; i < player.colorHeight; i++)
        color[i] = player.color[i];
}

if (global.colorchoosen != global.oldcolorchoosen)
{
    event_user(3);
    global.colorchoosen = clamp(global.oldcolorchoosen, 0, player.colorHeight - 1);
    
    with (obj_palettechangerscrollbar)
        readcolor = true;
}

if (global.colorchoosen == global.oldcolorchoosen)
    color[global.colorchoosen] = make_color_rgb(slider[0].finalvalue, slider[1].finalvalue, slider[2].finalvalue);

if (!stop)
{
    if (player.key_down2)
        global.oldcolorchoosen = clamp(global.colorchoosen + 1, 0, player.colorHeight - 1);
    else if (player.key_up2)
        global.oldcolorchoosen = clamp(global.colorchoosen - 1, 0, player.colorHeight - 1);
}

if ((player.key_slap2 || keyboard_check_pressed(vk_enter)) && !stop && has_selectedoption <= 0)
{
    event_user(3);
    
    with (player)
    {
        scr_playercolors();
        state = UnknownEnum.Value_57;
        sprite_index = spr_walkfront;
        image_index = 0;
        blackblend = 0;
        image_blend = make_colour_hsv(0, 0, 0);
        visible = true;
        xscale = -1;
    }
    
    instance_destroy();
}

if (mouse_check_button_pressed(mb_left) && !input_text && !stop)
{
    if (point_in_rectangle(_mouse_x, _mouse_y, ExportButton.xpos - 28, ExportButton.ypos - 25, ExportButton.xpos + 28, ExportButton.ypos + 28))
    {
        ExportButton.activated = true;
        ExportButton.buffertimer = 10;
        
        if (ExportButton.activated)
            event_user(0);
    }
}

if (mouse_check_button_pressed(mb_left) && !input_text && !stop)
{
    if (point_in_rectangle(_mouse_x, _mouse_y, ImportButton.xpos - 28, ImportButton.ypos - 25, ImportButton.xpos + 28, ImportButton.ypos + 28))
    {
        ImportButton.activated = true;
        ImportButton.buffertimer = 10;
        
        if (ImportButton.activated)
            event_user(1);
    }
}

if (mouse_check_button_pressed(mb_left) && !input_text && !stop)
{
    if (point_in_rectangle(_mouse_x, _mouse_y, 333, yi - 43, 627, yi + 43) && yi <= 500)
    {
        input_text = true;
        keyboard_string = "";
        input = palettename;
    }
}

if (((player.key_jump2 || keyboard_check_pressed(vk_enter)) || player.key_slap2) && input_text)
{
    input_text = false;
    
    if (player.key_jump2 || keyboard_check_pressed(vk_enter))
    {
        palettename = string(input);
        ini_open("Custom/" + string(player.characters) + "_" + string(player.customSavedPalette) + "_palettes.ini");
        ini_write_string("General", "PaletteName", palettename);
        ini_close();
    }
    else
    {
        input = palettename;
    }
}

if (input_text)
{
    if (keyboard_check(vk_anykey) && inputbuffer == 0)
    {
        input += keyboard_string;
        keyboard_string = "";
        inputbuffer = inputmax;
    }
    
    if (keyboard_check(vk_backspace) && deletebuffer == 0)
    {
        input = string_delete(input, string_length(input), 1);
        deletebuffer = deletemax;
    }
}

yi = approach(yi, 500, 5);

if (showtext)
{
    if (!choosen)
    {
        _message = store_message[_messageindex];
        
        if (_messageindex < (array_length(store_message) - 1))
            _messageindex += 1;
        else
            _messageindex = 0;
        
        choosen = true;
    }
    
    _draw_y = min(_draw_y + 5, 35);
}
else if (_draw_y > -64)
{
    _draw_y -= 1;
}
else
{
    _message = "";
    _draw_y = -64;
}

var _sprite = obj_tv.idletvspr;

if (floor(image_idnex) >= (sprite_get_number(_sprite) - 1))
    image_idnex = 0;
else
    image_idnex += 0.35;
