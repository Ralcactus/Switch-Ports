event_user(0);

if (ready)
{
    instances = [];
    
    with (par_microgame)
    {
        visible = false;
        
        if (ID == other.ID)
            array_push(other.instances, id);
    }
    
    var _func = function(arg0, arg1)
    {
        return arg1.depth - arg0.depth;
    };
    
    array_sort(instances, _func);
}

if (!surface_exists(surf_splash))
    surf_splash = surface_create(game_width, game_height);

surface_set_target(surf_splash);
draw_clear_alpha(c_white, 0);
event_user(2);
surface_reset_target();

if (!surface_exists(surf))
    surf = surface_create(game_width, game_height);

surface_set_target(surf);
draw_clear_alpha(c_white, 0);
draw_rectangle_color(0, 0, game_width, game_height, c_gray, c_gray, c_gray, c_gray, false);
var _shakedrawx = screenshake_draw[0];
var _shakedrawy = screenshake_draw[1];

for (var i = 0; i < array_length(instances); i++)
{
    with (instances[i])
    {
        x += _shakedrawx;
        y += _shakedrawy;
        event_perform(ev_draw, ev_draw_normal);
        x -= _shakedrawx;
        y -= _shakedrawy;
    }
}

var _x = 0;
var _y = 0;
var _xscale = splash_scale;
var _yscale = splash_scale;
_x += ((game_width / 2) * (1 - _xscale));
_y += ((game_height / 2) * (1 - _yscale));
draw_surface_ext(surf_splash, _x, _y, splash_scale, splash_scale, angle, c_white, splash_alpha);
surface_reset_target();
