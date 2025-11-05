if (state == states.nitrocutscene || state == states.actor || state == states.debug)
    exit;

var _lightcol = make_colour_hsv(colour_get_hue(image_blend), colour_get_saturation(image_blend), colour_get_value(image_blend) * lightlevel);
var _fallsprcheck = sprite_index == spr_player_jumppeak || sprite_index == spr_player_jumpend || sprite_index == spr_player_fall || sprite_index == spr_player_crouchfall || sprite_index == spr_player_crouchjumpend || sprite_index == spr_player_fallturn || sprite_index == spr_player_crouchfallturn || sprite_index == spr_player_wallslidecancelup || sprite_index == spr_player_wallslidecanceldown || sprite_index == spr_player_cratebounce || sprite_index == spr_player_crouchfallbunny || sprite_index == spr_player_crouchfallbunnyturn || sprite_index == spr_player_wallrunend;

if (state != states.rope)
{
    if (state == states.endplatform && instance_exists(obj_endplatplayer))
    {
        var _faux = instance_find(obj_endplatplayer, 0);
        draw_sprite_billboard_ext(_faux.sprite_index, _faux.image_index, _faux.x, _faux.y, z, _faux.image_xscale, 1, 0, _lightcol, image_alpha, true);
    }
    else
    {
        var _tiltangle = 0;
        
        if (state == states.cartwheel)
            _tiltangle = clamp((movespeed - 14) * 10, 0, 15) * -image_xscale;
        
        var _yoff = 0;
        var _xoff = 0;
        _yoff = 40 * abs(angle_difference(0, angle + _tiltangle) / 180);
        _xoff = (64 * angle_difference(0, angle + _tiltangle)) / 180;
        
        if (state == states.hitstun)
        {
            _yoff += irandom_range(-3, 3);
            _xoff += irandom_range(-3, 3);
        }
        
        var _spr = sprite_index;
        var _ind = image_index;
        var _xscale = image_xscale;
        
        if (sprite_index == spr_player_idle && showturnsprite)
        {
            _spr = spr_player_turnaround;
            _ind = (wrap(platformspin, 0, 360) / 360) * 16;
            _xscale = 1;
        }
        
        if (instance_exists(obj_playercape) && _fallsprcheck)
            draw_sprite_billboard_ext(obj_playercape.sprite_index, obj_playercape.image_index, x + _xoff, y + _yoff, z, _xscale, image_yscale, angle + _tiltangle, _lightcol, image_alpha, true);
        
        draw_sprite_billboard_ext(_spr, _ind, x + _xoff, y + _yoff, z, _xscale, image_yscale, angle + _tiltangle, _lightcol, image_alpha, true);
    }
}
else
{
    var _xoff = lengthdir_x(ropeID.sprite_height, ropeID.image_angle - 90);
    var _yoff = lengthdir_y(ropeID.sprite_height, ropeID.image_angle - 90);
    _yoff += (40 * abs(angle_difference(0, ropeID.image_angle) / 180));
    _xoff += ((50 * angle_difference(0, ropeID.image_angle)) / 180);
    var _x = lerp(ropexstartpos, ropeID.x + _xoff, ropel);
    var _y = lerp(ropeystartpos, ropeID.y + _yoff, ropel);
    var _spr = sprite_index;
    
    if (ropel < 1)
        _spr = spr_player_fall;
    
    if (instance_exists(obj_playercape) && (_fallsprcheck || ropel < 1))
        draw_sprite_billboard_ext(obj_playercape.sprite_index, obj_playercape.image_index, _x, _y, z, image_xscale, image_yscale, 0, _lightcol, image_alpha, true);
    
    draw_sprite_billboard_ext(_spr, image_index, _x, _y, z, image_xscale, image_yscale, 0, _lightcol, image_alpha, true);
}
