function vbuff_draw(arg0, arg1)
{
    var vBuff = arg0;
    var tex = arg1;
    
    if (is_array(vBuff))
    {
        var n = array_length(vBuff);
        
        if (is_array(tex))
        {
            var texPack = tex;
            var t = array_length(texPack);
            
            for (var i = 0; i < n; i++)
            {
                if (t > 0)
                {
                    var spr = texPack[i % t];
                    tex = (spr >= 0) ? sprite_get_texture(spr, 0) : -1;
                }
                else
                {
                    tex = -1;
                }
                
                vertex_submit(vBuff[i], pr_trianglelist, tex);
            }
        }
        else
        {
            for (var i = 0; i < n; i++)
                vertex_submit(vBuff[i], pr_trianglelist, tex);
        }
    }
    else
    {
        vertex_submit(vBuff, pr_trianglelist, tex);
    }
}
