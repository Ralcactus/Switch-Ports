function scr_player_falllocked()
{
    movespeed = 0;
    hsp = 0;
    
    if (sprite_index == spr_player_nothing)
        vsp = 0;
    
    if (sprite_animation_end())
    {
        switch (sprite_index)
        {
            case spr_player_jumppeak:
            case spr_player_jump:
                image_index = 0;
                sprite_index = spr_player_jumpend;
                break;
            
            case spr_player_fallturn:
            case spr_player_jumpend:
                sprite_index = spr_player_fall;
                break;
            
            case spr_player_crouchfallturn:
            case spr_player_crouchjumpend:
                sprite_index = spr_player_fall;
                break;
            
            case spr_player_longjump:
            case spr_player_sidesomersault:
                sprite_index = spr_player_longjumpend;
                break;
            
            case spr_player_hoverturn:
            case spr_player_hoverstart:
                sprite_index = spr_player_hover;
                break;
            
            case spr_player_mach2jump:
                sprite_index = spr_player_mach2fall;
                break;
            
            case spr_player_walljumpstart:
            case spr_player_walljump2start:
                sprite_index = spr_player_walljump;
                break;
            
            case spr_player_mach2fallturn:
                sprite_index = spr_player_mach2fall;
                break;
            
            case spr_player_crouchfallbunnyturn:
                sprite_index = spr_player_crouchfallbunny;
                break;
        }
    }
    
    image_speed = 0.35;
}
