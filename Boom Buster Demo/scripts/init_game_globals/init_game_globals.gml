function init_game_globals()
{
    global.hpmax = 3;
    global.hp = global.hpmax;
    global.powerup = 0;
    global.dollars = 0;
    global.top_dollars = 0;
    global.combo_meter = 0;
    global.combo_metermax = 12;
    global.nuclear = false;
    global.freeze = 0;
    
    for (var i = 0; i < 3; i++)
        global.food[i] = false;
    
    global.goodnight = false;
    global.dome = false;
    global.dome_alpha = 0;
    global.dome_ind = -1;
    global.dome_timer = 300;
    global.dome_order = [0];
    
    for (var i = 0; i < (sprite_get_number(bgr_city_sunset_dome) - 1); i++)
        global.dome_order[i] = i + 1;
    
    var _dome = global.dome_order;
    global.dome_order = array_shuffle(_dome);
}
