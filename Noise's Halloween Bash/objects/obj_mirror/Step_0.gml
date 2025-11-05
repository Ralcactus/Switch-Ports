if (game_paused())
{
    if (alarm[0] != -1)
        alarm[0]++;
    
    exit;
}

if (place_meeting(x, y, obj_player))
{
    if (input_check_pressed("up") && obj_player.state == states.normal)
    {
        with (obj_player)
        {
            outhousestartx = x;
            outhousestarty = y;
            state = states.mirror;
            image_index = 0;
            sprite_index = spr_player_platformhop;
        }
        
        input_verb_consume(["up", "down", "left", "right"]);
    }
}
