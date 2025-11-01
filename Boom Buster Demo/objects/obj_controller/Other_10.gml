if (win)
    exit;

win = true;
timer[timer_bridget] = -1;
global.nuclear = false;
alarm[1] = 3;

if (global.world == 0)
{
    with (obj_player_ghost)
        out = true;
}

if (bossfight)
{
    instance_create_layer(0, 0, "GUI", obj_bossfight_win);
    exit;
}

timer[timer_win] = 60;
