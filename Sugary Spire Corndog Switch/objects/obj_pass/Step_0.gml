if (position_meeting(mouse_x, mouse_y, id))
    message = keyboard_string;

if (position_meeting(mouse_x, mouse_y, id))
    selected = 1;
else
    selected = 0;

if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left))
    message = " ";
