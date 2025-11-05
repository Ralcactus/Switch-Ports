sequencetimer--;

if (sequencetimer <= explodetime)
{
    if (nextroom >= (array_length(rooms) + 1))
        obj_player.diddeathroute = true;
    else
        instance_destroy(obj_destroyablenitro);
}

if (sequencetimer <= 0)
{
    if (nextroom >= (array_length(rooms) + 1))
    {
        room_goto(startingroom);
        obj_player.state = prevstate;
        instance_destroy();
    }
    else
    {
        finish_explosion_chains();
        fmod_studio_bus_stop_all_events(sfxbus, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
        
        if (nextroom >= array_length(rooms))
        {
            if (!global.playerhit && !obj_player.diddeathroute)
            {
                room_goto(platformroom);
                nextroomtimer = 45;
                explodetime = 40;
            }
            
            nextroom++;
        }
        else
        {
            room_goto(rooms[nextroom++]);
            nextroomtimer = 25;
            explodetime = 15;
        }
        
        nitro = noone;
        sequencetimer = nextroomtimer;
    }
}
