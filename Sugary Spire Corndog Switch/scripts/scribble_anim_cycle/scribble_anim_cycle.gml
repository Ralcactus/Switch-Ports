function scribble_anim_cycle(arg0, arg1, arg2)
{
    if (arg0 != global.__scribble_anim_properties[UnknownEnum.Value_14] || arg1 != global.__scribble_anim_properties[UnknownEnum.Value_15] || arg2 != global.__scribble_anim_properties[UnknownEnum.Value_16])
    {
        global.__scribble_anim_properties[UnknownEnum.Value_14] = arg0;
        global.__scribble_anim_properties[UnknownEnum.Value_15] = arg1;
        global.__scribble_anim_properties[UnknownEnum.Value_16] = arg2;
        global.__scribble_anim_shader_desync = true;
        global.__scribble_anim_shader_desync_to_default = false;
        global.__scribble_anim_shader_msdf_desync = true;
        global.__scribble_anim_shader_msdf_desync_to_default = false;
    }
}
