function mbuff_rotate_uvs(arg0)
{
    var mBuff = arg0;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var modelNum = array_length(mBuff);
    var bytesPerVert = 44;
    
    for (var m = 0; m < modelNum; m++)
    {
        var buff = mBuff[m];
        var buffSize = buffer_get_size(buff);
        
        for (var i = 0; i < buffSize; i += bytesPerVert)
        {
            var u = buffer_peek(buff, i + 24, buffer_f32);
            var v = buffer_peek(buff, i + 28, buffer_f32);
            buffer_poke(buff, i + 24, buffer_f32, v);
            buffer_poke(buff, i + 28, buffer_f32, u);
        }
    }
}
