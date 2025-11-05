shader_set(shd_premultiply);
draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, 1);
var _playbackdata = video_draw();
var _scale = (get_game_width() - 140) / 960;
gpu_set_tex_filter(true);
shader_set(shd_videocolourcorrect);
var _shake = irandom_range(-crackshake, crackshake);
var _x = (get_game_width() / 2) - ((960 * _scale) / 2);
var _y = (get_game_height() / 2) - ((540 * _scale) / 2);
var _sx = ((get_game_width() / 2) - ((960 * _scale) / 2)) + _shake;
var _sy = ((get_game_height() / 2) - ((540 * _scale) / 2)) + _shake;
var _w = 960 * _scale;
var _h = 540 * _scale;

if (!started)
    draw_sprite_stretched_ext(spr_1x1, 0, _x, _y, _w, _h, c_black, 1);
else if (_playbackdata[0] == 0)
{
    if (!surface_exists(lastframe))
        lastframe = surface_create(surface_get_width(_playbackdata[1]), surface_get_height(_playbackdata[1]));
    
    if (surface_get_width(lastframe) != surface_get_width(_playbackdata[1]) || surface_get_height(lastframe) != surface_get_height(_playbackdata[1]))
        surface_resize(lastframe, surface_get_width(_playbackdata[1]), surface_get_height(_playbackdata[1]));
    
    surface_copy(lastframe, 0, 0, _playbackdata[1]);
    draw_surface_stretched(_playbackdata[1], _sx, _sy, _w, _h);
    shader_set(shd_premultiply);
    
    if (video_get_status() == 3)
    {
        draw_sprite_stretched_ext(spr_1x1, 0, _sx, _sy, _w, _h, c_black, 0.25);
        draw_sprite(spr_videostatus, 0, (get_game_width() / 2) + _shake, (get_game_height() / 2) + _shake);
    }
}
else if (surface_exists(lastframe))
{
    draw_surface_stretched(lastframe, _sx, _sy, _w, _h);
    shader_set(shd_premultiply);
    draw_sprite_stretched_ext(spr_1x1, 0, _sx, _sy, _w, _h, c_black, 0.25);
    draw_sprite(spr_videostatus, 1, (get_game_width() / 2) + _shake, (get_game_height() / 2) + _shake);
}

shader_set(shd_premultiply);
gpu_set_tex_filter(false);
draw_sprite_stretched_ext(spr_1x1, 0, _sx, _sy, _w, _h, c_white, changeflash);
draw_sprite(spr_devvideotvantennas, 0, _sx + (_w / 2), _sy);
draw_sprite_stretched(started ? spr_devvideotv : spr_devvideotvoff, -1, _sx - 18, _sy - 19, _w + 37, _h + 38);
draw_set_colour(c_white);
draw_set_font(global.font);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);

if (!started)
{
    draw_set_halign(fa_center);
    draw_text_fancy(get_game_width() / 2, get_game_height() - 6, string_get("menu/devvideos/start"));
}
else
{
    var _dateelm = string_split(videos[selected], "-");
    var _datestr = string("{0}/{1}/{2}", _dateelm[0], _dateelm[1], _dateelm[2]);
    __draw_text_hook(20, get_game_height() - 20, _datestr);
    draw_set_valign(fa_top);
    draw_set_halign(fa_right);
    var _add = "";
    
    if (videos[selected] == "09-07-2024-A")
        _add = (global.resmode == aspectratio.res4_3) ? "fbt" : "";
    
    __draw_text_hook(get_game_width() - 20, 20, string_get(string("menu/devvideos/{0}", videos[selected] + _add)));
    
    if (selected > 0)
        draw_input(20, (get_game_height() / 2) - 16, 1, 0, "left");
    
    if (selected < (array_length(videos) - 1))
        draw_input(get_game_width() - 52, (get_game_height() / 2) - 16, 1, 0, "right");
}
