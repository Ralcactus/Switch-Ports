depth = -999;
image_speed = 0.35;
player = obj_player;
has_selectedoption = 0;
slider[0] = noone;
slider[1] = noone;
slider[2] = noone;
surface = noone;
color[0] = c_black;
color[1] = c_black;
color[2] = c_black;
color[3] = c_black;
color[4] = c_black;
color[5] = c_black;
color[6] = c_black;
color[7] = c_black;
color[8] = c_black;
color[9] = c_black;
color[10] = c_black;
yi = 600;
palettename = "Palette 1";
image_idnex = 0;
showtext = false;
_draw_x = 480;
_draw_y = -64;
choosen = false;
_message = noone;
var i = 0;
store_message[i++] = "PRESS LEFT AND RIGHT TO CHANGE\n WHICH SLOT TO CHANGE";
store_message[i++] = "PRESS UP AND DOWN TO CHANGE\n WHICH COLOR TO EDIT";
store_message[i++] = "CLICK ON THE TEXT BOXXES TO EDIT\n THE VALUES WITH A KEYBOARD";
store_message[i++] = "USE THE MOUSE TO DRAG THE SLIDERS";
store_message[i++] = "PRESS SLAP TO EXIT AND SAVE CHANGES";
_messageindex = 0;
alarm[1] = 50;
stop = false;
input = "Palette 0";
input_text = false;
keyboard_string = "";
inputbuffer = 2;
inputmax = 2;
deletebuffer = 6;
deletemax = 6;
cursor = "|";
delay = 20;
alarm[2] = delay;
ImportButton = 
{
    xpos: 63,
    ypos: 495,
    activated: false,
    buffertimer: 0
};
ExportButton = 
{
    xpos: 140,
    ypos: 495,
    activated: false,
    buffertimer: 0
};
