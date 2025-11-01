event_inherited();
anim_init();
facing = 1;
ground_layer = -1;
side = -1;
moving = false;
side_to = -4;
ground_layer_to = -4;
movespd_x = 40;
movespd_y = 28;
swing = false;
swing_time = 14;
swing_frames = 0;
timer[0] = -1;

timer_func[0] = function()
{
    swing = false;
    moving = false;
};
