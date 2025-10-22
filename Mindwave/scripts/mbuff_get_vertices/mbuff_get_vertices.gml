function mbuff_get_vertices(arg0)
{
    var mBuff = arg0;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var vertNum = 0;
    var bytesPerVert = 44;
    var modelNum = array_length(mBuff);
    
    for (var m = 0; m < modelNum; m++)
    {
        var buff = mBuff[m];
        var buffSize = buffer_get_size(buff);
        vertNum += (buffSize div bytesPerVert);
    }
    
    return vertNum;
}
