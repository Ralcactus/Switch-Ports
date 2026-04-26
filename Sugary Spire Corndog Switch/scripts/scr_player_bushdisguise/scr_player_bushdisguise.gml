function state_player_bushdisguise()
{
    hsp = 0;
    image_speed = 0.35;
    
    if (shakeTime > 0)
        shakeTime--;
    
    if (inputBufferJump > 0 && shakeTime < 6)
    {
        bushDetection -= 1;
        shakeTime = 12;
        inputBufferJump = 0;
        sprite_index = spr_player_PZ_frothStuck_intro;
        image_index = 0;
    }
    
    if (animation_end() && sprite_index == spr_player_PZ_frothStuck_intro)
        sprite_index = spr_player_PZ_frothStuck;
    
    if (bushDetection <= 0)
    {
        state = UnknownEnum.Value_1;
        sprite_index = spr_idle;
        instance_create(x, y, obj_snowpoofeffect);
        bushDetection = 0;
    }
}
