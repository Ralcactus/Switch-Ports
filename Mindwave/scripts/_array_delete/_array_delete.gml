function _array_delete(arg0, arg1)
{
    var array = arg0;
    var index = arg1;
    var num = array_length(array);
    var newArray = array_create(num - 1);
    array_copy(newArray, 0, array, 0, index);
    array_copy(newArray, index, array, index + 1, num - index);
    return newArray;
}
