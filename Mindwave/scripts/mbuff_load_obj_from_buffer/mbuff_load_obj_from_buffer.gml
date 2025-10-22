function mbuff_load_obj_from_buffer(arg0, arg1 = "", arg2 = true)
{
    var currentMaterial = "default";
    var materialList = ds_list_create();
    var mtlFname = "";
    var V = ds_list_create();
    var N = ds_list_create();
    var T = ds_list_create();
    var Fa;
    Fa[0] = ds_list_create();
    var file = buffer_read(arg0, buffer_string);
    
    while (true)
    {
        var pos = string_pos("\n", file);
        var str = string_copy(file, 1, pos);
        
        if (str == "")
            break;
        
        file = string_delete(file, 1, pos);
        str = string_replace_all(str, "  ", " ");
        
        switch (string_copy(str, 1, 2))
        {
            case "mt":
                mtlFname = string_delete(str, 1, string_pos(" ", str));
                mtlFname = filename_name(mtlFname);
                
                while (string_count(".", mtlFname))
                    mtlFname = filename_change_ext(mtlFname, "");
                
                mtlFname += ".mtl";
                var tempstr = mtlFname;
                show_debug_message(mtlFname);
                break;
            
            case "v ":
                ds_list_add(V, _mbuff_read_obj_line(str));
                break;
            
            case "vn":
                ds_list_add(N, _mbuff_read_obj_line(str));
                break;
            
            case "vt":
                ds_list_add(T, _mbuff_read_obj_line(str));
                break;
            
            case "us":
                currentMaterial = string_delete(str, 1, string_pos(" ", str));
                
                if (ds_list_find_index(materialList, currentMaterial) < 0)
                {
                    ds_list_add(materialList, currentMaterial);
                    var ind = ds_list_find_index(materialList, currentMaterial);
                    Fa[ind] = ds_list_create();
                }
                
                break;
            
            case "f ":
                var m = max(ds_list_find_index(materialList, currentMaterial), 0);
                _mbuff_read_obj_face(Fa[m], str);
                break;
        }
    }
    
    var bytesPerVert = 44;
    var modelNum = array_length(Fa);
    var mBuff = array_create(modelNum);
    var F;
    
    for (var m = 0; m < modelNum; m++)
    {
        F = Fa[m];
        var vertNum = ds_list_size(F);
        mBuff[m] = buffer_create(vertNum * bytesPerVert, buffer_fixed, 1);
        
        for (var f = 0; f < vertNum; f++)
        {
            var vnt = ds_list_find_value(F, f);
            var v = ds_list_find_value(V, array_get(vnt, 0));
            
            if (!is_array(v))
                v = [0, 0, 0];
            
            buffer_write(mBuff[m], buffer_f32, v[0]);
            buffer_write(mBuff[m], buffer_f32, v[2]);
            buffer_write(mBuff[m], buffer_f32, v[1]);
            n = ds_list_find_value(N, array_get(vnt, 1));
            
            if (!is_array(n))
                n = [0, 0, 1];
            
            buffer_write(mBuff[m], buffer_f32, n[0]);
            buffer_write(mBuff[m], buffer_f32, n[2]);
            buffer_write(mBuff[m], buffer_f32, n[1]);
            var t = ds_list_find_value(T, array_get(vnt, 2));
            
            if (!is_array(t))
                t = [0.5, 0.5];
            
            buffer_write(mBuff[m], buffer_f32, t[0]);
            buffer_write(mBuff[m], buffer_f32, 1 - t[1]);
            buffer_write(mBuff[m], buffer_u32, 16777215);
            buffer_write(mBuff[m], buffer_u32, 0);
            buffer_write(mBuff[m], buffer_u32, 1);
        }
    }
    
    var n = ds_list_size(materialList);
    var mtlNames = array_create(n);
    
    for (var i = 0; i < n; i++)
        mtlNames[i] = ds_list_find_value(materialList, i);
    
    ds_list_destroy(F);
    ds_list_destroy(V);
    ds_list_destroy(N);
    ds_list_destroy(T);
    ds_list_destroy(materialList);
    var texPack = [];
    
    if (arg2)
        var mtlPath = filename_path(arg1) + filename_name(mtlFname);
    
    return [mBuff, texPack];
}
