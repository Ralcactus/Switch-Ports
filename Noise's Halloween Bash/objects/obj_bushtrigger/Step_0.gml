if (place_meeting(x, y, obj_player) && !playerinside)
{
    playerinside = true;
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/bushenter", obj_player.x, obj_player.y);
    
    repeat (irandom_range(5, 9))
        instance_create_depth(obj_player.x, obj_player.y, irandom_range(-5, 5), obj_bushparticle);
}

if (!place_meeting(x, y, obj_player) && playerinside)
{
    playerinside = false;
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/bushexit", obj_player.x, obj_player.y);
    
    repeat (irandom_range(5, 9))
        instance_create_depth(obj_player.x, obj_player.y, irandom_range(-5, 5), obj_bushparticle);
}
