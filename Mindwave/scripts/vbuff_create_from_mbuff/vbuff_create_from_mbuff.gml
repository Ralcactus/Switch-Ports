function vbuff_create_from_mbuff(arg0)
{
    var triNum = 0;
    var mBuff = arg0;
    
    if (is_array(mBuff) && array_length(mBuff) < 1)
    {
        show_debug_message("Error in script vbuff_create_from_mbuff: Mbuff does not contain any buffers");
        return -1;
    }
    
    var vBuff;
    
    if (!is_array(mBuff))
    {
        vBuff = vertex_create_buffer_from_buffer(mBuff, global.mBuffFormat);
        vertex_freeze(vBuff);
    }
    else
    {
        var modelNum = array_length(mBuff);
        vBuff = array_create(modelNum);
        
        for (var i = 0; i < modelNum; i++)
        {
            vBuff[i] = vertex_create_buffer_from_buffer(mBuff[i], global.mBuffFormat);
            vertex_freeze(vBuff[i]);
            triNum += (buffer_get_size(mBuff[i]) / 44 / 3);
        }
    }
    
    return vBuff;
}
