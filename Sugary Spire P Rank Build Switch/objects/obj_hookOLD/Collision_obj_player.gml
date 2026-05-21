if (other.state != states.hooks && other.state != states.frozen && other.state != states.noclip)
{
    with (other)
    {
        switch (state)
        {
            case states.handstandjump:
                playerPrevState = states.mach2;
                playerPrevSprite = spr_player_mach2;
                break;
            
            case states.hurt:
                playerPrevState = states.mach2;
                playerPrevSprite = spr_player_mach2;
                break;
            
            case states.machslide:
                if (sprite_index == spr_machslideboost3)
                {
                    playerPrevState = states.mach3;
                    playerPrevSprite = spr_mach3player;
                }
                else if (sprite_index == spr_player_machslideboost)
                {
                    playerPrevState = states.mach2;
                    playerPrevSprite = spr_player_mach2;
                }
                else
                {
                    playerPrevState = states.machslide;
                    playerPrevSprite = spr_player_crouchslide;
                }
                
                break;
            
            case states.cotton:
            case states.cottondrill:
            case states.cottonroll:
                playerPrevState = states.mach2;
                playerPrevSprite = spr_player_mach2jump;
                break;
            
            case states.tumble:
                playerPrevState = states.mach2;
                playerPrevSprite = spr_player_mach2jump;
                break;
            
            default:
                playerPrevSprite = sprite_index;
                playerPrevState = state;
                break;
        }
        
        y = other.y - 14;
        x = other.x;
        state = states.hooks;
        
        if (other.hookSubState == HookType.right)
            xscale = 1;
        else if (other.hookSubState == HookType.left)
            xscale = -1;
        
        substate = other.hookSubState;
        verticalMovespeed = vsp;
        hspCarry = 0;
        slideHsp = 0;
        vspCarry = 0;
    }
    
    audio_emitter_free(hookSoundEmitter);
}
