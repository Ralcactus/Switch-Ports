function scribble_anim_wave(arg0, arg1, arg2)
{
    if (arg0 != global.__scribble_anim_properties[UnknownEnum.Value_0] || arg1 != global.__scribble_anim_properties[UnknownEnum.Value_1] || arg2 != global.__scribble_anim_properties[UnknownEnum.Value_2])
    {
        global.__scribble_anim_properties[UnknownEnum.Value_0] = arg0;
        global.__scribble_anim_properties[UnknownEnum.Value_1] = arg1;
        global.__scribble_anim_properties[UnknownEnum.Value_2] = arg2;
        global.__scribble_anim_shader_desync = true;
        global.__scribble_anim_shader_desync_to_default = false;
        global.__scribble_anim_shader_msdf_desync = true;
        global.__scribble_anim_shader_msdf_desync_to_default = false;
    }
}
