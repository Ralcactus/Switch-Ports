event_user(0);
index = -1;
events = [];

for (var i = 0; i < 400; i++)
{
    textbox_events[i] = function()
    {
    };
}

paused = false;
scene_created = false;
event_delay(1);
cam_xto = x;
cam_yto = y;
cam_xstart = x;
cam_ystart = y;
camera_move = false;
percent_camera = 0;
percent_tie = undefined;
camera_unpause_when_finished = false;
cam_speed = 0.02;
cam_xoff = 0;
cam_yoff = 0;
player_tie_actor = undefined;
alarm[0] = 1;
texture_prefetch("tg_dialogue");
