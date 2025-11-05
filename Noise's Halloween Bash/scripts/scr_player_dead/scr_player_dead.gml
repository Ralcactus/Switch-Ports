function scr_player_dead()
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    image_speed = 0.35;
    
    if (sprite_animation_end() && sprite_index == spr_player_dead)
        sprite_index = spr_player_deadloop;
    
    if (sprite_animation_end() && sprite_index == spr_player_firedeath)
        sprite_index = spr_player_firedeathloop;
    
    if (!event_isplaying(deaddisintergratesnd))
    {
        if (floor(image_index) == 38 && sprite_index == spr_player_firedeath)
            scr_fmod_soundeffect(deaddisintergratesnd, x, y);
    }
    
    if (!event_isplaying(deadpopsnd))
    {
        if (floor(image_index) == 17 && sprite_index == spr_player_dead)
            scr_fmod_soundeffect(deadpopsnd, x, y);
    }
    
    if (!event_isplaying(deadblinksnd))
    {
        if (floor(image_index) == 39 && sprite_index == spr_player_dead)
            scr_fmod_soundeffect(deadblinksnd, x, y);
        
        if (floor(image_index) == 13 && sprite_index == spr_player_firedeath)
            scr_fmod_soundeffect(deadblinksnd, x, y);
        
        if (floor(image_index) == 25 && sprite_index == spr_player_firedeath)
            scr_fmod_soundeffect(deadblinksnd, x, y);
    }
}
