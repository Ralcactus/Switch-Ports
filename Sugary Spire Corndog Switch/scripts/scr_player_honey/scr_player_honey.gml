function state_player_honey()
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    move = key_left + key_right;
    sprite_index = spr_player_PZ_honeyStuck;
    image_speed = 0.35;
    
    if (move != 0)
        xscale = move;
    
    var honeyID = instance_place(x, y, obj_honeypanel);
    
    if (instance_exists(honeyID))
    {
        x = lerp(x, honeyID.x, 0.3);
        y = lerp(y, honeyID.y, 0.3);
    }
    
    if (inputBufferJump > 0)
    {
        inputBufferJump = 0;
        
        if (instance_exists(honeyID))
        {
            x = honeyID.x;
            y = honeyID.y;
        }
        
        scr_taunt_setVariables();
        vsp = -11;
        jumpStop = false;
        jumpAnim = true;
        fmod_event_play(sndJump);
        
        if (instance_exists(honeyID))
        {
            with (honeyID)
                event_user(0);
        }
    }
    
    exit;
}
