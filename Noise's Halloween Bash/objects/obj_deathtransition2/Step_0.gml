if (game_paused())
    exit;

if (state == 0 && obj_player.state == states.dead && (obj_player.sprite_index == spr_player_deadloop || obj_player.sprite_index == spr_player_firedeathloop))
    state = 1;

if (state == 0)
    rad = lerp(rad, 90, 0.15);

if (state == 1)
{
    rad -= 5;
    
    if (rad <= -75)
    {
        with (instance_create_depth(x, y, depth, obj_deathtransition1))
        {
            start = true;
            fade = 1;
        }
        
        instance_destroy();
    }
}
