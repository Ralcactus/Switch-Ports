function scribble_msdf_thickness_offset(arg0)
{
    global.__scribble_msdf_thickness_offset = arg0;
    shader_set(__shd_scribble_msdf);
    shader_set_uniform_f(global.__scribble_msdf_u_fMSDFThicknessOffset, arg0);
    shader_reset();
}
