function texpack_add_sprite(arg0, arg1)
{
    var texPack = arg0;
    var spr = arg1;
    var num = array_length(texPack);
    texPack[num] = spr;
    return num;
}
