// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Hope you like structs
function struct_exists(_struct, _name)
{
    if (!is_struct(_struct) || !is_string(_name))
        return false;
	else
		return variable_instance_exists(_struct, _name);
}

function struct_set(_struct, _name, _value)
{
    if !is_struct(_struct)
		return false;
    if !is_string(_name) || string_length(_name) <= 0
		return false;

    variable_struct_set(_struct, _name, _value)
    return true;
}

function struct_get(_struct, _name, _default = undefined)
{
    if !is_struct(_struct) || !variable_struct_exists(_struct, _name) || (!is_string(_name) || string_length(_name) == 0) {
        return _default;
    }
	
    return variable_struct_get(_struct, _name);
}


function array_shift(_array)
{
	var len = array_length(_array);
	var firstValue = _array[0];

    for (var i = 0; i < len - 1; i++) {
        _array[i] = _array[i+1];
    }
	
    array_resize(_array, len - 1);
	
    return firstValue;
}

function camera_copy_transforms(_destCam, _srcCam)
{
    camera_set_view_mat(_destCam, camera_get_view_mat(_srcCam));
    camera_set_proj_mat(_destCam, camera_get_proj_mat(_srcCam));
    camera_set_view_pos(_destCam, camera_get_view_x(_srcCam), camera_get_view_y(_srcCam));
    camera_set_view_size(_destCam, camera_get_view_width(_srcCam), camera_get_view_height(_srcCam));
    camera_set_view_speed(_destCam, camera_get_view_speed_x(_srcCam), camera_get_view_speed_y(_srcCam));
    camera_set_view_border(_destCam, camera_get_view_border_x(_srcCam), camera_get_view_border_y(_srcCam));
    camera_set_view_angle(_destCam, camera_get_view_angle(_srcCam));
    
    return true;
}

function struct_get_from_hash(_struct, _hash)
{
    var _names = variable_struct_get_names(_struct);
    var _len = array_length(_names);

    for (var i = 0; i < _len; i++)
    {
        var _name = _names[i];
        if (variable_get_hash(_name) == _hash)
        {
            return variable_struct_get(_struct, _name);
        }
    }
}

function variable_get_hash(_name)
{
    if (!is_string(_name) || string_length(_name) == 0) {
        return undefined;
    }

    var _hash = 0;
    var len = string_length(_name);
    for (var i = 1; i <= len; i++) {
        _hash += ord(string_char_at(_name, i)) * i;
    }

    return _hash;
}