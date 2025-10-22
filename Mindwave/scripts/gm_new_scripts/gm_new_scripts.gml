function array_concat(a, b) {
    var la = array_length(a);
    var lb = array_length(b);
    var res = array_create(la + lb, 0);
    var i;
    for (i = 0; i < la; i++) res[i] = a[i];
    for (i = 0; i < lb; i++) res[la + i] = b[i];
    return res;
}

function string_split(str, delim) {
    var res = array_create(0, "");
    var dlen = string_length(delim);
    var pos = string_pos(delim, str);
    while (pos > 0) {
        res = array_concat(res, [string_copy(str, 1, pos - 1)]);
        str = string_copy(str, pos + dlen, string_length(str));
        pos = string_pos(delim, str);
    }
    return array_concat(res, [str]);
}

function string_concat(arr, delim) {
    var len = array_length(arr);
    var s = "";
    if (len > 0) s = arr[0];
    for (var i = 1; i < len; i++) s += delim + arr[i];
    return s;
}

function array_contains(arr, val) {
    var len = array_length(arr);
    for (var i = 0; i < len; i++) if (arr[i] == val) return true;
    return false;
}

function is_callable(value) {
	if (value == undefined) 
		return false;
		
	if (is_real(value))
		return script_exists(value);

	return true;
}

function array_filter(arr, predicate) {
    var len = array_length(arr);
    var res = array_create(0, 0);
    for (var i = 0; i < len; i++) {
        if (predicate(arr[i])) res = array_concat(res, [arr[i]]);
    }
    return res;
}

function array_get_index(arr, val) {
    var len = array_length(arr);
    for (var i = 0; i < len; i++) {
        if (arr[i] == val) return i;
    }
    return -1;
}

function struct_exists(_struct) {
    return !is_undefined(_struct) && is_struct(_struct);
}

function variable_clone(src) {
    if ( ds_exists(src, ds_type_list) ) {
        var newList = ds_list_create();
        var len     = ds_list_size(src);
        for (var i = 0; i < len; i++) {
            var v = ds_list_get(src, i);
            ds_list_add(newList, variable_clone(v));
        }
        return newList;
    }
    else if ( ds_exists(src, ds_type_map) ) {
        var newMap = ds_map_create();
        var keys   = ds_map_keys(src);
        var kcount = ds_list_size(keys);
        for (var i = 0; i < kcount; i++) {
            var key = ds_list_get(keys, i);
            var val = ds_map_find_value(src, key);
            ds_map_add(newMap, key, variable_clone(val));
        }
        ds_list_destroy(keys);
        return newMap;
    }
    else if ( is_struct(src) ) {
        var out   = {};
        var names = variable_struct_get_names(src);
        for (var i = 0; i < array_length(names); i++) {
            var f = names[i];
            out[f] = variable_clone(src[f]);
        }
        return out;
    }
    else {
        return src;
    }
}

function struct_get(_s, _k) {
	return variable_struct_get(_s, _k);
}

function struct_set(_struct, _key, _value)
{
	return variable_struct_set(_struct, _key, _value);
}

function array_foreach(arr, cb)
{
	var _len = array_length(arr);
	for (var i = 0; i < _len; i++)
	{
		cb(arr[i], i);
	}
}

function struct_get_names(s) {
    var j = json_stringify(s);
    j = string_delete(string_delete(j, 1, 1), string_length(j), 1);
    var e = string_split(j, ",", false), n = [];
    for (var i = 0; i < array_length(e); i++) {
        array_push(n, string_trim(string_replace_all(string_copy(e[i], 1, string_pos(":", e[i]) - 1), "\"", "")));
    }
    return n;
}

function sprite_add_ext(_f, _n, _b, _s, _x, _y, _spd) {
	if (is_undefined(_x)) _x = 0;
	if (is_undefined(_y)) _y = 0;

	var s = sprite_add(_f, _n, _b, _s, _x, _y);

	// Old runtimes on Switch often don't have sprite_set_speed/constants.
	// If you really need playback rate per-sprite, set image_speed on instances instead.
	/* if (!is_undefined(_spd) && function_exists(sprite_set_speed)) {
		// spritespeed_framespersecond may not exist on your runtime; skip to stay safe.
		sprite_set_speed(s, _spd, 0);
	} */

	return s;
}


