if ((openanim + closeanim) > 0)
{
    var _width = mapcorners[1].x - mapcorners[0].x;
    var _height = mapcorners[1].y - mapcorners[0].y;
    var _gw = get_game_width();
    var _gh = get_game_height();
    var _scale = min(_gw / _width, _gh / _height) * 0.9;
    _scale = tween(_scale, 1, zoom, EASE_IN_SINE);
    var _xoff = (((_width + panx) / 2) + mapcorners[0].x) * _scale;
    var _yoff = (((_height + pany) / 2) + mapcorners[0].y) * _scale;
    var _roomind = array_find_pos(global.levelrooms, playerroom);
    
    if (_roomind >= (array_length(global.levelrooms) - 4))
        _roomind = -1;
    
    var _checkroomind = array_find_pos(global.levelrooms, obj_player.currcheckpoint.room);
    surface_depth_disable(true);
    
    if (!surface_exists(main_surf))
        main_surf = surface_create(_gw, _gh);
    else if (surface_get_width(main_surf) != _gw || surface_get_height(main_surf) != _gh)
        surface_resize(main_surf, _gw, _gh);
    
    surface_depth_disable(false);
    
    if (_roomind != -1)
    {
        for (var _s = 0; _s < array_length(map_surf); _s++)
        {
            if (!surface_exists(map_surf[_s]))
                map_surf[_s] = surface_create(_gw + 8, _gh + 8, surface_fallback(surface_rgba8unorm));
            else if (surface_get_width(map_surf[_s]) != (_gw + 8) || surface_get_height(map_surf[_s]) != (_gh + 8))
                surface_resize(map_surf[_s], _gw + 8, _gh + 8);
            
            surface_set_target(map_surf[_s]);
            draw_clear_alpha(c_black, 0);
            surface_reset_target();
        }
        
        for (var i = 0; i < array_length(roomoffset); i++)
        {
            var _i = roomorder[i];
            
            if (vBuffMap[_i] != -1)
            {
                var _roomstatus = 0;
                
                if (visitedrooms[_i] == true)
                {
                    var _room = global.levelrooms[_i];
                    
                    if (_room == room)
                    {
                        if (instance_exists(obj_pumpkin))
                            _roomstatus = 0;
                        else if (instance_exists(par_crate))
                            _roomstatus = 1 + (instance_number(par_crate) == instance_number(obj_destroyablenitro));
                        else
                            _roomstatus = 3;
                    }
                    else if (roominfo_pumpkins[_i] > 0)
                        _roomstatus = 0;
                    else if (roominfo_crates[_i] > 0)
                        _roomstatus = 1;
                    else if (roominfo_nitros[_i] > 0)
                        _roomstatus = 2;
                    else
                        _roomstatus = 3;
                }
                else
                    _roomstatus = 4;
                
                shader_set(shd_maprender);
                var _g = 0;
                
                if (zoom > 0.1)
                    _g += 0.2;
                
                if (roomgreyout[_i])
                    _g += 0.4;
                
                shader_set_uniform_f(maprender_colour, (_roomstatus + 1) / 5, _g, 1);
                var _map_off = [[0, 0], [-0.25, -0.25], [0.25, -0.25], [-0.25, 0.25], [0.25, 0.25]];
                
                for (var _s = 0; _s < array_length(map_surf); _s++)
                {
                    var _sw = surface_get_width(map_surf[_s]);
                    var _sh = surface_get_height(map_surf[_s]);
                    surface_set_target(map_surf[_s]);
                    matrix_set(2, matrix_build(((_sw / 2) - _xoff) + _map_off[_s][0], ((_sh / 2) - _yoff) + _map_off[_s][1], 0, 0, 0, 0, _scale, _scale, 1));
                    vertex_submit(vBuffMap[_i], pr_trianglelist, -1);
                    surface_reset_target();
                }
                
                matrix_set(2, matrix_build_identity());
                shader_set(shd_premultiply);
            }
        }
    }
    
    surface_set_target(main_surf);
    draw_clear_alpha(c_black, 0.8);
    draw_set_font(global.font);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    
    if (_roomind != -1)
    {
        shader_set(shd_mapstyle);
        gpu_set_tex_filter(true);
        var _s_pat = shader_get_sampler_index(shd_mapstyle, "s_Patterns");
        var _pattex = sprite_get_texture(spr_maprepeats, 0);
        texture_set_stage(_s_pat, _pattex);
        
        for (var s = 1; s < array_length(map_surf); s++)
        {
            var _s_surf = shader_get_sampler_index(shd_mapstyle, string("s_Surface{0}", s - 1));
            var _surftex = surface_get_texture(map_surf[s]);
            texture_set_stage(_s_surf, _surftex);
        }
        
        var _tex = surface_get_texture(map_surf[0]);
        var _tex2 = sprite_get_texture(spr_maprepeats, 0);
        shader_set_uniform_f(mapstyle_texel, texture_get_texel_width(_tex2), texture_get_texel_height(_tex2), texture_get_texel_width(_tex), texture_get_texel_height(_tex));
        shader_set_uniform_f(mapstyle_offset, floor(sprite_get_width(spr_maprepeats) - patternscroll), floor(sprite_get_width(spr_maprepeats) - patternscroll));
        var _maxrepeats = sprite_get_number(spr_maprepeats);
        var _uvarr = array_create(_maxrepeats * 4);
        
        for (var i = 0; i < _maxrepeats; i++)
        {
            var _uvs = sprite_get_uvs(spr_maprepeats, i);
            _uvarr[i * 4] = _uvs[0];
            _uvarr[(i * 4) + 1] = _uvs[1];
            _uvarr[(i * 4) + 2] = _uvs[2];
            _uvarr[(i * 4) + 3] = _uvs[3];
        }
        
        shader_set_uniform_f_array(mapstyle_uvs, _uvarr);
        shader_set_uniform_f_array(mapstyle_outlinecol, [0.88, 0.19, 0, 0.31, 0, 0, 0.03, 0.41, 0, 0.06, 0.46, 0.82, 0.16, 0.19, 0.25]);
        draw_surface(map_surf[0], -4, -4);
        gpu_set_tex_filter(false);
        shader_set(shd_premultiply);
        var _sw = surface_get_width(map_surf[0]);
        var _sh = surface_get_height(map_surf[0]);
        
        for (var i = 0; i < array_length(roomoffset); i++)
        {
            var _cornerx = roomcorners[i][0].x;
            var _cornery = roomcorners[i][0].y;
            _width = roomcorners[i][1].x - roomcorners[i][0].x;
            _height = roomcorners[i][1].y - roomcorners[i][0].y;
            var _nameoffx = (_cornerx + (_width / 2)) * _scale;
            var _nameoffy = (_cornery + (_height / 2)) * _scale;
            
            if (!roomgreyout[i])
                __draw_text_hook(((_sw / 2) - _xoff) + _nameoffx, ((_sh / 2) - _yoff) + _nameoffy, (visitedrooms[i] == true) ? array_get(string_get("roomnames"), i) : "???");
        }
        
        repeat (array_length(outhouse_queue))
        {
            var _outhouse = array_shift(outhouse_queue);
            draw_sprite(spr_outhousemarker, 0, _outhouse.x, _outhouse.y);
            
            if (obj_player.currcheckpoint.id != noone && obj_player.currcheckpoint.object_index == obj_outhouse && real(obj_player.currcheckpoint.id) == _outhouse.id)
                draw_sprite(spr_outhousemarker_flag, 0, _outhouse.x, _outhouse.y);
        }
        
        if (!outhoused)
        {
            if (obj_player.currcheckpoint.id != noone && _checkroomind < (array_length(global.levelrooms) - 1 - 4) && obj_player.currcheckpoint.object_index == obj_destroyablecheckpoint && !roomgreyout[_checkroomind])
                draw_sprite(spr_checkmarker, 0, ((_sw / 2) - _xoff) + ((checkposx + 32 + (roomoffset[_checkroomind].x * 32)) * _scale), ((_sh / 2) - _yoff) + ((checkposy + 32 + (roomoffset[_checkroomind].y * 32)) * _scale));
            
            pal_swap_set(obj_player.palettespr, obj_player.curpalette, false);
            draw_sprite_ext(spr_playermarker, 0, ((_sw / 2) - _xoff) + ((playerposx + (roomoffset[_roomind].x * 32)) * _scale), ((_sh / 2) - _yoff) + ((playerposy + (roomoffset[_roomind].y * 32)) * _scale), 1, 1, 0, roomgreyout[_roomind] ? c_gray : c_white, 1);
        }
        
        shader_set(shd_premultiply);
    }
    else
        __draw_text_hook(_gw / 2, _gh / 2, string_get("menu/map/nomap"));
    
    surface_reset_target();
    shader_set(shd_maptransition);
    shader_set_uniform_f(maptrans_size, _gw, _gh);
    shader_set_uniform_f(maptrans_anim, openanim + closeanim);
    draw_surface(main_surf, 0, 0);
    shader_set(shd_premultiply);
    
    if (outhoused)
    {
        if (outhouse != -1 && invcharge > 0)
        {
            draw_sprite_ext(spr_outhousecursor_select, 0, _gw / 2, _gh / 2, 1, 1, 0, c_white, openanim - closeanim);
            draw_sprite_radial(spr_outhousecursor_select, 1, invcharge / 30, _gw / 2, _gh / 2, 1, 1, c_white, openanim - closeanim);
        }
        else
            draw_sprite_ext(spr_outhousecursor, outhouse != -1, _gw / 2, _gh / 2, 1, 1, 0, c_white, openanim - closeanim);
    }
    
    var _tiptext = "";
    
    if (zoom < 1)
    {
        _tiptext += string_get("menu/map/zoomin");
        _tiptext += "\n";
    }
    
    if (zoom > 0.01)
    {
        _tiptext += string_get("menu/map/zoomout");
        _tiptext += "\n";
    }
    
    if (outhoused && outhouse != -1)
    {
        _tiptext += string_get("menu/map/outhouse");
        _tiptext += "\n";
    }
    else if (canswap)
    {
        _tiptext += string_get("menu/map/layerswap");
        _tiptext += "\n";
    }
    
    _tiptext += string_get("menu/map/movetip");
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_right);
    draw_text_fancy(_gw - 20, _gh - 20, _tiptext, c_white, openanim - closeanim, true);
    var _ind = 2;
    
    if (canswap && _roomind != -1)
        _ind = roomgreyout[_roomind] ? layera : !layera;
    
    draw_sprite_ext(spr_mapcurrentlayer, _ind, 0, get_game_height(), 1, 1, 0, c_white, openanim - closeanim);
}
