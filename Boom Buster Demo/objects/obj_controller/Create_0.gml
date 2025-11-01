tv_override = false;
global.freeze = 0;

global.freeze_func = function()
{
};

global.hp = global.hpmax;
global.boss_hp = 3 - (global.act - 1);
global.dollars_start = global.dollars;
global.meter_start = global.combo_meter;
global.onoff = 0;
global.onoff_max = 1;
global.onoff_min = 0;

if (global.nuclear)
    global.nuclear = false;

combo_meter_lerp = global.combo_meter;
hp_spr = spr_ui_hp0;
global.goodnight = false;
goodnight = false;
flash_overlay = false;
pattern_x = 0;
pattern_y = 0;

if (layer_exists(layer_get_id("Collision")))
    layer_set_visible(layer_get_id("Collision"), false);

endless = false;
bossfight = false;
bridget_state_dig = 0;
bridget_state_pull = 1;
bridget_state_react = 2;
bridget_state_wind = 3;
bridget_state_toss = 4;
bridget_state_done = 5;
bridget_state_brb = 6;
bridget_state = bridget_state_dig;
win = false;
global.bgmLoopStart = -4;
global.bgmLoopEnd = -4;
stage_setup();
global.food[global.act] = false;
alarm[0] = 2;

if (bossfight && global.act > 1)
{
    var _trans = instance_create_layer(0, 0, "Transition", obj_transition_fade);
    
    with (_trans)
    {
        fade_alpha = 1;
        state = 1;
        col = 16777215;
    }
}
else
{
    instance_create_layer(0, 0, "Transition", obj_stagestart);
}

tv_bg_ind = 0;

if (global.world == 1)
{
    if (global.stage >= 4)
        tv_bg_ind = 2;
    else
        tv_bg_ind = 1;
}

fps_caption_timer = 5;
asset_obj[0][0] = "obj_bom";
asset_obj[0][1] = "obj_bom";
asset_obj[0][2] = "obj_bom";
asset_obj[1][0] = "obj_dynalife";
asset_obj[1][1] = "obj_barrel";
asset_obj[2][0] = "obj_coin";
asset_obj[2][1] = "obj_food";
asset_obj[3][0] = "obj_lip";
asset_obj[3][1] = "obj_ball";
asset_obj[3][2] = "obj_goblinjr";
asset_obj[3][3] = "obj_rodger";
asset_obj[3][4] = "obj_ritz";
asset_obj[3][5] = "obj_hissy";
asset_obj[4][0] = "tv event";
asset_obj[4][1] = "bridget event";
asset_obj[4][2] = "wizard event";
asset_obj[5][0] = "obj_lightning";
asset_obj[5][1] = "obj_lightsout";
asset_obj[5][2] = "obj_fireball";
asset_obj[5][3] = "obj_meteorshower";
asset_obj[6][0] = "play sound";
follow_target = true;
myX = x;
myY = y;
instance_create_depth(0, 0, layer_get_depth(layer_get_id("Player")) - 1, obj_shaders_instances);
instance_create_depth(0, 0, layer_get_depth(layer_get_id("Particles_Behind")) - 1, obj_shaders_particles_behind);
var _editor = instance_create_layer(0, 0, layer, obj_editor);
_editor.depth = layer_get_depth(layer) - 1;
zoom = 1;
cam_stretch = false;
cam_xoff = 0;
cam_yoff = 0;
relative_position = -4;
relative_pos_ease = 1;
barrier_move = 0;
cam_dir = 1;
move_percent = 0;
timer_dollars_flash = 0;
timer_bridget = 1;
timer_bridget_finish = 2;
timer_win = 3;
timer_channel = 4;
timer_hey = 5;
timer_foodbar_flash = 6;
timer[timer_dollars_flash] = -1;

timer_func[timer_dollars_flash] = function()
{
    dollars_flash = !dollars_flash;
    timer[timer_dollars_flash] = 4;
};

timer[timer_win] = -1;

timer_func[timer_win] = function()
{
    global.act++;
    var _str = string("rm_{0}_s{1}a{2}", world_to_name(global.world), global.stage, global.act);
    var _room = asset_get_index(_str);
    
    if (room_exists(_room))
    {
        var _trans = room_goto_triangles(_room, 45);
        
        _trans.func_roomend = function()
        {
            part_particles_clear(global.part_behind);
            part_particles_clear(global.part_gui);
            part_particles_clear(global.part_over);
            part_particles_clear(global.part_over_nostun);
        };
        
        if (bossfight)
        {
            _trans.col = 16777215;
            _trans.wait = 60;
        }
    }
    else
    {
        audio_sound_gain(global.bgmPlay, 0, 1200);
        var _trans;
        
        if (room == rm_city_s7a3)
            _trans = room_goto_triangles(rm_nothing, 30);
        else
            _trans = room_goto_triangles(rm_results, 60);
        
        _trans.func_roomend = function()
        {
            part_particles_clear(global.part_behind);
            part_particles_clear(global.part_gui);
            part_particles_clear(global.part_over);
            part_particles_clear(global.part_over_nostun);
            audio_stop_all();
        };
    }
};

timer[timer_hey] = 8;

timer_func[timer_hey] = function()
{
    hey_ind = !hey_ind;
    timer[timer_hey] = 8;
};

hey_ind = 0;
timer[timer_foodbar_flash] = -1;

timer_func[timer_foodbar_flash] = function()
{
    foodbar_flash = !foodbar_flash;
};

foodbar_flash = false;
boms_left = boms_total;
bombfuse_ind = 0;
anim_bombfuse = 0;
boms_leftOffset = 0;
boms_leftUI = boms_left;
spark_pos = 0;
spark_posTo = spark_pos;
hp_ind = 0;
target = obj_player;
target_swap = 0;

if (instance_exists(obj_cambarrierL))
    barrierL = obj_cambarrierL.x;
else
    barrierL = 64;

if (instance_exists(obj_cambarrierR))
    barrierR = obj_cambarrierR.x;
else
    barrierR = room_width - 64;

if (instance_exists(obj_cambarrierU))
    barrierU = obj_cambarrierU.y;
else
    barrierU = 64;

if (instance_exists(obj_cambarrierD))
    barrierD = obj_cambarrierD.y;
else
    barrierD = room_height - 64;

global.hurt = -4;
channel = 1;
tv_script[0] = asset_get_index("scr_tv_static");
tv_script[1] = asset_get_index("scr_tv_bridget");
tv_script[2] = asset_get_index("scr_tv_wizard");
timer[timer_channel] = -1;

timer_func[timer_channel] = function()
{
    channel = channel_next;
};

channel_change = function(arg0, arg1 = 25)
{
    timer[timer_channel] = arg1;
    channel = 0;
    channel_next = arg0;
};

static_ind = 0;
scr_tv_create_bridget();
scr_tv_create_wizard();
dollars = global.dollars;
dollars_flash = false;

draw_dollars = function()
{
    var _spd;
    
    if ((global.dollars - dollars) >= 15)
        _spd = 0.5;
    else if ((global.dollars - dollars) >= 10)
        _spd = 0.35;
    else if ((global.dollars - dollars) <= 0.75)
        _spd = 0.03125;
    else
        _spd = 0.125;
    
    if (!exit_freeze())
        dollars = approach(dollars, global.dollars, _spd);
    
    if (dollars == global.dollars)
    {
        if (!dollars_flash)
            timer[timer_dollars_flash] = -1;
    }
    else if (timer[timer_dollars_flash] == -1)
    {
        timer_func[timer_dollars_flash]();
    }
    
    var _dbary, _dy;
    
    if (endless)
    {
        draw_sprite_ext(spr_ui_topdollars, 0, 1172, 661, 1, 1, 0, c_white, 1);
        _dbary = 803;
        _dy = 838;
    }
    else
    {
        _dbary = 671;
        _dy = 708;
    }
    
    draw_sprite_ext(spr_ui_dollars, 0, 1172, _dbary, 1, 1, 0, c_white, 1);
    draw_set_font(obj_persistent.font_alarm);
    
    if (endless)
    {
        if (dollars_flash && global.top_dollars < dollars)
            draw_set_color(make_colour_rgb(255, 163, 102));
        else
            draw_set_color(make_colour_rgb(255, 0, 0));
        
        var _dollars;
        
        if (dollars > global.top_dollars)
            _dollars = dollars;
        else
            _dollars = global.top_dollars;
        
        draw_text(1320, 698, string_add_zeros(_dollars, 4, 2));
    }
    
    if (dollars_flash)
        draw_set_color(make_colour_rgb(200, 255, 163));
    else
        draw_set_color(make_colour_rgb(94, 209, 15));
    
    var _angle;
    
    if (endless)
        _angle = 0.8;
    else
        _angle = 1;
    
    draw_text_transformed(1317, _dy, string_add_zeros(dollars, 4, 2), 1, 1, _angle);
    draw_set_color(c_white);
};

draw_bombcounter = function()
{
    draw_sprite_gui(spr_ui_bomb, 0, 1436, 292);
    var _pos = spark_pos;
    var _x = path_get_x(pth_gui_bombfuse, _pos);
    var _y = path_get_y(pth_gui_bombfuse, _pos);
    
    if (spark_pos >= 1)
    {
    }
    else
    {
        draw_sprite_gui(spr_ui_bombFuse, spark_pos * sprite_get_number(spr_ui_bombFuse), 1436, 292);
        draw_sprite_gui_ext(spr_ui_bombSpark, bombfuse_ind, 1436 + _x, 292 + _y, undefined, undefined, 0);
    }
    
    _x = 20;
    _y = 444;
    
    if (string_length(string(boms_left)) == 1)
    {
        var _shakex, _shakey;
        
        if (exit_freeze())
        {
            _shakex = 0;
            _shakey = 0;
        }
        else
        {
            _shakex = irandom_range(-boms_leftOffset, boms_leftOffset);
            _shakey = irandom_range(-boms_leftOffset, boms_leftOffset);
        }
        
        draw_set_font(obj_persistent.font_bombmiddle);
        draw_text(1208 + _shakex, _y + _shakey, string(boms_left));
    }
    else
    {
        var _shakex, _shakey;
        
        if (exit_freeze())
        {
            _shakex = 0;
            _shakey = 0;
        }
        else
        {
            _shakex = irandom_range(-boms_leftOffset, boms_leftOffset);
            _shakey = irandom_range(-boms_leftOffset, boms_leftOffset);
        }
        
        draw_set_font(obj_persistent.font_bombleft);
        draw_text(1180 + _x + _shakex + 6, _y + _shakey, string_char_at(string(boms_left), 1));
        
        if (exit_freeze())
        {
            _shakex = 0;
            _shakey = 0;
        }
        else
        {
            _shakex = irandom_range(-boms_leftOffset, boms_leftOffset);
            _shakey = irandom_range(-boms_leftOffset, boms_leftOffset);
        }
        
        draw_set_font(obj_persistent.font_bombright);
        draw_text(1256 + _x + _shakex + 2, _y + 8 + _shakey, string_char_at(string(boms_left), 2));
    }
};

global.food[global.act - 1] = false;

draw_foodbar = function()
{
    if (!bossfight)
    {
        draw_sprite_gui(spr_foodbar, 0, 1433, 804);
        
        for (var i = 0; i < 3; i++)
            draw_sprite_gui(spr_foodbar, 19 + i, 1433, 804);
        
        if (global.food[0] && global.food[1])
            draw_sprite_gui_ext(spr_foodbar, 4, 1433, 804, 1, 1, 0, 16777215, 1);
        
        if (global.food[1] && global.food[2])
            draw_sprite_gui_ext(spr_foodbar, 5, 1433, 804, 1, 1, 0, 16777215, 1);
        
        for (var i = 0; i < 3; i++)
        {
            if (global.food[i])
                draw_sprite_gui_ext(spr_foodbar, i + 1, 1433, 804, 1, 1, 0, 16777215, 1);
        }
        
        for (var i = 0; i < 3; i++)
        {
            var _x, _y;
            
            if (i == 0)
            {
                _x = 114;
                _y = 879;
            }
            else if (i == 1)
            {
                _x = 247;
                _y = 884;
            }
            else if (i == 2)
            {
                _x = 389;
                _y = 874;
            }
            
            if (global.food[i])
            {
                var _ind = ((global.stage - 1) * 3) + i;
                draw_sprite_gui_ext(spr_foodbar, 6 + i, 1433, 804, 1, 1, 0, 16777215, 1);
                draw_sprite_gui_ext(spr_food_city, _ind, 1408 + _x, _y, 1, 1, 0, 16777215, 1);
            }
        }
    }
};

draw_bossui = function()
{
    if (bossfight)
    {
        draw_sprite_gui(spr_border_boss, 0, 1428, 770);
        var _ind = 3 - global.boss_hp;
        draw_sprite_gui(spr_ui_bosshp, _ind, 1448, 831);
        
        for (var i = 0; i < 3; i++)
        {
            _ind = 3 - i;
            var _spr;
            
            if (global.boss_hp < _ind)
                _spr = spr_ui_wizardhp_loss;
            else
                _spr = spr_ui_wizardhp;
            
            draw_sprite_gui(_spr, i, 1432, 773);
        }
    }
};

draw_combometer = function()
{
    var _barSprW = sprite_get_width(spr_combometer);
    var _barSprH = sprite_get_height(spr_combometer);
    var _barW = _barSprW * (combo_meter_lerp / global.combo_metermax);
    var _barW_white = _barSprW * (global.combo_meter / global.combo_metermax);
    draw_sprite_gui(spr_combometer, 1, 1431, 970);
    draw_sprite_gui(spr_foodbar_icon, 0, 1776, 957);
    
    if (global.combo_meter < global.combo_metermax)
    {
        draw_sprite_gui_ext(spr_foodbar_icon, 0, 1776, 957, undefined, undefined, undefined, 0, 0.4);
        timer[timer_foodbar_flash] = -1;
        foodbar_flash = false;
    }
    else if (timer[timer_foodbar_flash] == -1)
    {
        timer[timer_foodbar_flash] = 6;
    }
    
    if (!global.goodnight)
        draw_sprite_part(spr_combometer, 4, 0, 0, _barW_white, _barSprH, 1175, 970);
    
    draw_sprite_part(spr_combometer, 2, 0, 0, _barW, _barSprH, 1175, 970);
    var _alpha = 0.3;
    var _w = sprite_get_width(spr_charpattern);
    var _h = sprite_get_height(spr_charpattern);
    draw_set_mask(1175, 970, spr_combometer, 0);
    draw_sprite_ext(spr_charpattern, 0, 1175 + pattern_x, 970 + pattern_y, 1, 1, 0, c_white, _alpha);
    draw_sprite_ext(spr_charpattern, 0, 1175 + pattern_x + _w, 970 + pattern_y, 1, 1, 0, c_white, _alpha);
    draw_sprite_ext(spr_charpattern, 0, 1175 + pattern_x + _w, (970 + pattern_y) - _h, 1, 1, 0, c_white, _alpha);
    draw_sprite_ext(spr_charpattern, 0, 1175 + pattern_x, (970 + pattern_y) - _h, 1, 1, 0, c_white, _alpha);
    _alpha = 1;
    var _x = 1175;
    var _y = 970;
    draw_set_bounds(_x, _y, _x + _barW, _y + _barSprH);
    draw_sprite_ext(spr_charpattern, 0, 1175 + pattern_x, 970 + pattern_y, 1, 1, 0, c_white, _alpha);
    draw_sprite_ext(spr_charpattern, 0, 1175 + pattern_x + _w, 970 + pattern_y, 1, 1, 0, c_white, _alpha);
    draw_sprite_ext(spr_charpattern, 0, 1175 + pattern_x + _w, (970 + pattern_y) - _h, 1, 1, 0, c_white, _alpha);
    draw_sprite_ext(spr_charpattern, 0, 1175 + pattern_x, (970 + pattern_y) - _h, 1, 1, 0, c_white, _alpha);
    draw_remove_mask();
    draw_reset_clip();
    
    if (foodbar_flash)
    {
        shader_set(sha_flash);
        draw_sprite_gui_ext(spr_foodbar_icon, 0, 1776, 957, undefined, undefined, undefined, undefined, 0.25);
        draw_sprite_gui_ext(spr_combometer, 4, 1431, 970, undefined, undefined, undefined, undefined, 0.25);
        shader_reset();
    }
};

draw_hp = function()
{
    var _shake = 0;
    draw_sprite_gui(hp_spr, hp_ind, 1458 + (_shake * irandom_range(-3, 3)), 492 + (_shake * irandom_range(-3, 3)));
};
