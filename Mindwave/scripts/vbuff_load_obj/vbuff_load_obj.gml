function vbuff_load_obj(arg0)
{
    var fname = arg0;
    var mBuff = mbuff_load_obj(fname);
    var vBuff = vbuff_create_from_mbuff(mBuff);
    mbuff_delete(mBuff);
    return vBuff;
}
