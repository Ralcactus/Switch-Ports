var _heyInd = hey_ind;
var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _camw = camera_get_view_width(view_camera[0]);

with (obj_bom)
{
    var _hey = max(hey_scale, 1);
    var _heyyoff = (_hey * (sprite_get_yoffset(anim_sprite) / 2)) - (sprite_get_yoffset(anim_sprite) / 2);
    
    if (!inPipe)
    {
        if (x < (camx + 32))
        {
            draw_sprite_ext(spr_heyR, _heyInd, camx + 32, (y + carry_yoff + _heyyoff) - 29, _hey * xscale_squish, _hey * yscale_squish, 0, c_white, 1);
            draw_sprite_ext(anim_sprite, anim_index, camx + 32, y + carry_yoff + _heyyoff, _hey * xscale_squish, _hey * yscale_squish, 0, c_white, 1);
        }
        
        if (x > ((camx + camw) - 32))
        {
            draw_sprite_ext(spr_heyL, _heyInd, (camx + camw) - 32, (y + carry_yoff + _heyyoff) - 29, _hey * xscale_squish, _hey * yscale_squish, 0, c_white, 1);
            draw_sprite_ext(anim_sprite, anim_index, (camx + camw) - 32, y + carry_yoff + _heyyoff, _hey * xscale_squish, _hey * yscale_squish, 0, c_white, 1);
        }
    }
}

with (obj_fireball)
{
    var _hey = max(hey_scale, 1);
    var _heyyoff = (_hey * (sprite_get_yoffset(anim_sprite) / 2)) - (sprite_get_yoffset(anim_sprite) / 2);
    
    if (x < (_camx + 32) && hspd > 0)
    {
        draw_sprite_ext(spr_heyR, _heyInd, _camx + 32, y + _heyyoff, _hey, _hey, 0, c_white, 1);
        draw_sprite_ext(anim_sprite, anim_index, _camx + 32, y + _heyyoff, _hey, _hey, 0, c_white, 1);
    }
    
    if (x > ((_camx + _camw) - 32) && hspd < 0)
    {
        draw_sprite_ext(spr_heyL, _heyInd, (_camx + _camw) - 32, y + _heyyoff, _hey, _hey, 0, c_white, 1);
        draw_sprite_ext(anim_sprite, anim_index, (_camx + _camw) - 32, y + _heyyoff, _hey, _hey, 0, c_white, 1);
    }
}
