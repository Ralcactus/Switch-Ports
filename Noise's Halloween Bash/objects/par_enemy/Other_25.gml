if (game_paused() || hitstuntime > 0 || !player_collideable() || nohit)
    exit;

shakecam(20, 20);
gamepadvibrate(0.3, 0, 12);
hitstun(4);
scr_createparticle(true, bbox_left + ((bbox_right - bbox_left) / 2), bbox_top + ((bbox_bottom - bbox_top) / 2), obj_player.z + 1, spr_bangeffect, 1, 1, 0, 0.35, 0, 0, 0, 0, 0);
killed = true;
scr_fmod_soundeffectONESHOT("event:/sfx/enemy/enemykill", x, y);
