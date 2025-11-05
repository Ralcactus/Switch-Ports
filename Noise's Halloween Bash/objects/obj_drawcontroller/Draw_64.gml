var _gw = get_game_width();
var _gh = get_game_height();

if (scr_hudroom())
{
    var _cratesize = 24;
    var _surfacesize = (_cratesize * 2) + 32;
    
    if (!surface_exists(hudcratesurf))
        hudcratesurf = surface_create(_surfacesize, _surfacesize);
    
    surface_reset_target();
    surface_set_target(hudcratesurf);
    draw_clear_alpha(c_black, 0);
    gpu_set_ztestenable(true);
    lighting_set(0, 0, -1);
    draw_model("CrateQUESTION", _surfacesize / 2, _surfacesize / 2, 0, -_cratesize, -_cratesize, _cratesize, 15, 180 + hudcratespin, 0);
    lighting_end();
    shader_set(shd_premultiply);
    gpu_set_ztestenable(false);
    surface_reset_target();
    surface_set_target(guisurf);
    draw_set_font(global.toonfont);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    __draw_text_colour_hook(_gw - 125, 25, string_concat("/", global.cratecount), c_white, c_white, c_white, c_white, cratealpha);
    draw_set_halign(fa_right);
    __draw_text_colour_hook(_gw - 125, 25, global.destroyedcount, c_white, c_white, c_white, c_white, cratealpha);
    shader_set(shd_3doutline_hud);
    var _tex = surface_get_texture(hudcratesurf);
    shader_set_uniform_f(outlineHUDTexel, texture_get_texel_width(_tex), texture_get_texel_height(_tex));
    draw_surface_ext(hudcratesurf, _gw - 211 - (string_length(global.destroyedcount) * string_width("O")), 3, 1, 1, 0, c_white, cratealpha);
    shader_set(shd_premultiply);
    surface_reset_target();
    var _gemsize = 30;
    var _gemwidth = (_gemsize * 2) + 32;
    var _surfacewidth = _gemwidth * 3;
    var _surfaceheight = (_gemsize * 2) + 32;
    
    if (!surface_exists(hudgemsurf))
        hudgemsurf = surface_create(_surfacewidth, _surfaceheight);
    
    var _currgems = global.gems;
    
    with (obj_gemcollectparticle)
        _currgems = bit_set(_currgems, gemid, true);
    
    surface_set_target(hudgemsurf);
    draw_clear_alpha(c_black, 0);
    gpu_set_ztestenable(true);
    var _prevcull = gpu_get_cullmode();
    gpu_set_cullmode(2);
    shader_set(shd_gemshading_gui);
    shader_set_uniform_f(u_colour, 0.7, 0.7, 0.75);
    shader_set_uniform_f(u_light, global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z);
    shader_set_uniform_f(u_view, 5024, 7072, 0);
    
    if (bit_get(_currgems, 1))
        draw_model("Gem", (_surfacewidth / 2) - _gemwidth, _surfaceheight / 2, 0, -_gemsize, -_gemsize, _gemsize, 8, 180 + hudcratespin, 0);
    
    if (bit_get(_currgems, 2))
        draw_model("Gem", _surfacewidth / 2, _surfaceheight / 2, 0, -_gemsize, -_gemsize, _gemsize, 8, 180 + hudcratespin, 0);
    
    if (bit_get(_currgems, 3))
    {
        shader_set_uniform_f(u_colour, 1, 0.51, 0.63);
        draw_model("GemCOLOURED", (_surfacewidth / 2) + _gemwidth, _surfaceheight / 2, 0, -_gemsize, -_gemsize, _gemsize, 8, 180 + hudcratespin, 0);
    }
    
    gpu_set_cullmode(_prevcull);
    shader_set(shd_premultiply);
    gpu_set_ztestenable(false);
    surface_reset_target();
    surface_set_target(guisurf);
    shader_set(shd_3doutline_hud);
    _tex = surface_get_texture(hudgemsurf);
    shader_set_uniform_f(outlineHUDTexel, texture_get_texel_width(_tex), texture_get_texel_height(_tex));
    draw_surface_ext(hudgemsurf, (_gw / 2) - (_surfacewidth / 2), (_gh - _surfaceheight) + 6, 1, 1, 0, c_white, gemalpha);
    shader_set(shd_premultiply);
    var _sp = world_to_screen(obj_player.x, obj_player.y, obj_player.z, viewMat, projMat, true);
    
    if (_sp != undefined)
    {
        draw_sprite_ext(spr_hoverbar, 0, _sp[0] + 50, _sp[1] - 32, 1, 1, 0, c_white, hovertimerfade);
        draw_sprite_radial(spr_hoverbar, 1, obj_player.hovertime / obj_player.hovermaxtime, _sp[0] + 50, _sp[1] - 32, 1, 1, c_white, hovertimerfade, false);
        draw_sprite_ext(spr_hoverbar, 2, _sp[0] + 50, _sp[1] - 32, 1, 1, 0, c_white, hovertimerflash * hovertimerfade);
    }
    
    var _touching = false;
    
    with (obj_player)
        _touching = place_meeting(x, y, [obj_outhouse, obj_mirror]);
    
    if (obj_player.state == states.normal && _touching)
    {
        var _promptx = _sp[0];
        var _prompty = _sp[1] - 65;
        var _boxpad = 50;
        draw_set_colour(c_black);
        draw_set_alpha(0.6);
        draw_roundrect(_promptx - (_boxpad / 2), _prompty - (_boxpad / 2), _promptx + (_boxpad / 2), _prompty + (_boxpad / 2), false);
        draw_set_colour(c_white);
        draw_set_alpha(1);
        
        if (get_cycle(60) > 30)
            _prompty += -1;
        else
            _prompty += 1;
        
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);
        draw_input(_promptx - 16, _prompty - 16, 1, 0, "up");
    }
    
    surface_reset_target();
    _surfacewidth = sprite_get_width(spr_scoregraphic) + 20;
    _surfaceheight = sprite_get_height(spr_scoregraphic) + 20;
    
    if (!surface_exists(scoresurf))
        scoresurf = surface_create(_surfacewidth, _surfaceheight);
    
    surface_set_target(scoresurf);
    draw_clear_alpha(c_black, 0);
    draw_sprite_ext(spr_scoregraphic, 0, 10, 10, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_scoregraphic, 1, 10, 10, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_scoregraphic, 2, 10, 10, 1, 1, 0, c_white, global.combo / 10);
    var _s = 0;
    var _n = array_length(scoresparkles);
    
    while (_s < _n)
    {
        var _sparkle = scoresparkles[_s];
        draw_sprite_ext(_sparkle.sprite, _sparkle.index, _sparkle.x, _sparkle.y, 1, 1, 0, c_yellow, collectalpha);
        _s++;
    }
    
    surface_reset_target();
    surface_set_target(guisurf);
    draw_surface_ext(scoresurf, -4, -5, 1, 1, 0, c_white, collectalpha);
    var _sc = global.collect;
    
    with (obj_collectparticle)
        _sc -= value;
    
    _sc = round(max(_sc, 0));
    var _scstr = string(_sc);
    var _digitx = 86;
    
    for (var i = 0; i < string_length(_scstr); i++)
    {
        var digit = real(string_char_at(_scstr, i + 1));
        
        if (_sc != prevcollect)
        {
            if (array_get_undefined(scorepal, i) == undefined)
                scorepal[i] = irandom_range(0, 3);
            
            if (array_get_undefined(scoreshake, i) == undefined)
                scoreshake[i] = 0;
            
            if (prevcollect != -1 && string_char_at(_scstr, i + 1) != string_char_at(string(prevcollect), i + 1))
            {
                scorepal[i] = irandom_range(0, 3);
                scorey[i] = 0;
                scoreshake[i] = 8;
            }
        }
        
        if (!game_paused())
            scoreshake[i] = max(scoreshake[i] - 0.5, 0);
        
        if (global.colouredscore)
            pal_swap_set(spr_scorepal, scorepal[i], false);
        
        var _shakex = irandom_range(scoreshake[i], -scoreshake[i]);
        var _shakey = irandom_range(scoreshake[i], -scoreshake[i]);
        
        if (game_paused())
        {
            _shakex = 0;
            _shakey = 0;
        }
        
        draw_sprite_ext(spr_scorefont, digit, _digitx + _shakex, wave(14, 17, 2, 0, global.game_cycleMS + (i * 1000)) + _shakey, 1, 1, 0, c_white, collectalpha);
        shader_set(shd_premultiply);
        _digitx += 33;
    }
    
    prevcollect = _sc;
    
    for (var i = 0; i < global.pumpkintotal; i++)
    {
        var _y = (_gh - 10) + wave(0, -8, 2, 0, global.game_cycleMS + (i * 1000));
        var _ind = i;
        
        if (i >= 5)
        {
            _ind = i - 5;
            _y -= 32;
        }
        
        var _x = 10 + ((sprite_get_width(spr_pumpkinicon) - 24) * _ind);
        draw_sprite_ext(spr_pumpkinicon, 0, _x, _y, 1, 1, 0, c_white, pumpkinalpha);
    }
    
    event_user(0);
}

if (outlineDebug)
{
    with (obj_jegplayer)
    {
        matrix_set(2, matrix_build(-x + (_gw / 2), -y + (_gh / 2), 0, 0, 0, 0, 1, 1, 1));
        
        with (obj_jegtile)
        {
            if (height > -64)
                draw_self();
        }
        
        with (obj_jegwall)
            draw_self();
        
        with (obj_jegdoor)
            draw_self();
        
        with (obj_jegtrigger)
            draw_self();
        
        with (obj_jeg)
            draw_self();
        
        draw_self();
        draw_sprite_ext(spr_1x1, 0, x, y, cursorrange, 1, yaw, c_red, 1);
        matrix_set(2, matrix_build_identity());
    }
}
