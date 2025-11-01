// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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