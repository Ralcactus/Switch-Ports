function mbuff_load(arg0)
{
    var fname = arg0;
    var loadBuff = buffer_load(fname);
    var mBuff = mbuff_read_from_buffer(loadBuff);
    buffer_delete(loadBuff);
    return mBuff;
}
