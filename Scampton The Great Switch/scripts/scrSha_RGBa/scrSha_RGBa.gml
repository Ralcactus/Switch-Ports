function scrSha_RGBa(arg0, arg1, arg2, arg3)
{
    shader_set(shaRGB);
    shader_set_uniform_f(shader_get_uniform(shaRGB, "col_r"), arg0);
    shader_set_uniform_f(shader_get_uniform(shaRGB, "col_g"), arg1);
    shader_set_uniform_f(shader_get_uniform(shaRGB, "col_b"), arg2);
    shader_set_uniform_f(shader_get_uniform(shaRGB, "col_a"), arg3);
}
