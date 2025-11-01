event_inherited();
z = 0;
height = 640;
alarm[0] = 1;
ready = false;
start_id = -4;
deac_player = false;
delay = 0;
timer[0] = -1;

timer_func[0] = function()
{
    scene_create(scene, start_id);
};

touched = false;
deac_mapname = false;
