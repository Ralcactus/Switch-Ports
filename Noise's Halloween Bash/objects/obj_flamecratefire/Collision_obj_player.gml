if (game_paused() || !player_collideable() || !(fire && firescale > 0.5))
    exit;

with (other.id)
    scr_hurtplayer(1, playerdeath.firedeath);
