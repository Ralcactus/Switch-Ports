function mbuff_write_to_buffer(arg0, arg1)
{
    var saveBuff = arg0;
    var mBuff = arg1;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var modelNum = array_length(mBuff);
    buffer_write(saveBuff, buffer_string, "mBuff");
    buffer_write(saveBuff, buffer_u16, modelNum);
    buffer_write(saveBuff, buffer_bool, is_array(arg1));
    
    for (var i = 0; i < modelNum; i++)
    {
        var buffSize = buffer_get_size(mBuff[i]);
        buffer_write(saveBuff, buffer_u32, buffSize);
        buffer_copy(mBuff[i], 0, buffSize, saveBuff, buffer_tell(saveBuff));
        buffer_seek(saveBuff, buffer_seek_relative, buffSize);
    }
}
