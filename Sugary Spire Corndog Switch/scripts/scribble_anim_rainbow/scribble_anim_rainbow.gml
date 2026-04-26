function scribble_anim_rainbow(arg0, arg1)
{
    if (arg0 != global.__scribble_anim_properties[UnknownEnum.Value_5] || arg1 != global.__scribble_anim_properties[UnknownEnum.Value_6])
    {
        global.__scribble_anim_properties[UnknownEnum.Value_5] = arg0;
        global.__scribble_anim_properties[UnknownEnum.Value_6] = arg1;
        global.__scribble_anim_shader_desync = true;
        global.__scribble_anim_shader_desync_to_default = false;
        global.__scribble_anim_shader_msdf_desync = true;
        global.__scribble_anim_shader_msdf_desync_to_default = false;
    }
}
