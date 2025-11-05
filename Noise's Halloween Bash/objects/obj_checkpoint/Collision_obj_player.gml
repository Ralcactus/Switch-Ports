if (game_paused() || !player_collideable())
    exit;

if (other.currcheckpoint.id != id)
    set_player_checkpoint();
