if (game_paused())
{
    image_index -= image_speed;
    exit;
}

if (dothing)
{
    if (image_speed < 1)
        image_speed += 0.003;
    else
    {
        vsp -= 0.1;
        y += vsp;
        
        if (floor(image_index) % 2)
        {
            if (!doparticle)
            {
                var _nodes = 8;
                var _pernode = (2 * pi) / _nodes;
                var _radius = 32;
                scr_createparticle(true, x + (cos(particle * _pernode) * _radius), bbox_bottom - 7, obj_player.z + (sin(particle * _pernode) * _radius), spr_cloudeffect, 1, 1, 0, 0.35, 0, 0, 0, 0, 0);
                particle++;
                doparticle = true;
            }
        }
        else
            doparticle = false;
    }
    
    if (fmod_studio_system_get_parameter_by_name("bringtorank").final_value == 1)
    {
        room_goto(sendtojeg ? Jeg : RankRoom);
        obj_player.state = states.actor;
    }
}
else
{
    x = obj_player.x;
    y = obj_player.y;
}
