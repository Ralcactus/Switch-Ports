x += hsp;

if (place_meeting(x, y, obj_parent_player))
    hsp = (10 + (obj_parent_player.movespeed / 2)) * sign(obj_parent_player.xscale);
