function texpack_remove_sprite(arg0, arg1)
{
    var texPack = arg0;
    var ind = arg1;
    var num = array_length(texPack);
    var newTexPack = array_create(num - 1);
    array_copy(newTexPack, 0, texPack, 0, ind);
    array_copy(newTexPack, ind, texPack, ind + 1, num - ind - 1);
    return newTexPack;
}
