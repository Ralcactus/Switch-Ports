anim_init();
physics_init_2d_micro();
my_solid = obj_micro_karatedodge_ground;
my_onewayU = -4;
my_onewayL = -4;
my_onewayR = -4;
my_onewayD = -4;
my_ground_par = obj_micro_karatedodge_ground;
my_barrier = -4;
jump_strength = 22;
slide = false;
my_slide_snd = -4;
timer[0] = -1;

timer_func[0] = function()
{
    var _inside_ceiling = place_meeting_micro(x, y, obj_micro_karatedodge_ceiling);
    var _mask = mask_index;
    mask_index = spr_micro_karatedodge_mask;
    
    if (!_inside_ceiling && place_meeting_micro(x, y, obj_micro_karatedodge_ceiling) && _mask == spr_micro_karatedodge_mask_slide)
    {
        timer[0] = 1;
        mask_index = spr_micro_karatedodge_mask_slide;
        exit;
    }
    
    if (audio_is_playing(my_slide_snd))
    {
        audio_stop_sound(my_slide_snd);
        my_slide_snd = -4;
    }
    
    slide = false;
};

slide_time = 24;
