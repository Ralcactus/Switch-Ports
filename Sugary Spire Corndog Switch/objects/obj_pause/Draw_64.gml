if (global.gamePauseState == 1 && !instance_exists(obj_pauseFadeoutTransition))
{
    draw_sprite_tiled(bg_pausescreenTile, 0, bgTileX, bgTileY);
    draw_rectangle_color(-5000, 0, 0, 1080, #05002A, #05002A, #05002A, #05002A, false);
    draw_rectangle_color(960, 0, 5960, 1080, #05002A, #05002A, #05002A, #05002A, false);
    draw_sprite(spr_pause, selected, 0, 0);
    draw_sprite(spr_pauseconfecti1, global.MallowFollow, 0, 0);
    draw_sprite(spr_pauseconfecti2, global.ChocoFollow, 0, 0);
    draw_sprite(spr_pauseconfecti3, global.CrackFollow, 0, 0);
    draw_sprite(spr_pauseconfecti4, global.WormFollow, 0, 0);
    draw_sprite(spr_pauseconfecti5, global.CandyFollow, 0, 0);
    draw_player_sprite_ext(playerPauseSprite, global.panic, 686, 285, 1, 1, 0, 16777215, 1);
    draw_set_font(global.font);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    var _x = 86;
    var _y = 32;
    
    if (global.playseconds >= 10)
        draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":" + string(global.playseconds)));
    else
        draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":0" + string(global.playseconds)));
}
