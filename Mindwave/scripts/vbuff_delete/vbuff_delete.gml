function vbuff_delete(arg0)
{
    var vBuff = arg0;
    
    if (is_array(vBuff))
    {
        var n = array_length(vBuff);
        
        for (var i = 0; i < n; i++)
            vertex_delete_buffer(vBuff[i]);
    }
    else if (vBuff >= 0)
    {
        vertex_delete_buffer(vBuff);
    }
}
