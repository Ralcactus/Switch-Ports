draw_sprite_ext(anim_sprite, anim_index, x, y, facing, 1, 0, image_blend, image_alpha);

if (eyes_sprite != -4 && array_contains(possible_eyes, anim_sprite))
{
    get_eyes();
    
    if (collision_rectangle(eX1, eY1, eX2, eY2, obj_player, false, false))
    {
        var _angle = point_direction(x, y - 42, obj_player.x, obj_player.bbox_top);
        var _eyes_xTo = dsin(_angle + 90) * eyes_lenX;
        var _eyes_yTo = dcos(_angle + 90) * eyes_lenY;
        eyes_xoff = lerp(eyes_xoff, _eyes_xTo, 0.65);
        eyes_yoff = lerp(eyes_yoff, _eyes_yTo, 0.65);
        
        if (eyes_lenY_min != -999)
            eyes_yoff = clamp(eyes_yoff, eyes_lenY_min, eyes_lenY_max);
        
        if (eyes_lenY_max != -999)
            eyes_xoff = clamp(eyes_xoff, eyes_lenX_min, eyes_lenX_max);
    }
    else
    {
        eyes_xoff = lerp(eyes_xoff, 0, 0.65);
        eyes_yoff = lerp(eyes_yoff, 0, 0.65);
    }
    
    draw_sprite_ext(eyes_sprite, anim_index, x + eyes_xoff, y + eyes_yoff, facing, 1, 0, image_blend, image_alpha);
    
    if (eyelids_sprite != -4)
        draw_sprite_ext(eyelids_sprite, anim_index, x, y, facing, 1, 0, image_blend, image_alpha);
}
