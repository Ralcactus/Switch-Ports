function mbuff_delete(arg0)
{
    var mBuff = arg0;
    
    if (is_array(mBuff))
    {
        var n = array_length(mBuff);
        
        for (var i = 0; i < n; i++)
            buffer_delete(mBuff[i]);
    }
    else if (mBuff >= 0)
    {
        buffer_delete(mBuff);
    }
}
