function scribble_anim_wheel(arg0, arg1, arg2)
{
    if (arg0 != global.__scribble_anim_properties[UnknownEnum.Value_11] || arg1 != global.__scribble_anim_properties[UnknownEnum.Value_12] || arg2 != global.__scribble_anim_properties[UnknownEnum.Value_13])
    {
        global.__scribble_anim_properties[UnknownEnum.Value_11] = arg0;
        global.__scribble_anim_properties[UnknownEnum.Value_12] = arg1;
        global.__scribble_anim_properties[UnknownEnum.Value_13] = arg2;
        global.__scribble_anim_shader_desync = true;
        global.__scribble_anim_shader_desync_to_default = false;
        global.__scribble_anim_shader_msdf_desync = true;
        global.__scribble_anim_shader_msdf_desync_to_default = false;
    }
}
