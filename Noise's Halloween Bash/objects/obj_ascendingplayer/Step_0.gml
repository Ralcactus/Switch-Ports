if (game_paused())
{
    if (alarm[0] != -1)
        alarm[0]++;
    
    if (alarm[1] != -1)
        alarm[1]++;
    
    if (alarm[2] != -1)
        alarm[2]++;
    
    if (alarm[3] != -1)
        alarm[3]++;
    
    image_index -= image_speed;
    exit;
}

blink = approach(blink, 0, 0.05);

if (!startsave)
{
    if (dothing)
    {
        if (shadow)
        {
            var _num = sprite_get_number(tex_shadow);
            shadowind += 0.35;
            
            if (shadowind >= _num)
            {
                shadowind = _num;
                shadow = false;
                alarm[1] = 60;
            }
        }
        
        if (ascend)
        {
            vsp -= 0.1;
            y += vsp;
            
            if (y < (obj_drawcontroller.camY - global.maxscreenheight))
            {
                dothing = false;
                fmod_studio_event_instance_start(atmosphere);
                alarm[3] = 300;
            }
        }
        else if (float)
        {
            var _pY = y;
            y = ystart - 16 - (easy_sin(cycle++ / 120) * 16);
            vsp = y - _pY;
        }
    }
    else if (alarm[3] == -1)
    {
        x = obj_player.x;
        y = obj_player.y;
    }
}
else if (obj_savesystem.savestate == save_state.idle && event_count_description("event:/sfx/misc/secret") == 0)
{
    event_stop(atmosphere, true);
    game_end();
}
