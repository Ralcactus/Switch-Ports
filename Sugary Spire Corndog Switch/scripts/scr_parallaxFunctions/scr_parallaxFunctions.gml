global.ParallaxMap = ds_map_create();

function scr_addParallaxLayer(arg0, arg1, arg2 = [])
{
    ds_map_set(global.ParallaxMap, arg0, 
    {
        func: arg1,
        args: arg2
    });
    exit;
}

function defaultParallax(arg0, arg1)
{
    x += (camera_get_view_x(view_camera[0]) * arg0);
    y += (camera_get_view_y(view_camera[0]) * arg1);
}

function defaultParallaxGround(arg0, arg1)
{
    x += round(camera_get_view_x(view_camera[0]) * arg0);
    y += round(room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id_fixed(id))));
}

function defaultParallaxH(arg0, arg1)
{
    x += (camera_get_view_x(view_camera[0]) * arg0);
    y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * arg1 * (camera_get_view_height(view_camera[0]) / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id_fixed(id))) - camera_get_view_height(view_camera[0])));
}

function defaultParallaxV(arg0, arg1)
{
    x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * arg0 * (camera_get_view_width(view_camera[0]) / room_width), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id_fixed(id))) - camera_get_view_width(view_camera[0])));
    y += (camera_get_view_y(view_camera[0]) * arg1);
}

function defaultParallaxFar(arg0, arg1)
{
    x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * arg0 * (camera_get_view_width(view_camera[0]) / room_width), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id_fixed(id))) - camera_get_view_width(view_camera[0])));
    y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * arg1 * (camera_get_view_height(view_camera[0]) / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id_fixed(id))) - camera_get_view_height(view_camera[0])));
}

function defaultParallaxFull(arg0, arg1)
{
    var _spr = layer_background_get_sprite(layer_background_get_id_fixed(id));
    var _xpct = camera_get_view_x(view_camera[0]) / (room_width - camera_get_view_width(view_camera[0]));
    var _ypct = camera_get_view_y(view_camera[0]) / (room_height - camera_get_view_height(view_camera[0]));
    x += (camera_get_view_x(view_camera[0]) - clamp(_xpct * (sprite_get_width(_spr) - camera_get_view_width(view_camera[0])), 0, sprite_get_width(_spr) - camera_get_view_width(view_camera[0])));
    y += (camera_get_view_y(view_camera[0]) - clamp(_ypct * (sprite_get_height(_spr) - camera_get_view_height(view_camera[0])), 0, sprite_get_height(_spr) - camera_get_view_height(view_camera[0])));
}

function parallaxZigZagV(arg0, arg1)
{
    var time = global.ScrollOffset / 60;
    var _spd = layer_get_vspeed(id);
    var _sin = sin(time) * _spd;
    x += (camera_get_view_x(view_camera[0]) * arg0);
    y += ((camera_get_view_y(view_camera[0]) * arg1) + _sin);
    y -= yShift;
}

function parallaxZigZagHFar(arg0, arg1)
{
    var time = global.ScrollOffset / 60;
    var _spd = vspeed;
    var _sin = sin(time) * _spd;
    x += (camera_get_view_x(view_camera[0]) * arg0);
    y += (_sin + (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * arg1 * (camera_get_view_height(view_camera[0]) / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id_fixed(id))) - camera_get_view_height(view_camera[0]))));
    y -= yShift;
}

function parallaxZigZagVFar(arg0, arg1)
{
    var time = global.ScrollOffset / 60;
    var _spd = vspeed;
    var _sin = sin(time) * _spd;
    x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * arg0 * (camera_get_view_width(view_camera[0]) / room_width), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id_fixed(id))) - camera_get_view_width(view_camera[0])));
    y += (_sin + (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * arg1 * (camera_get_view_height(view_camera[0]) / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id_fixed(id))) - camera_get_view_height(view_camera[0]))));
    y -= yShift;
}
