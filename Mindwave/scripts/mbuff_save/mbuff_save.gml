function mbuff_save(arg0, arg1)
{
    var mBuff = arg0;
    var fname = arg1;
    var modelNum = array_length(mBuff);
    var saveBuff = buffer_create(1, buffer_grow, 1);
    mbuff_write_to_buffer(saveBuff, mBuff);
    buffer_save(saveBuff, fname);
    buffer_delete(saveBuff);
}
