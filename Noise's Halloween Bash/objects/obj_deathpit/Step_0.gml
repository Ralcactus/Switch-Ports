if (game_paused() || (!player_collideable() && obj_player.state != states.falllocked))
    exit;

if (place_meeting(x, y, obj_player) && !playercollided)
{
    if (global.godmode)
    {
        obj_player.vsp = -12;
        obj_player.jumpstop = 1;
    }
    else
    {
        obj_player.state = states.falllocked;
        obj_player.hit_horizontal = -1;
        obj_player.hit_vertical = -1;
        playercollided = true;
        
        if (!in_deathroute())
            global.playerhit = true;
        
        scr_fmod_soundeffectONESHOT("event:/sfx/player/pitfallfall", obj_player.x, obj_player.y);
    }
}

if (playercollided && obj_player.y > bbox_bottom && !playerfell)
{
    shakecam(6, 1);
    
    with (obj_player)
    {
        with (instance_create_depth(x, y, depth, obj_playergib))
        {
            image_index = 3;
            hsp = -0.25;
            vsp = -28;
            z = other.z;
            curpalette = other.curpalette;
            collideables = noone;
        }
        
        with (instance_create_depth(x, y, depth + 2, obj_playergib))
        {
            image_index = 4;
            hsp = 0.25;
            vsp = -26;
            z = other.z + 2;
            curpalette = other.curpalette;
            collideables = noone;
        }
        
        sprite_index = spr_player_nothing;
        scr_fmod_soundeffectONESHOT("event:/sfx/player/pitfallland", x, y);
        scr_fmod_soundeffectONESHOT("event:/sfx/player/pitfallthrow", x, y);
    }
    
    with (instance_create_depth(x, y, -12500, obj_deathtransition1))
        alarm[0] = 120;
    
    playerfell = true;
}
