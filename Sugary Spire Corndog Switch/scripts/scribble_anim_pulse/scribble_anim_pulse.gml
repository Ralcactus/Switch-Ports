function scribble_anim_pulse(arg0, arg1)
{
    if (arg0 != global.__scribble_anim_properties[UnknownEnum.Value_9] || arg1 != global.__scribble_anim_properties[UnknownEnum.Value_10])
    {
        global.__scribble_anim_properties[UnknownEnum.Value_9] = arg0;
        global.__scribble_anim_properties[UnknownEnum.Value_10] = arg1;
        global.__scribble_anim_shader_desync = true;
        global.__scribble_anim_shader_desync_to_default = false;
        global.__scribble_anim_shader_msdf_desync = true;
        global.__scribble_anim_shader_msdf_desync_to_default = false;
    }
}
