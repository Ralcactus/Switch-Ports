shader = sha_heatwave;
uTime = shader_get_uniform(shader, "Time");
uTexel = shader_get_uniform(shader, "Texel");
uFreq = shader_get_uniform(shader, "uFreq");
uSize = shader_get_uniform(shader, "uSize");
time = 0;
alarm[0] = 1;
global.game_music = "bgm_micro_demoswing";
global.game_music_loops = true;
timer[0] = -1;

timer_func[0] = function()
{
    var _inst = instance_create_micro(controller.game_width + 120, 504, "Middle", obj_micro_demoswing_dynamite);
    
    if (lost)
        _inst.ending = true;
    
    if (!lost)
        timer[0] = irandom_range(35, 84);
};

timer[1] = -1;

timer_func[1] = function()
{
    with (obj_micro_demoswing_man)
    {
        if (ID == other.ID)
            anim_play(spr_micro_demoswing_man_lose);
        
        yoff = 1;
    }
};

balls = 6;
crumble_ind = 0;
building_y = 0;
crumbling = false;
misses = 0;
lost = false;
miss_delay = 0;

event_miss = function()
{
    if (miss_delay)
        exit;
    
    miss_delay = 25;
    misses++;
    
    if (misses > 2)
        misses = 2;
    
    if (misses == 2 && !lost)
    {
        lost = true;
        
        with (obj_micro_demoswing_man)
        {
            if (ID == other.ID)
                deac = true;
        }
        
        timer[0] = 60 * time_bpm_to_seconds(140) * 3;
        timer[1] = 60 * time_bpm_to_seconds(140) * 1.5;
        
        with (obj_micro_demoswing_dynamite)
        {
            if (ID == other.ID && !missed)
                instance_destroy();
        }
    }
};

timer[2] = -1;

timer_func[2] = function()
{
    with (instance_find_micro(obj_micro_demoswing_man))
    {
        anim_play(spr_micro_demoswing_man_win);
        timer[0] = -1;
    }
    
    timer[3] = 60 * time_bpm_to_seconds(140) * 4.5;
};

timer[3] = -1;

timer_func[3] = function()
{
    with (instance_find_micro(obj_micro_demoswing_man))
        anim_sprite = spr_micro_demoswing_man_win_circumstance;
};

crumble_alpha = 0;
