function approach(value, target, amount)
{
	// approach(value, target, amount)
	/// @description Approach the target provided
	/// @param value The value to be changed.
	/// @param target The value targetted.
	/// @param amount The amount to change.
    return value + clamp(target - value, -amount, amount);
}

function instance_random(arg0)
{
    return instance_find(arg0, irandom(instance_number(arg0) - 1));
}

function trace()
{
    var _string = "";
    
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i]);
    
    show_debug_message(_string);
    exit;
}

function get_panic()
{
    return global.panic && (!global.secret_room || (instance_exists(obj_tv) && obj_tv.sucroseTimer));
}

function chance(percent)
{
	/// @description Returns true or false depending on RNG
	/// @param percent 
    return percent > random(1);
}

/// @description Returns a value that will wave back and forth between [from-to] over [duration] seconds
/// @param from 	
/// @param to
/// @param duration
/// @param offset
/// @param time
function wave(from, to, duration, offset, time = current_time)
{
    var a4 = (to - from) * 0.5;
    return from + a4 + (sin((((time * 0.001) + (duration * offset)) / duration) * (2 * pi)) * a4);
}

function loop(arg0, arg1, arg2, arg3 = 0, arg4 = current_time / 1000)
{
    var _a = ((arg4 + arg3) % arg2) / arg2;
    
    if (_a == 1)
        _a = 0;
    
    return lerp(arg0, arg1, _a);
}

function wrap(arg0, arg1, arg2)
{
	/// @description wrap(value, min, max)
	/// @function wrap
	/// @param value The value to wrap into the bounds
	/// @param min Minimum bound, inclusive
	/// @param max Maximum bound, inclusive
	// Returns the value wrapped to the range [min, max] (min and max can be swapped).
	// Calls floor() on reals, but GML's modulo is doing something weird and original_wrap just hangs indefinitely on some values anyways so oh well.

    var value = floor(arg0);
    var _min = floor(min(arg1, arg2));
    var _max = floor(max(arg1, arg2));
    var range = (_max - _min) + 1; // + 1 is because max bound is inclusive
    return ((((value - _min) % range) + range) % range) + _min;
}

/// @description animation_end(value, endpoint)
/// @function animation_end
/// @param value The Value to check
/// @param endpoint The Value considered the end
function animation_end(value = floor(image_index), endpoint = image_number - 1)
{
    return value >= endpoint;
}

/// @description Returns Rank Value
/// @function rank_checker
function rank_checker(rank = global.rank)
{
    var value = 0;
    
    switch (rank)
    {
        case "p":
            value = 5;
            break;
        
        case "s":
            value = 4;
            break;
        
        case "a":
            value = 3;
            break;
        
        case "b":
            value = 2;
            break;
        
        case "c":
            value = 1;
            break;
        
        case "d":
            value = 0;
            break;
        
        default:
            value = -1;
            break;
    }
    
    return value;
}

/// string_extract(str,sep,index)
//
//  Returns the element at the given index within a string of elements.
//
//  eg. string_extract("cat,dog,mouse", "," ,1) == "dog"
//
//      str         elements, string
//      sep         element separator, string
//      index       element to return, [0..N-1], real
//
/// GMLscripts.com/license
function string_extract(str, sep, index)
{
    var len = string_length(sep) - 1;
    
    repeat (index)
        str = string_delete(str, 1, string_pos(sep, str) + len);
    
    str = string_delete(str, string_pos(sep, str), string_length(str));
    return str;
}

/// @function create_small_number(x, y, number, color)
/// @description creates a small number effect	
/// @param x
/// @param y 
/// @param number 
/// @param color
function create_small_number(_x, _y, _number, _color = 0)
{
    var _smallnumber = instance_create(_x, _y, obj_smallnumber);
    
    with (_smallnumber)
    {
        number = string(_number);
        color = _color;
    }
    
    return _smallnumber;
}

function string_get_split(input, delimiter)
{
    var slot = 0;
    var splits = []; //array to hold all splits
    var str2 = ""; //var to hold the current split we're working on building
    
    for (var i = 1; i < (string_length(input) + 1); i++)
    {
        var currStr = string_char_at(input, i);
        
        if (currStr == delimiter)
        {
            if (str2 != "")// Make sure we don't include the delimiter
            {
                splits[slot] = str2;//add this split to the array of all splits
                slot++;
            }
            
            str2 = "";
        }
        else
        {
            str2 = str2 + currStr;
            splits[slot] = str2;
        }
    }
    // If we ended on our delimiter character, include an empty string as the final split
    if (str2 == "")
        splits[slot] = str2;
    
    return splits;
}

/// @function draw_sprite_ext_flash
/// @param sprite
/// @param subimg
/// @param x 
/// @param y
/// @param xscale
/// @param yscale
/// @param rot
/// @param col
/// @param alpha
function draw_sprite_ext_flash(spr, ind, xx, yy, xsc, ysc, ang, col, alp) 
{
	gpu_set_fog(true, col, 0, 1);
    draw_sprite_ext(spr, ind, xx, yy, xsc, ysc, ang, col, alp);
    gpu_set_fog(false, c_black, 0, 0);
    return;
}

/// @function draw_self_flash
/// @param col
function draw_self_flash(col)
{
    gpu_set_fog(true, col, 0, 1);
    draw_self();
    gpu_set_fog(false, c_black, 0, 0);
    exit;
}

/// @desc This function returns if whether or not a certain string contains the given substring.
/// @param {string} str The String.
/// @param {string} substr The substring to look for in the string.
/// @returns {bool}
function string_contains(str, substr)
{
    if (string_length(substr) > string_length(str))
        return false;
    
    return (string_pos(substr, str) != 0);
}

/// @desc This function returns if whether or not a certain string begins with the substring.
/// @param {string} str The String.
/// @param {string} substr The substring to look for in the string.
/// @returns {bool}
function string_startswith(str, substr)
{
    if (string_length(substr) > string_length(str))
        return false;
    
    return (string_pos(substr, str) == 1);
}

/// @desc This function returns if whether or not a certain string ends with the substring.
/// @param {string} str The String.
/// @param {string} substr The substring to look for in the string.
/// @returns {bool}
function string_endswith(str, substr)
{
    if (string_length(substr) > string_length(str))
        return false;
    
    return (string_pos(substr, str) == ((string_length(str) - string_length(substr)) + 1));
}

/// @desc   Converts Minutes and Seconds to Frames for Global.Fill
/// @param  {real}      mins          Minutes to convert
/// @param  {real}      secs          Seconds to convert
/// @returns {real}
function time_in_frames(mins, secs)
{
    return ((mins * 60) + secs) * 60;
}

/// @desc   Returns true if on beat 
/// @param  {real}      bpm          BPM to sync to
/// @param  {bool}      use_fps      Whether the beat sync changes with Game FPS
/// @returns {bool}
function onBeat(bpm, use_fps = false)//use_fps is unused
{
    var bps = bpm / 60;
    var spb = 1 / bps;
    var songTimer = audio_sound_get_track_position(global.music);
    var _fps = 60;
    var beat2 = floor(songTimer) / (spb * _fps);
    
    if (beat != beat2)
    {
        beat = beat2;
        return true;
    }
    
    show_debug_message(beat2);
    show_debug_message(beat);
    return false;
}

function solid_in_line(target, exclude_array = noone, start_obj = self)//start_obj is unused
{
    var _list = ds_list_create();
    var set_list = collision_line_list(x, y, target.x, target.y, par_collision, true, true, _list, true);
    
    if (set_list > 0)
    {
        for (var i = 0; i < set_list; i++)
        {
            var obj = ds_list_find_value(_list, i);
            show_debug_message(obj.object_index);
            
            if (exclude_array != noone)
            {
                var found_obj = false;
                
                for (var b = 0; b < array_length(exclude_array); b++)
                {
                    var arr = exclude_array[b];
                    show_debug_message(arr);
                    
                    if (obj.object_index == arr)
                        found_obj = true;
                }
                
                if (!found_obj)
                {
                    ds_list_destroy(_list);
                    return true;
                }
            }
            else
            {
                ds_list_destroy(_list);
                return true;
            }
        }
    }
    
    ds_list_destroy(_list);
    return false;
}

function angle_rotate(arg0, arg1, arg2)
{
    var diff = wrap(arg1 - arg0, -180, 180);
    
    if (diff < -arg2)
        return arg0 - arg2;
    
    if (diff > arg2)
        return arg0 + arg2;
    
    return arg1;
}

function gate_createlayer(sprite, index, xscroll = 0, yscroll = 0, imgspd = 0)
{
    return 
    {
        drawSpr: sprite,
        drawIndex: index,
        drawXscale: 1,
        drawYscale: 1,
        drawImgSpd: imgspd,
        drawAlpha: 1,
        drawBlend: c_white,
        drawRot: 0,
        drawx: 0,
        drawy: 0,
        scroll_x: xscroll,
        scroll_y: yscroll,
        func: noone
    };
}
