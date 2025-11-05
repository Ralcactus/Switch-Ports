var _ind = angle_difference(-faceangle, point_direction(obj_jegplayer.x, obj_jegplayer.y, x, y));
_ind = wrap(_ind, 0, 360);
_ind = (round(_ind / 45) * 45) / 45;
draw_sprite_billboard_ext(spr_jeg, _ind, x, z, y, 1, 1, 0, c_white, 1, false);
