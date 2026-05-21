draw_self();

if (playerID != noone && playerID.state == states.bombpep && playerID.substate == 1)
    draw_sprite(spr_cursor, 0, playerID.x + lengthdir_x(200, playerID.angle), playerID.y + lengthdir_y(200, playerID.angle));
