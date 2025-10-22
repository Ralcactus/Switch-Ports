function mbuff_flip_triangles(arg0)
{
    var mBuff = arg0;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var bytesPerVert = 44;
    var bytesPerTri = 3 * bytesPerVert;
    var tempBuff = buffer_create(bytesPerTri, buffer_fixed, 1);
    var modelNum = array_length(mBuff);
    
    for (var m = 0; m < modelNum; m++)
    {
        var buff = mBuff[m];
        var bufferSize = buffer_get_size(buff);
        
        for (var i = 0; i < bufferSize; i += bytesPerTri)
        {
            buffer_copy(buff, i, bytesPerVert, tempBuff, 0);
            buffer_copy(buff, i + bytesPerVert, bytesPerVert, tempBuff, bytesPerVert);
            buffer_copy(buff, i + (2 * bytesPerVert), bytesPerVert, tempBuff, 2 * bytesPerVert);
            buffer_copy(tempBuff, 0, bytesPerVert, buff, i);
            buffer_copy(tempBuff, bytesPerVert, bytesPerVert, buff, i + (2 * bytesPerVert));
            buffer_copy(tempBuff, 2 * bytesPerVert, bytesPerVert, buff, i + bytesPerVert);
        }
    }
    
    buffer_delete(tempBuff);
}
