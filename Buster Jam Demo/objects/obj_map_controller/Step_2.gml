testvariablenothing = false;

if (!instance_exists(obj_map_player))
    exit;

if (coins_before != global.coins)
{
    coins_in_timer = 90;
    var _percent = gui_coins_percent;
    
    if (!gui_coins_in)
        timer_func[1]();
}

var _idle = obj_map_player.x == obj_map_player.xprevious && obj_map_player.y == obj_map_player.yprevious && obj_map_player.z == obj_map_player.zprevious;

if (obj_map_player.deac)
    _idle = false;

if ((_idle || coins_in_timer) && !instance_exists(par_map_cutscene))
{
    if (timer[1] == -1 && !gui_coins_in)
        timer[1] = 60;
}
else
{
    timer[1] = -1;
    
    if (gui_coins_in)
        gui_coins_percent = 1 - gui_coins_percent;
    
    gui_coins_in = false;
}

if (gui_coins_in)
    gui_coins_xoff = use_curve(acurv_linear, gui_coins_percent, "out", coins_xoff_length, 0);
else
    gui_coins_xoff = use_curve(acurv_linear, gui_coins_percent, "in", 0, coins_xoff_length);

gui_coins_percent = approach(gui_coins_percent, 1, 0.07);

if (instance_exists(par_map_cutscene) || instance_exists(obj_microgame_controller) || instance_exists(obj_scene_manager))
    gui_alpha = approach(gui_alpha, 0, 0.1);
else
    gui_alpha = approach(gui_alpha, 1, 0.1);

coins_in_timer = approach(coins_in_timer, 0, 1);
