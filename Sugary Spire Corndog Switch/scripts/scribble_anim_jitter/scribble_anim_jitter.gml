function scribble_anim_jitter(arg0, arg1, arg2)
{
    if (arg0 != global.__scribble_anim_properties[UnknownEnum.Value_17] || arg1 != global.__scribble_anim_properties[UnknownEnum.Value_18] || arg2 != global.__scribble_anim_properties[UnknownEnum.Value_19])
    {
        global.__scribble_anim_properties[UnknownEnum.Value_17] = arg0;
        global.__scribble_anim_properties[UnknownEnum.Value_18] = arg1;
        global.__scribble_anim_properties[UnknownEnum.Value_19] = arg2;
        global.__scribble_anim_shader_desync = true;
        global.__scribble_anim_shader_desync_to_default = false;
        global.__scribble_anim_shader_msdf_desync = true;
        global.__scribble_anim_shader_msdf_desync_to_default = false;
    }
}
