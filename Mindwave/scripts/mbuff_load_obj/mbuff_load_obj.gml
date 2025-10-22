function mbuff_load_obj(arg0)
{
    var buff = buffer_load(arg0);
    var model = mbuff_load_obj_from_buffer(buff, false);
    buffer_delete(buff);
    return model[0];
}
