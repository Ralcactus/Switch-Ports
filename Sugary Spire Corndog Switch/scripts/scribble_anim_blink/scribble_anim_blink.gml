function scribble_anim_blink(arg0, arg1, arg2)
{
    if (arg0 != global.__scribble_anim_blink_on_duration || arg1 != global.__scribble_anim_blink_off_duration || arg2 != global.__scribble_anim_blink_time_offset)
    {
        global.__scribble_anim_blink_on_duration = arg0;
        global.__scribble_anim_blink_off_duration = arg1;
        global.__scribble_anim_blink_time_offset = arg2;
        global.__scribble_anim_shader_desync = true;
        global.__scribble_anim_shader_desync_to_default = false;
        global.__scribble_anim_shader_msdf_desync = true;
        global.__scribble_anim_shader_msdf_desync_to_default = false;
    }
}
