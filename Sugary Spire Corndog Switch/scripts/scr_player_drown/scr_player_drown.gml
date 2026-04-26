function state_player_drown()
{
    var water_y = y;
    
    with (instance_place(x, y, obj_molasseswater))
        water_y = wave(3, -3, 3, 0) + y + 9;
    
    y = round(lerp(y, water_y, 0.25));
    hsp = round(lerp(0, hsp, 0.15));
    vsp = round(lerp(0, vsp, 0.15));
    
    if (animation_end() || key_down)
        scr_playerrespawn(false);
    
    if (inputBufferJump > 0 && !key_down)
    {
        inputBufferJump = 0;
        fmod_event_play(sndJump);
        sprite_index = spr_player_PZ_drown_jump;
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        vsp = -12;
        state = UnknownEnum.Value_55;
        image_index = 0;
    }
    
    image_speed = 0.35;
}
