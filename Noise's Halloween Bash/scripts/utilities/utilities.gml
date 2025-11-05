#region Effects and HUD
function scr_createparticle(_anim_end = true, _x, _y, _depth, _sprite, _xscale = 1, _yscale = 1, 
	_index = 0, _speed = 0.5, _angle = 0, _grav = 0, _hsp = 0, _vsp = 0, _zsp = 0, _blend = undefined
)
{
    var _id = instance_create_depth(_x, _y, _depth - 7, obj_particle);
    
    with (_id)
    {
        animationend = _anim_end;
        sprite_index = _sprite;
        image_xscale = _xscale;
        image_yscale = _yscale;
        image_index = _index;
        image_speed = _speed;
        image_angle = _angle;
        grav = _grav;
        hsp = _hsp;
        vsp = _vsp;
        zsp = _zsp;
        
        if (sprite_index == spr_star && is_undefined(_blend))
            image_blend = choose(make_color_rgb(255, 255, 0), make_color_rgb(255, 208, 18), make_color_rgb(255, 208, 133));
        else
            image_blend = _blend ?? c_white;
    }
    
    return _id;
}

function scr_tiptext(_text, _depth = -8000, _shouldpause = true)
{
    instance_destroy(obj_tiptext);
    
    with (instance_create_depth(x, y, _depth, obj_tiptext))
    {
        shouldpause = _shouldpause;
        depth = _depth;
        text = _text;
    }
}

function scr_hudroom()
{
    return array_find_pos([Init, Logos, Titlescreen, RankRoom, Credits, Jeg], room) == -1;
}

function crateeffect(_blend)
{
    repeat (5)
    {
        scr_createparticle(true, x + (sprite_width / 2), y + (sprite_height / 2), z + 4, spr_cratepoofeffect, 1, 1, 0, 0.5);
        var _wall = wall_behind(x + (sprite_width / 2), y + (sprite_height / 2), z);
        
        with (scr_createparticle(false, irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom), z + 16, spr_cratedebris, image_xscale / 2, image_yscale / 2, irandom(4), 0, irandom(360), 0.5, irandom_range(-4, 4), irandom_range(-6, -2), irandom_range(-2, 2 * !_wall)))
            image_blend = _blend;
    }
}

function cratebounceeffect(_effect_obj)
{
    with (_effect_obj)
        scr_createparticle(true, x, bbox_bottom, z + 4, spr_cratebounceeffect, 1, 1, 0, 0.5);
}
#endregion
#region Models
function draw_model(_model, _x, _y, _z, _xscale, _yscale, _zscale, _xrot, _yrot, _zrot)
{
    matrix_set(2, matrix_build(_x, _y, _z, _xrot, _yrot, _zrot, _xscale, _yscale, _zscale));
    
    if (is_array(_model))
    {
        for (var i = 0; i < array_length(_model); i++)
            model_submit(_model[i]);
    }
    else if (is_string(_model))
        model_submit(_model);
    
    matrix_set(2, matrix_build_identity());
}

function model_submit(_material)
{
    var _altmaterial = variable_struct_get(global.altMaterials, _material);
    
    if (!is_undefined(_altmaterial))
    {
        var _model = global.loadedModels[? _altmaterial.model];
        _model.SetMaterialForMeshes(_altmaterial.library, _altmaterial.material);
        _model.Submit();
    }
    else
        global.loadedModels[? _material].Submit();
}

function import_material(_lib, _model_file)
{
    var _buffer = buffer_load(_model_file);
    var _result = DotobjMaterialLoad(_lib, _buffer, filename_dir(_model_file));
    var _name = "";
    var _file = file_text_open_read(_model_file);
    
    while (!file_text_eof(_file))
    {
        var _line = file_text_readln(_file);
        
        if (string_starts_with(_line, "newmtl "))
        {
            _name = string_copy(_line, 8, string_length(_line) - 8);
            break;
        }
    }
    
    file_text_close(_file);
    _name = string_replace(_name, "\r\n", "");
    _name = string_replace(_name, "\n", "");
    _name = string_replace(_name, "\r", "");
    _name = string_replace(_name, " ", "");
    buffer_delete(_buffer);
    return _name;
}
#endregion
#region Camera/Screen
function offset_camera(_x1, _y1, _x2, _y2)
{
    with (obj_drawcontroller)
    {
        camXINTERP = _x1 - _x2;
        camYINTERP = _y1 - _y2;
    }
}

function world_to_screen(_x, _y, _z, _viewMat, _projMat, _check = false)
{
    var cx, cy;
    
    if (_projMat[15] == 0)
    {
        var w = (_viewMat[2] * _x) + (_viewMat[6] * _y) + (_viewMat[10] * _z) + _viewMat[14];
        
        if (w <= 0 && _check)
            return undefined;
        
        if (w == 0)
            return [-1, -1];
        
        cx = _projMat[8] + ((_projMat[0] * ((_viewMat[0] * _x) + (_viewMat[4] * _y) + (_viewMat[8] * _z) + _viewMat[12])) / w);
        cy = _projMat[9] + ((_projMat[5] * ((_viewMat[1] * _x) + (_viewMat[5] * _y) + (_viewMat[9] * _z) + _viewMat[13])) / w);
    }
    else
    {
        cx = _projMat[12] + (_projMat[0] * ((_viewMat[0] * _x) + (_viewMat[4] * _y) + (_viewMat[8] * _z) + _viewMat[12]));
        cy = _projMat[13] + (_projMat[5] * ((_viewMat[1] * _x) + (_viewMat[5] * _y) + (_viewMat[9] * _z) + _viewMat[13]));
    }
    
    return [(0.5 + (0.5 * cx)) * get_game_width(), (0.5 + (0.5 * cy)) * get_game_height()];
}

function screen_to_world(_x, _y, _viewMat, _projMat)
{
    var mx = (2 * ((_x / get_game_width()) - 0.5)) / _projMat[0];
    var my = (2 * ((_y / get_game_height()) - 0.5)) / _projMat[5];
    var camX = -((_viewMat[12] * _viewMat[0]) + (_viewMat[13] * _viewMat[1]) + (_viewMat[14] * _viewMat[2]));
    var camY = -((_viewMat[12] * _viewMat[4]) + (_viewMat[13] * _viewMat[5]) + (_viewMat[14] * _viewMat[6]));
    var camZ = -((_viewMat[12] * _viewMat[8]) + (_viewMat[13] * _viewMat[9]) + (_viewMat[14] * _viewMat[10]));
    
    if (_projMat[15] == 0)
        return [_viewMat[2] + (mx * _viewMat[0]) + (my * _viewMat[1]), _viewMat[6] + (mx * _viewMat[4]) + (my * _viewMat[5]), _viewMat[10] + (mx * _viewMat[8]) + (my * _viewMat[9]), camX, camY, camZ];
    else
        return [_viewMat[2], _viewMat[6], _viewMat[10], camX + (mx * _viewMat[0]) + (my * _viewMat[1]), camY + (mx * _viewMat[4]) + (my * _viewMat[5]), camZ + (mx * _viewMat[8]) + (my * _viewMat[9])];
}

function draw_3d_cone(_x1, _y1, _z1, _x2, _y2, _z2, _sprite, _modify)
{
    static vertex = function(_vbuff, _x1, _y1, _z1, _x2, _y2, _z2, _u, _v, _col, _alpha)
    {
        vertex_position_3d(_vbuff, _x1, _y1, _z1);
        vertex_texcoord(_vbuff, _u, _v);
        vertex_float1(_vbuff, false);
    };
    
    static prevspr = undefined;
    static vb = undefined;
    static vb_bottom = undefined;
    static r = 0.5;
    static nr = -r;
    static steps = 32;
    
    if (_sprite != prevspr)
    {
        if (!is_undefined(vb))
            vertex_delete_buffer(vb);
        
        if (!is_undefined(vb_bottom))
            vertex_delete_buffer(vb_bottom);
        
        vb = undefined;
        vb_bottom = undefined;
    }
    
    var tex = sprite_get_texture(_sprite, 0);
    
    if (vb == undefined)
    {
        var uvs = sprite_get_uvs(_sprite, 0);
        var format = global.vFormat;
        vb = vertex_create_buffer();
        vertex_begin(vb, format);
        var cc = array_create(steps + 1);
        var ss = array_create(steps + 1);
        var hsteps = 1 / steps;
        
        for (var i = 0; i <= steps; i++)
        {
            var rad = (i * 2 * pi) / steps;
            cc[i] = cos(rad);
            ss[i] = sin(rad);
        }
        
        var rows = floor((steps + 1) / 2);
        var vrows = 1 / rows;
        
        for (var i = 0; i <= steps; i++)
        {
            var cci = cc[i];
            var ssi = ss[i];
            vertex(vb, 0, r, 0, 0, 1, 0, lerp(uvs[0], uvs[2], hsteps * i), uvs[3], c_white, 1);
            vertex(vb, cci * r, nr, ssi * r, cci, 0, ssi, lerp(uvs[0], uvs[2], hsteps * i), uvs[1], c_white, 1);
        }
        
        vertex_end(vb);
        vertex_freeze(vb);
        vb_bottom = vertex_create_buffer();
        vertex_begin(vb_bottom, format);
        
        for (var i = steps; i > 0; i--)
        {
            var cci = cc[i] / 2;
            var ssi = ss[i] / 2;
            var cci2 = cc[i - 1] / 2;
            var ssi2 = ss[i - 1] / 2;
            vertex(vb_bottom, 0, 0, 0, 0, 1, 0, lerp(uvs[0], uvs[2], 0.5), lerp(uvs[1], uvs[3], 0.5), c_white, 1);
            vertex(vb_bottom, cci, 0, ssi, 0, -1, 0, lerp(uvs[0], uvs[2], 0.5 + cci), lerp(uvs[1], uvs[3], 0.5 + ssi), c_white, 1);
            vertex(vb_bottom, cci2, 0, ssi2, 0, -1, 0, lerp(uvs[0], uvs[2], 0.5 + cci2), lerp(uvs[1], uvs[3], 0.5 + ssi2), c_white, 1);
        }
        
        vertex_end(vb_bottom);
        vertex_freeze(vb_bottom);
    }
    
    var sx = _x2 - _x1;
    var sy = _y2 - _y1;
    var sz = _z2 - _z1;
    var cx = mean(_x1, _x2);
    var cy = mean(_y1, _y2);
    var cz = mean(_z1, _z2);
    var transform = matrix_build(cx, cy, cz, 0, 0, 0, sx, sy, sz);
    var current = matrix_get(2);
    matrix_set(2, matrix_multiply(transform, current));
    vertex_submit(vb, pr_trianglestrip, tex);
    
    if (_modify)
    {
        transform = matrix_build(cx, _y1, cz, 0, 0, 0, sx, 1, sz);
        matrix_set(2, matrix_multiply(transform, current));
        vertex_submit(vb_bottom, pr_trianglelist, tex);
    }
    
    matrix_set(2, current);
}

function is_outofview3d(_x, _y, _z, _size = 0)
{
    var _sp = world_to_screen(_x, _y, _z, obj_drawcontroller.viewMat, obj_drawcontroller.projMat);
    return !point_in_rectangle(_sp[0], _sp[1], -_size, -_size, get_game_width() + _size, get_game_height() + _size);
}
#endregion

function set_player_checkpoint(_id = id, _save_score = false)
{
    with (obj_player)
    {
        currcheckpoint.id = _id;
        currcheckpoint.object_index = _id.object_index;
        currcheckpoint.room = room;
        currcheckpoint.x = _id.x;
        currcheckpoint.y = _id.y;
        currcheckpoint.collect = global.collect;
        currcheckpoint.destroyedcount = global.destroyedcount;
        currcheckpoint.switchstate = global.switchstate;
        ds_map_copy(currcheckpoint.respawnroom, global.respawnroom);
        
        if (_save_score)
        {
            currcheckpoint.pumpkins = global.pumpkintotal;
            currcheckpoint.gems = global.gems;
            
            if (currcheckpoint.saveroom == noone)
                currcheckpoint.saveroom = ds_map_create();
            
            ds_map_copy(currcheckpoint.saveroom, global.saveroom);
        }
        else
        {
            currcheckpoint.pumpkins = noone;
            currcheckpoint.gems = noone;
            
            if (currcheckpoint.saveroom != noone)
                ds_map_destroy(currcheckpoint.saveroom);
            
            currcheckpoint.saveroom = noone;
        }
    }
}

#region Gems
function get_gem(_gem)
{
    global.gems = bit_set(global.gems, _gem);
}

function has_gem(_gem)
{
    return bit_get(global.gems, _gem);
}
#endregion
#region Lighting
function lighting_set(_x, _y, _z, _light_lv = 1, _col = c_white, _alpha = 0, _shade = 1, _bscale = false, _using_pal = false)
{
    var _shd = shd_basiclighting;
    var u_light = shader_get_uniform(_shd, "u_Light");
    var u_flashcol = shader_get_uniform(_shd, "u_FlashCol");
    var u_shadingmul = shader_get_uniform(_shd, "u_ShadingMul");
    var u_lightlevel = shader_get_uniform(_shd, "u_LightLevel");
    var u_time = shader_get_uniform(_shd, "u_Time");
    var u_boilscale = shader_get_uniform(_shd, "u_BoilScale");
    var u_paletted = shader_get_uniform(_shd, "u_Paletted");
	
    shader_set(_shd);
    shader_set_uniform_f(u_light, _x, _y, _z);
    shader_set_uniform_f(u_flashcol, colour_get_red(_col) / 255, colour_get_green(_col) / 255, colour_get_blue(_col) / 255, _alpha);
    shader_set_uniform_f(u_shadingmul, _shade);
    shader_set_uniform_f(u_lightlevel, _light_lv);
    shader_set_uniform_f(u_time, floor((current_time * 60) / 350));
    shader_set_uniform_f(u_boilscale, _bscale);
	
    var u_outlining = shader_get_uniform(_shd, "u_Outlining");
    shader_set_uniform_i(u_outlining, global.outlineDrawing);
    shader_set_uniform_i(u_paletted, _using_pal);
    
    if (_using_pal)
    {
        var u_pixelsize = shader_get_uniform(_shd, "u_pixelSize");
        var u_uvs = shader_get_uniform(_shd, "u_Uvs");
        var u_paletteid = shader_get_uniform(_shd, "u_paletteId");
        var u_paltexture = shader_get_sampler_index(_shd, "u_palTexture");
		
        var _tex = sprite_get_texture(palettespr, 0);
        var _UVs = sprite_get_uvs(palettespr, 0);
        texture_set_stage(u_paltexture, _tex);
		
        var _texel_x = texture_get_texel_width(_tex);
        var _texel_y = texture_get_texel_height(_tex);
        var _texel_hx = _texel_x * 0.5;
        var _texel_hy = _texel_y * 0.5;
		
        shader_set_uniform_f(u_pixelsize, _texel_x, _texel_y);
        shader_set_uniform_f(u_uvs, _UVs[0] + _texel_hx, _UVs[1] + _texel_hy, _UVs[2], _UVs[3]);
        shader_set_uniform_f(u_paletteid, curpalette);
    }
}

function lighting_end()
{
    shader_reset();
}
#endregion
#region Combo
function combo()
{
    global.combo = approach(global.combo, 10, 1);
}

function combosparkles()
{
    if (sparkletimer <= 0)
    {
        scr_createparticle(true, x + random_range(-10, 10), y + random_range(-10, 10), z - 1, choose(spr_collectsparkleeffect1, spr_collectsparkleeffect2), image_xscale, image_yscale, 0, 0.5, 0, 0, 0, 0, 0, c_yellow);
        sparkletimer = 5;
    }
}
#endregion
#region Draw Sprite
function draw_texture_radial(_tex, _rot, _x1, _y1, _x2, _y2, _col, _alpha)
{
    if (_rot <= 0)
        exit;
    
    if (_rot >= 1)
    {
        draw_primitive_begin_texture(pr_trianglelist, _tex);
        draw_vertex_texture_color(_x1, _y1, 0, 0, _col, _alpha);
        
        repeat (2)
        {
            draw_vertex_texture_color(_x2, _y1, 1, 0, _col, _alpha);
            draw_vertex_texture_color(_x1, _y2, 0, 1, _col, _alpha);
        }
        
        draw_vertex_texture_color(_x2, _y2, 1, 1, _col, _alpha);
        draw_primitive_end();
        exit;
    }
    
    var _mx = (_x1 + _x2) / 2;
    var _my = (_y1 + _y2) / 2;
    draw_primitive_begin_texture(pr_trianglelist, _tex);
    draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _col, _alpha);
    draw_vertex_texture_color(_mx, _y1, 0.5, 0, _col, _alpha);
    
    if (_rot >= 0.125)
    {
        draw_vertex_texture_color(_x2, _y1, 1, 0, _col, _alpha);
        draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _col, _alpha);
        draw_vertex_texture_color(_x2, _y1, 1, 0, _col, _alpha);
    }
    
    if (_rot >= 0.375)
    {
        draw_vertex_texture_color(_x2, _y2, 1, 1, _col, _alpha);
        draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _col, _alpha);
        draw_vertex_texture_color(_x2, _y2, 1, 1, _col, _alpha);
    }
    
    if (_rot >= 0.625)
    {
        draw_vertex_texture_color(_x1, _y2, 0, 1, _col, _alpha);
        draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _col, _alpha);
        draw_vertex_texture_color(_x1, _y2, 0, 1, _col, _alpha);
    }
    
    if (_rot >= 0.875)
    {
        draw_vertex_texture_color(_x1, _y1, 0, 0, _col, _alpha);
        draw_vertex_texture_color(_mx, _my, 0.5, 0.5, _col, _alpha);
        draw_vertex_texture_color(_x1, _y1, 0, 0, _col, _alpha);
    }
    
    var _dir = pi * ((_rot * 2) - 0.5);
    var _dx = cos(_dir);
    var _dy = sin(_dir);
    var _dmax = max(abs(_dx), abs(_dy));
    
    if (_dmax < 1)
    {
        _dx /= _dmax;
        _dy /= _dmax;
    }
    
    _dx = (1 + _dx) / 2;
    _dy = (1 + _dy) / 2;
    draw_vertex_texture_color(lerp(_x1, _x2, _dx), lerp(_y1, _y2, _dy), _dx, _dy, _col, _alpha);
    draw_primitive_end();
}

function draw_sprite_radial(_sprite, _index, _rot, xx1, yy1, xx2, yy2, _col, _alpha, _calc_bbox = true)
{
    var _x1, _y1, _x2, _y2;
    
    if (_calc_bbox)
    {
        var _ox = sprite_get_xoffset(_sprite);
        var _oy = sprite_get_yoffset(_sprite);
        _x1 = xx1 + (xx2 * (sprite_get_bbox_left(_sprite) - _ox));
        _x2 = xx1 + (xx2 * ((sprite_get_bbox_right(_sprite) + 1) - _ox));
        _y1 = yy1 + (yy2 * (sprite_get_bbox_top(_sprite) - _oy));
        _y2 = yy1 + (yy2 * ((sprite_get_bbox_bottom(_sprite) + 1) - _oy));
    }
    else
    {
        _x1 = xx1 - (xx2 * sprite_get_xoffset(_sprite));
        _x2 = _x1 + (xx2 * sprite_get_width(_sprite));
        _y1 = yy1 - (yy2 * sprite_get_yoffset(_sprite));
        _y2 = _y1 + (yy2 * sprite_get_height(_sprite));
    }
    
    draw_texture_radial(sprite_get_texture(_sprite, _index), _rot, _x1, _y1, _x2, _y2, _col, _alpha);
}
#endregion

function wall_behind(xx = x, yy = y, _depth = depth)
{
    var _layers = layer_get_all();
    
    for (var i = 0; i < array_length(_layers); i++)
    {
        var _layer = _layers[i];
        var _mapid = layer_tilemap_get_id(_layer);
        
        if (_mapid < 0)
            continue;
        
        var _data = tilemap_get_at_pixel(_mapid, floor(x) + 1, floor(y) + 1);
        var _tileid = tile_get_index(_data);
        
        if (_tileid > 0 && layer_get_depth(_layer) > _depth)
            return true;
    }
    
    return false;
}

function can_pause()
{
    return array_find_pos([Init, Logos, Titlescreen, RankRoom, Credits, Jeg], room) == -1 && !instance_exists(obj_deathtransition1) && !instance_exists(obj_deathtransition2) && !instance_exists(obj_endplatplayer) && !instance_exists(obj_nitrodetonatorcutscene);
}

function finish_explosion_chains()
{
    while (instance_exists(obj_explosion))
    {
        with (obj_explosion)
        {
            var _thingstodestroy = [par_destructible, par_enemy];
            
            while (instance_place(x, y, _thingstodestroy))
            {
                var _obj = instance_place(x, y, _thingstodestroy);
                
                if (_obj.object_index == obj_destroyablenitro || _obj.object_index == obj_destroyabletnt || _obj.object_index == obj_destroyablepow)
                {
                    with (instance_create_depth(_obj.x + (_obj.sprite_width / 2), _obj.y + (_obj.sprite_height / 2), _obj.z, obj_explosion))
                        pow = _obj.object_index == obj_destroyablepow;
                }
                
                if (_obj.object_index == obj_destroyablenitro)
                {
                    if (_obj.arrowid != noone)
                        add_saveroom(string("{0}_NITRO", real(_obj.arrowid)), global.respawnroom);
                    else
                        add_saveroom(_obj, global.respawnroom);
                }
                else
                    add_saveroom(_obj, global.respawnroom);
                
                if (object_is_ancestor(_obj.object_index, par_destructible))
                    global.destroyedcount++;
                
                trace(string("destroyed object of type {0} in room {1} at {2}, {3}", object_get_name(_obj.object_index), room_get_name(room), _obj.x, _obj.y));
                instance_destroy(_obj, false);
            }
            
            instance_destroy();
        }
    }
}

function deathplat_camupdate()
{
    with (obj_drawcontroller)
    {
        curlock = noone;
        curlockbboxdata = [];
        
        with (obj_player)
        {
            var _meetx = x;
            var _meety = y;
            
            if (state == states.levelintro)
                _meety = levelstarty;
            
            if (state == states.nitrocutscene)
            {
                var _scene = obj_nitrodetonatorcutscene;
                _meetx = _scene.nitrox + (_scene.nitrow / 2);
                _meety = _scene.nitroy + (_scene.nitroh / 2);
            }
            
            if (state == states.platformlocked)
            {
                with (ondeathplatform)
                {
                    _meetx = path_get_x(currpath, 1);
                    _meety = path_get_y(currpath, 1) - 46;
                }
            }
            
            if ((player_collideable() || state == states.levelintro || state == states.platformlocked || obj_player.state == states.outhouse) && (place_meeting(_meetx, _meety, par_camlock) || place_meeting(_meetx, _meety, obj_lockcamextender)))
            {
                var _lockid = noone;
                
                if (place_meeting(_meetx, _meety, par_camlock))
                    _lockid = instance_place(_meetx, _meety, par_camlock);
                else
                    _lockid = instance_place(_meetx, _meety, obj_lockcamextender).lock;
                
                other.curlock = _lockid.object_index;
                other.curlockbboxdata = [_lockid.bbox_left, _lockid.bbox_top, _lockid.bbox_right, _lockid.bbox_bottom];
            }
            else
            {
                other.curlock = noone;
                other.curlockbboxdata = [];
            }
        }
        
        if (curlock != noone)
        {
            var _lock = lock_cam(camX, camY, curlock, curlockbboxdata);
            camX = _lock[0];
            camY = _lock[1];
        }
        
        prevlock = curlock;
        prevlockbboxdata = curlockbboxdata;
        interpplaypos = false;
        camXINTERP = 0;
        camYINTERP = 0;
    }
}

function get_rank(_candy, _pumpkins, _crates, _gems)
{
    var _workingrank = Rank.Perfect;
    var _gemcount = bit_count(_gems);
    
    if (_workingrank == Rank.Perfect)
    {
        if (_candy < 8000 || _pumpkins < 10 || _crates < global.cratecount || _gemcount < 3)
            _workingrank = Rank.Good;
    }
    
    if (_workingrank == Rank.Good)
    {
        if (_candy < 4000 || _pumpkins < 9 || _crates < 250 || _gemcount < 2)
            _workingrank = Rank.Meh;
    }
    
    if (_workingrank == Rank.Meh)
    {
        if (_candy < 2000 || _pumpkins < 7 || _crates < 250 || _gemcount < 1)
            _workingrank = Rank.Shit;
    }
    
    return _workingrank;
}

function in_deathroute()
{
    return room == PatchDeathRoute || room == PatchDeathRoute2;
}

function in_perilousroute()
{
    return room == PatchPerilousRoute;
}

function get_cycleind(_spr, _val)
{
    var _num = sprite_get_number(_spr);
    var _ind = (get_cycle(_num / _val) / (_num / _val)) * _num;
    return _ind;
}

function save_easteregg(_str)
{
    var _update = false;
    save_open();
    
    if (!has_easteregg(_str))
        _update = true;
    
    ini_write_real("ObtuseAndFranklyUnnecessary", _str, 1);
    save_close();
    save_dump();
    
    if (_update)
    {
        with (obj_titlescreen)
        {
            update_stars();
            update_pal();
        }
        
        event_play_oneshot("event:/sfx/misc/secret");
    }
}

function has_easteregg(_str)
{
    return bool(ini_read_real("ObtuseAndFranklyUnnecessary", _str, 0));
}

function string_shift(_str, _val)
{
    var _newstr = "";
    
    for (var _i = 1; _i <= string_length(_str); _i++)
        _newstr += chr(ord(string_char_at(_str, _i)) - _val);
    
    return _newstr;
}
