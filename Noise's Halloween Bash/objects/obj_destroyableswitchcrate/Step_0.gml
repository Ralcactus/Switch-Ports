if (!place_meeting(x, y, obj_player_punchhitbox))
    hit = false;

if (game_paused())
    exit;

squish = approach(squish, 1, 0.05);
