function approach(arg0, arg1, arg2)
{
    return arg0 + clamp(arg1 - arg0, -arg2, arg2);
}

function instance_random(arg0)
{
    return instance_find(arg0, irandom(instance_number(arg0) - 1));
}

function trace()
{
    var trace_string = "";
    
    for (var i = 0; i < argument_count; i++)
        trace_string += string(argument[i]);
    
    show_debug_message(trace_string);
    exit;
}

function get_panic()
{
    return (global.panic && !global.RoomIsSecret) || instance_exists(obj_sucroseTimer);
}

function chance(arg0)
{
    return arg0 > random(1);
}

function wave(arg0, arg1, arg2, arg3, arg4 = current_time)
{
    var a4 = (arg1 - arg0) / 2;
    return arg0 + a4 + (sin((((arg4 * 0.001) + (arg2 * arg3)) / arg2) * 2 * pi) * a4);
}

function wrap(arg0, arg1, arg2)
{
    var value = arg0;
    var _min = min(arg1, arg2);
    var _max = max(arg1, arg2);
    var range = (_max - _min) + 1;
    return ((((value - _min) % range) + range) % range) + _min;
}

function animation_end(arg0 = floor(image_index), arg1 = image_number - 1)
{
    return arg0 >= arg1;
}

function absfloor(arg0)
{
    return (arg0 > 0) ? floor(arg0) : ceil(arg0);
}

function rank_checker(arg0 = global.rank)
{
    var ranks = ["d", "c", "b", "a", "s", "p"];
    
    for (var i = 0; i < array_length(ranks); i++)
    {
        if (arg0 == ranks[i])
            return i;
    }
    
    return 0;
}

function string_extract(arg0, arg1, arg2)
{
    var len = string_length(arg1) - 1;
    
    repeat (arg2)
        arg0 = string_delete(arg0, 1, string_pos(arg1, arg0) + len);
    
    arg0 = string_delete(arg0, string_pos(arg1, arg0), string_length(arg0));
    return arg0;
}

function create_small_number(arg0, arg1, arg2, arg3 = 0)
{
    var small_number = instance_create(arg0, arg1, obj_smallnumber);
    
    with (small_number)
        arg2 = string(arg2);
    
    return small_number;
}

function string_get_split(arg0, arg1)
{
    var slot = 0;
    var substrings = [];
    var current_substring = "";
    
    for (var i = 1; i < (string_length(arg0) + 1); i++)
    {
        var current_char = string_char_at(arg0, i);
        
        if (current_char == arg1)
        {
            if (current_substring != "")
            {
                substrings[slot] = current_substring;
                slot++;
            }
            
            current_substring = "";
        }
        else
        {
            current_substring += current_char;
            substrings[slot] = current_substring;
        }
    }
    
    if (current_substring == "")
        substrings[slot] = current_substring;
    
    return substrings;
}

function draw_sprite_ext_flash(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    gpu_set_fog(true, arg7, 0, 1);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    gpu_set_fog(false, c_black, 0, 0);
}

function draw_self_flash(arg0)
{
    draw_sprite_ext_flash(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, arg0, image_alpha);
}

function time_in_frames(arg0, arg1)
{
    return ((arg0 * 60) + arg1) * 60;
}

function onBeat(arg0, arg1 = false)
{
    var bps = arg0 / 60;
    var spb = 1 / bps;
    var song_timer = audio_sound_get_track_position(global.music);
    var game_fps = 60;
    var beat2 = floor(song_timer) / (spb * game_fps);
    
    if (beat != beat2)
    {
        beat = beat2;
        return true;
    }
    
    return false;
}

function solid_in_line(arg0, arg1 = -4, arg2 = self)
{
    var _list = ds_list_create();
    var set_list = collision_line_list(x, y, arg0.x, arg0.y, obj_parent_collision, true, true, _list, true);
    
    if (set_list > 0)
    {
        for (var i = 0; i < set_list; i++)
        {
            var obj = ds_list_find_value(_list, i);
            
            if (arg1 != -4)
            {
                var found_obj = false;
                
                for (var b = 0; b < array_length(arg1); b++)
                {
                    var arr = arg1[b];
                    
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

function getFacingDirection(arg0, arg1)
{
    if (arg0 != arg1)
        return -sign(arg0 - arg1);
    
    return 1;
}

function number_in_range(arg0, arg1, arg2)
{
    return arg0 >= arg1 && arg0 <= arg2;
}
