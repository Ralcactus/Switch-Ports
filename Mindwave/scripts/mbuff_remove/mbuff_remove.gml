function mbuff_remove(arg0, arg1)
{
    var mBuff = arg0;
    var modelInd = arg1;
    
    if (!is_array(mBuff))
        return -1;
    
    var num = array_length(mBuff);
    var newMbuff = array_create(num - 1);
    array_copy(newMbuff, 0, mBuff, 0, modelInd);
    buffer_delete(mBuff[modelInd]);
    var i = modelInd + 1;
    
    while (i < num)
    {
        newMbuff[i - 1] = mBuff[i];
        i++;
    }
    
    return newMbuff;
}
