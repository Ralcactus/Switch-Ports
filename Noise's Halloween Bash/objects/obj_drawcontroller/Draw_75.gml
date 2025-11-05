shader_set(shd_premultiply);

with (obj_pausemenu)
    event_user(0);

with (obj_savesystem)
{
    if (saveiconalpha > 0)
    {
        if (saveiconspr == spr_saveindicator)
            pal_swap_set(obj_player.palettespr, obj_player.curpalette, false);
        
        draw_sprite_ext(saveiconspr, saveiconind, get_game_width() - 45, get_game_height() - 40, 1, 1, 0, c_white, saveiconalpha);
        pal_swap_reset();
    }
}

surface_reset_target();
shader_reset();
surface_set_target(finalsurf);

if (surface_exists(guisurf))
    draw_surface_stretched(guisurf, 0, 0, global.currentres[0], global.currentres[1]);

surface_reset_target();
gpu_set_blendmode(bm_normal);
display_set_gui_maximise(browser_width / windowwidth, browser_height / windowheight, (windowwidth % 2) / -2, (windowheight % 2) / -2);
draw_sprite_stretched_ext(spr_1x1, 0, -100, -100, windowwidth + 100, windowheight + 100, c_black, 1);
var _viewx = (windowwidth / 2) - ((global.currentres[0] * appscalex) / 2);
var _viewy = (windowheight / 2) - ((global.currentres[1] * appscaley) / 2);
var _vieww = surface_get_width(finalsurf) * appscalex;
var _viewh = surface_get_height(finalsurf) * appscaley;
global.screenmouse_x = ((device_mouse_x_to_gui(0) - _viewx) / _vieww) * get_game_width();
global.screenmouse_y = ((device_mouse_y_to_gui(0) - _viewy) / _viewh) * get_game_height();

if ((frac(appscalex) > 0 || frac(appscaley) > 0) && global.antialiasing)
    gpu_set_texfilter(true);
else
    gpu_set_texfilter(false);

gpu_set_blendenable(false);
draw_surface_ext(finalsurf, _viewx, _viewy, appscalex, appscaley, 0, c_white, 1);
gpu_set_blendenable(true);
gpu_set_texfilter(false);
__display_gui_restore();
gameframe_draw();
