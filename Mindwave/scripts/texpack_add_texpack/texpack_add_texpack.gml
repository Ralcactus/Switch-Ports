function texpack_add_texpack(arg0, arg1)
{
    var trgNum = array_length(arg0);
    var srcNum = array_length(arg1);
    array_copy(arg0, trgNum, arg1, 0, srcNum);
    return arg0;
}
