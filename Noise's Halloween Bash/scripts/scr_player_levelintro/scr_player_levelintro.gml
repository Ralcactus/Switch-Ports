function scr_player_levelintro()
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    image_speed = 0.35;
    
    if (sprite_index == spr_player_titlescreenlaunch)
    {
        image_speed = 0.8;
        y += 18;
        
        if (y >= levelstarty)
        {
            y = levelstarty;
            sprite_index = spr_player_titlescreenlaunchland;
            scr_fmod_soundeffectONESHOT("event:/sfx/player/levelintroland", x, y);
            gamepadvibrate(0.6, 0, 15);
        }
    }
    
    if (sprite_index == spr_player_titlescreenlaunchland)
    {
        if (floor(image_index) == 23 && !event_isplaying(levelintropopoutsnd))
            scr_fmod_soundeffect(levelintropopoutsnd, x, y);
        
        if (floor(image_index) == 33 && !event_isplaying(voicerandom))
            scr_fmod_soundeffect(voicerandom, x, y);
        
        if (sprite_animation_end())
        {
            state = states.normal;
            vsp = 0;
        }
    }
}
