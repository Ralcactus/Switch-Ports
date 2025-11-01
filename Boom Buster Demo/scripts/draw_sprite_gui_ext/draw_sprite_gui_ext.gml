function draw_sprite_gui_ext(arg0, arg1, arg2, arg3, arg4 = 1, arg5 = 1, arg6 = 0, arg7 = 16777215, arg8 = 1)
{
    draw_sprite_ext(arg0, arg1, arg2 + (obj_persistent.app_resize * -256), arg3, arg4, arg5, arg6, arg7, arg8);
}
