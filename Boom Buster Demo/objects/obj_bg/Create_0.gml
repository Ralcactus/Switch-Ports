edit_move = 0;
editor_alpha = 0;
water_x = 0;
clouds_x = 0;
td_shake = 0;
td_y = 0;

if (global.stage == 7)
    global.dome_order = [1, 2, 3, 4];

timer[0] = global.dome_timer;

timer_func[0] = function()
{
    global.dome = !global.dome;
    
    if (global.dome)
    {
        timer[0] = 1200;
        global.dome_ind++;
        
        if (global.stage == 7)
        {
            if (global.dome_ind > (sprite_get_number(bgr_city_sunset_dome_wizard) - 2))
                global.dome_ind = 0;
        }
        else if (global.dome_ind > (sprite_get_number(bgr_city_sunset_dome) - 2))
        {
            for (var i = 0; i < (sprite_get_number(bgr_city_sunset_dome) - 1); i++)
                global.dome_order[i] = i + 1;
            
            var _dome = global.dome_order;
            global.dome_order = array_shuffle(_dome);
            global.dome_ind = 0;
        }
    }
    else
    {
        timer[0] = 300;
    }
};

draw_bg_overlay = function(arg0, arg1)
{
    draw_set_alpha(arg1);
    draw_rectangle_color(0, 0, room_width, room_height, arg0, arg0, arg0, arg0, false);
    draw_set_alpha(1);
};
