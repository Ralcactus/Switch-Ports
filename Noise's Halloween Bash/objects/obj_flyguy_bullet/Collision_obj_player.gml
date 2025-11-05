if (!instance_exists(parent) || game_paused() || !player_collideable())
    exit;

scr_hurtplayer();
