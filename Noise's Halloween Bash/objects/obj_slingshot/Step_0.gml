if (game_paused())
{
    if (alarm[0] != -1)
        alarm[0]++;
    
    exit;
}

if (cooldown > 0)
    cooldown--;

if (place_meeting(x, y, obj_player) && obj_player.state == states.sprint && cooldown == 0)
{
    if (!touch)
    {
        touch = 1;
        alarm[0] = 30;
    }
}

with (obj_player)
{
    if (other.touch)
    {
        x = round(approach(x, other.x, movespeed));
        
        if (state != states.sprint)
        {
            with (other.id)
            {
                alarm[0] = -1;
                touch = 0;
                cooldown = 0;
            }
        }
    }
}
