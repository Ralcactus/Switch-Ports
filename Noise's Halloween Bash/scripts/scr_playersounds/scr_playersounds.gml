function scr_playersounds()
{
    with (obj_player)
    {
        var _attr = new Fmod3DAttributes();
        _attr.position.x = x;
        _attr.position.y = y;
        _attr.position.z = 0;
        _attr.forward.z = 1;
        _attr.up.y = 1;
        
        if (state == states.sprint || state == states.wall)
        {
            if (!event_isplaying(machsnd))
                fmod_studio_event_instance_start(machsnd);
            
            var s = 0;
            
            switch (sprite_index)
            {
                case spr_player_mach1:
                    s = 1;
                    break;
                
                case spr_player_mach2:
                    s = 2;
                    break;
                
                case spr_player_mach2fast:
                    s = 3;
                    break;
            }
            
            fmod_studio_event_instance_set_parameter_by_name(machsnd, "state", s, true);
            event_set_3d_position_struct(machsnd, _attr);
        }
        else
            event_stop(machsnd, 1);
        
        if (state == states.standstillrun)
        {
            if (!event_isplaying(runinplacesnd))
                fmod_studio_event_instance_start(runinplacesnd);
        }
        else
            event_stop(runinplacesnd, 1);
        
        if (state == states.wallslide)
        {
            if (!event_isplaying(wallslidesnd))
                fmod_studio_event_instance_start(wallslidesnd);
        }
        else
            event_stop(wallslidesnd, 1);
        
        if (event_isplaying(groundpoundsnd) && (state != states.groundpound || (state == states.groundpound && sprite_index == spr_player_groundpoundland)))
            event_stop(groundpoundsnd, 1);
        
        if (event_isplaying(cartwheelsnd) && sprite_index != spr_player_cartwheel)
            event_stop(cartwheelsnd, 1);
        
        event_set_3d_position_struct(hurtsnd, _attr);
        event_set_3d_position_struct(cartwheelsnd, _attr);
        event_set_3d_position_struct(punchsnd, _attr);
        event_set_3d_position_struct(bitesnd, _attr);
        event_set_3d_position_struct(runinplacesnd, _attr);
        event_set_3d_position_struct(slidesnd, _attr);
        event_set_3d_position_struct(tornadosnd, _attr);
        event_set_3d_position_struct(wallslidesnd, _attr);
        event_set_3d_position_struct(groundpoundsnd, _attr);
    }
}
