function mbuff_combine(arg0, arg1)
{
    var trg = arg0;
    var src = arg1;
    var srcSize = buffer_get_size(src);
    var trgSize = buffer_get_size(trg);
    buffer_resize(trg, srcSize + trgSize);
    buffer_copy(src, 0, srcSize, trg, trgSize);
}
