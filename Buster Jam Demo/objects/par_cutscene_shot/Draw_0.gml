get_cams();

if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

surface_set_target(surf);
event_user(0);
surface_reset_target();
var _w = 1920;
var _h = 1080;
var _x = camx + ((_w / 2) * (1 - zoom));
var _y = camy + ((_h / 2) * (1 - zoom));

if (auto_draw_surface)
    draw_surface_ext(surf, _x, _y, zoom, zoom, 0, c_white, 1);
