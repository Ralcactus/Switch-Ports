function spawn_da(arg0, arg1, arg2 = sAttack1, arg3 = 0, arg4 = [0, 0], arg5 = [0, 0])
{
    with (instance_create_depth(arg0, arg1, -9999, oDodgeAttack))
    {
        sprite_index = arg2;
        image_index = arg3;
        ex = arg4;
        ey = arg5;
    }
}
