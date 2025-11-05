if (game_paused())
{
    if (alarm[0] != -1)
        alarm[0]++;
    
    if (alarm[1] != -1)
        alarm[1]++;
    
    exit;
}

if (place_meeting(x, y, obj_player) && (player_collideable() || obj_player.state == states.outhouse) && !(obj_player.state == states.outhouse && obj_player.sprite_index == spr_player_turnaround))
{
    doorswing = min(doorswing + 0.05, 1);
    closesnd = 0;
    
    if (opensnd == 0 && doorswing >= 0.3)
    {
        opensnd = 1;
        scr_fmod_soundeffectONESHOT("event:/sfx/misc/outhouseopen", x, y);
    }
    
    if (input_check_pressed("up") && obj_player.state == states.normal)
    {
        with (obj_player)
        {
            outhousestartx = x;
            outhousestarty = y;
            outhousegoin = true;
            state = states.outhouse;
            image_index = 0;
            sprite_index = spr_player_platformhop;
        }
        
        input_verb_consume(["up", "down", "left", "right"]);
    }
}
else
{
    opensnd = 0;
    
    if (closesnd == 0 && doorswing <= 0.2)
    {
        closesnd = 1;
        scr_fmod_soundeffectONESHOT("event:/sfx/misc/outhouseclose", x, y);
    }
    
    doorswing = max(doorswing - 0.05, 0);
}

if (distance_to_object(obj_player) < 300 && !found)
{
    array_push(obj_levelmap.roominfo_outhouses, 
    {
        room: real(room),
        id: real(id),
        x: x,
        y: y
    });
    found = true;
}

flagind += 0.35;

if (flagind >= sprite_get_number(flagspr))
{
    flagind = 0;
    
    if (flagspr == spr_outhouse_flagappear)
        flagspr = spr_outhouse_flag;
}
