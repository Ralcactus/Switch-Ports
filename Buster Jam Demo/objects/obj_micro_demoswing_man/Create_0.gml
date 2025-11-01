anim_init();
swing = false;
swing_mask = false;

event_animend = function()
{
    if (anim_sprite == spr_micro_demoswing_man_swing)
    {
        anim_index = sprite_get_number(anim_sprite) - 1;
        
        if (timer[0] == -1)
            timer[0] = 6;
        
        if (swing_mask)
        {
            swing_mask = false;
            
            if (!hit_something)
            {
                with (obj_micro_demoswing_bg)
                {
                    if (ID == other.ID)
                        event_miss();
                }
            }
            
            hit_something = false;
        }
    }
};

timer[0] = -1;

timer_func[0] = function()
{
    swing = false;
    anim_play(spr_micro_demoswing_man_idle);
};

hits = 0;
deac = false;
yoff = 0;
hit_something = false;
question_yoff = 0;
