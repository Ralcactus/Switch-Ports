switch (state)
{
    case UnknownEnum.Value_1:
        y = approach(y, tgt_y, 10);
        
        if (point_distance(0, y, 0, tgt_y) <= 20)
        {
            state = UnknownEnum.Value_142;
            sprite_index = spr_pizzanobomb_bounce;
            image_index = 0;
            hsp = 0;
            vsp = 10;
        }
        
        break;
    
    case UnknownEnum.Value_142:
        if (face_obj(obj_parent_player) != 0)
            image_xscale = face_obj(obj_parent_player);
        
        if (animation_end() && sprite_index == spr_pizzanobomb_bounce)
        {
            vsp = -7;
            hsp = image_xscale * 5;
            sprite_index = spr_pizzanobomb;
            alarm[0] = 30;
        }
        
        break;
}
