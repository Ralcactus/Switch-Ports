image_speed = 0;
shard_positions = [];
shard_positions = [[228, 62], [306, 83], [375, 137], [315, 160], [266, 207], [217, 239], [165, 303], [241, 372], [232, 298], [287, 295], [320, 233], [375, 199], [386, 260], [447, 258], [500, 301], [552, 332], [452, 333], [379, 344], [336, 297], [303, 359], [172, 368], [91, 288], [82, 362], [117, 449], [175, 512], [184, 581], [119, 517], [185, 643], [219, 712], [243, 760], [302, 784], [359, 798], [448, 798], [525, 798], [593, 798], [595, 741], [545, 680], [507, 607], [473, 566], [457, 521], [439, 466], [409, 395], [190, 437], [246, 432], [309, 432], [363, 432], [219, 497], [273, 498], [348, 493], [395, 552], [330, 552], [262, 551], [272, 613], [331, 612], [373, 616], [454, 646], [368, 670], [291, 684], [355, 724], [408, 729], [481, 723], [418, 604], [400, 489]];
explosion_positions = [];
explosion_positions = [[203, 190], [285, 696], [439, 467], [167, 468], [393, 258], [132, 303]];
shake = 0;
hurt_next_time = false;

event_hit = function()
{
    if (hit_delay)
        exit;
    
    with (obj_frenzy_counter)
    {
        if (instance_exists(obj_frenzy))
            game = obj_frenzy.game;
    }
    
    hit_delay = 60;
    
    if (hurt_next_time)
    {
        image_index++;
        hurt_next_time = false;
    }
    
    event_user(0);
    col_offset = choose(0, 1);
    explosion_count = 0;
    
    if (obj_frenzy.games_done)
        explosion_count_max = 16;
    else
        explosion_count_max = 2;
    
    explosion_positions_next = [];
    explosion_positions_next = array_concat(explosion_positions_next, explosion_positions);
    explosion_positions_next = array_shuffle(explosion_positions_next);
    timer_func[0]();
    timer_func[1]();
};

hit_delay = 0;
explosion_delay = 8;
timer[0] = -1;

timer_func[0] = function()
{
    event_user(1);
    explosion_count++;
    
    if (explosion_count < explosion_count_max)
        timer[0] = explosion_delay;
};

shards_final_delay = 4;
timer[1] = -1;

timer_func[1] = function()
{
    var _count = irandom_range(2, 4);
    var _subimg = irandom_range(0, sprite_get_number(spr_boomtown_wizardstatue_shards) - 1);
    
    for (var i = 0; i < _count; i++)
    {
        var _num = irandom_range(0, array_length(shard_positions) - 1);
        var _x = (x + shard_positions[_num][0]) - 12;
        var _y = (y + shard_positions[_num][1]) - 32;
        var _xcenter = x + 329;
        var _ycenter = y + 417.5;
        
        if (_x < _xcenter)
            _xdir = -1;
        else
            _xdir = 1;
        
        var _xdir = choose(-1, 1);
        var _hspd = random_range(3, 6) * _xdir;
        var _vspd = random_range(-9, -14);
        var _grav = random_range(0.8, 1);
        var _zspd = 0;
        var _inst = instance_create_layer(_x, _y, "FX", obj_map_fx);
        _inst.anim_sprite = spr_boomtown_wizardstatue_shards;
        _inst.anim_speed = 0;
        _inst.die_outside_view = true;
        _inst.sprite_index = _inst.anim_sprite;
        _inst.anim_index = _subimg;
        _inst.image_index = _inst.anim_index;
        _inst.image_speed = 0;
        _inst.vspd = _vspd;
        _inst.hspd = _hspd;
        _inst.zspd = _zspd;
        _inst.grav = _grav;
        _inst.ignore_render = true;
        _inst.visible = true;
        _inst.rot_spd = -_inst.hspd * 0.7;
        
        if (explosion_count < explosion_count_max)
            timer[1] = shards_final_delay;
    }
};

timer[2] = -1;

timer_func[2] = function()
{
    visible = false;
};
