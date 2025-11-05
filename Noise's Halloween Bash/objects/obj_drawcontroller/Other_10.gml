if (global.speedruntimer)
{
    draw_set_font(global.speedruntimerfont);
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    var _milliseconds = string_padzeros(floor(((global.timer / 60) % 60 % 1) * 100));
    var _seconds = string_padzeros(floor((global.timer / 60) % 60));
    var _minutes = string_padzeros((global.timer div 60 div 60) % 60);
    var _hours = string_padzeros(global.timer div 60 div 60 div 60);
    var _string = string("{0}:{1}:{2}.{3}", _hours, _minutes, _seconds, _milliseconds);
    __draw_text_hook(get_game_width() - 8, get_game_height() - 8, _string);
}
