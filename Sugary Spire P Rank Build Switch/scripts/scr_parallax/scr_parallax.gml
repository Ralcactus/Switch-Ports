//Functions - making sure
//global.ParallaxMap = ds_map_create();//this causes parallax to not work, so dont add it back

/// @desc This function passes a layer and an associated function.
/// @param {any*} lay_id ID or name of the layer to store.
/// @param {any*} function Function to be run along side the layer.
/// @param {array} [args] Arguments to be passed to the function.

function scr_addParallaxLayer(lay_id, _func, _args = []) 
{
	global.ParallaxMap[? lay_id] = 
	{ 
		func : _func, 
		args : _args 
	};
	return;
}

function defaultParallax(parallaxValueH, parallaxValueV) 
{
	x += (camx * parallaxValueH);
	y += (camy * parallaxValueV);
}

function defaultParallaxGround(parallaxValueH, parallaxValueV)
{
    var _sprite_height = sprite_get_height(layer_background_get_sprite(layer_background_get_id(id)));
    var _height = room_height - _sprite_height;
    var cam_y = clamp(camy, _height - 200, room_height);
    x += (camx * parallaxValueH);
    y += (cam_y - clamp(cam_y * parallaxValueV * (camh / _height), 0, _sprite_height - camh));
}

function defaultParallaxH(parallaxValueH, parallaxValueV)
{
    x += (camx * parallaxValueH);
    y += (camy - clamp(camy * parallaxValueV * (camh / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camh));
}

function defaultParallaxV(parallaxValueH, parallaxValueV)
{
    x += (camx - clamp(camx * parallaxValueH * (camw / room_width), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camw));
    y += (camy * parallaxValueV);
}

function defaultParallaxFar(parallaxValueH, parallaxValueV)
{
    x += (camx - clamp(camx * parallaxValueH * (camw / room_width), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camw));
    y += (camy - clamp(camy * parallaxValueV * (camh / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camh));
}

function parallaxZigZagV(parallaxValueH, parallaxValueV)
{
    var time = global.ScrollOffset / 60;
    var _spd = layer_get_vspeed(id);
    var _sin = sin(time) * _spd;
    x += (camx * parallaxValueH);
    y += ((camy * parallaxValueV) + _sin);
    y -= yShift;
}

function parallaxZigZagVFar(parallaxValueH, parallaxValueV)
{
    var time = global.ScrollOffset / 60;
    var _spd = vspeed;
    var _sin = sin(time) * _spd;
    x += (camx - clamp(camx * parallaxValueH * (camw / room_width), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camw));
    y += (_sin + (camy - clamp(camy * parallaxValueV * (camh / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camh)));
    y -= yShift;
}
