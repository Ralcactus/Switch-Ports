function vbuff_remove(arg0, arg1)
{
    var vBuff = arg0;
    var modelInd = arg1;
    
    if (!is_array(vBuff))
        return -1;
    
    var num = array_length(vBuff);
    var newVbuff = array_create(num - 1);
    array_copy(newVbuff, 0, vBuff, 0, modelInd);
    vertex_delete_buffer(vBuff[modelInd]);
    var i = modelInd + 1;
    
    while (i < num)
    {
        newVbuff[i - 1] = vBuff[i];
        i++;
    }
    
    return newVbuff;
}
