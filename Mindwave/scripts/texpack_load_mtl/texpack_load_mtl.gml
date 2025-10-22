function texpack_load_mtl(arg0, arg1)
{
    var fname = "models/" + arg0;
    var mtlNames = arg1;
    var file = file_text_open_read(fname);
    
    if (file < 0)
    {
        show_debug_message("ERROR in script texpack_load_mtl: Failed to load mtl file " + string(fname));
        return [];
    }
    
    show_debug_message("Script texpack_load_mtl: Loading mtl file " + string(fname));
    var path = filename_path(fname);
    var currentMtl = "";
    var mtlMap = ds_map_create();
    var texMap = ds_map_create();
    var colMap = ds_map_create();
    
    while (!file_text_eof(file))
    {
        var line = string_replace_all(file_text_read_string(file), "\t", "");
        line = string_replace_all(line, "  ", " ");
        file_text_readln(file);
        var index = 0;
        var terms = array_create(string_count(line, " ") + 1, "");
        
        for (var i = 1; i <= string_length(line); i++)
        {
            if (string_char_at(line, i) == " " && ((terms[0] != "map_Ka" && terms[0] != "map_Kd" && index > 0) || index == 0))
            {
                index++;
                terms[index] = "";
            }
            else
            {
                terms[index] += string_char_at(line, i);
            }
        }
        
        switch (terms[0])
        {
            case "newmtl":
                currentMtl = terms[1];
                break;
            
            case "Ka":
                var col = [0, 0, 0, 1];
                
                if (!is_undefined(ds_map_find_value(colMap, currentMtl)))
                    col = ds_map_find_value(colMap, currentMtl);
                else
                    ds_map_set(colMap, currentMtl, col);
                
                col[0] = real(terms[1]);
                col[1] = real(terms[2]);
                col[2] = real(terms[3]);
                break;
            
            case "d":
                var col = [0, 0, 0, 1];
                
                if (!is_undefined(ds_map_find_value(colMap, currentMtl)))
                    col = ds_map_find_value(colMap, currentMtl);
                else
                    ds_map_set(colMap, currentMtl, col);
                
                col[3] = real(terms[1]);
                break;
            
            case "Ks":
                break;
            
            case "Ns":
                break;
            
            case "Tr":
                break;
            
            case "map_Ka":
            case "map_Kd":
                var texPath = path + filename_name(terms[1]);
                var texName = filename_name(filename_change_ext(texPath, ""));
                ds_map_set(mtlMap, currentMtl, texName);
                
                if (is_undefined(ds_map_find_value(texMap, texName)))
                {
                    ds_map_set(texMap, texName, texpack_load_sprite(texPath));
                    
                    if (ds_map_find_value(texMap, texName) < 0)
                    {
                        texPath = path + "textures\\" + filename_name(terms[1]);
                        ds_map_set(texMap, texName, texpack_load_sprite(texPath));
                    }
                }
                
                break;
        }
    }
    
    file_text_close(file);
    var mtlNum = array_length(mtlNames);
    var texPack = array_create(mtlNum);
    
    for (var i = 0; i < mtlNum; i++)
    {
        var texName = ds_map_find_value(mtlMap, array_get(mtlNames, i));
        
        if (is_undefined(texName))
        {
            var col = ds_map_find_value(colMap, array_get(mtlNames, i));
            
            if (!is_undefined(col))
            {
                var s = surface_create(4, 4);
                surface_set_target(s);
                draw_clear_alpha(make_color_rgb(col[0] * 255, col[1] * 255, col[2] * 255), col[3]);
                surface_reset_target();
                texPack[i] = sprite_create_from_surface(s, 0, 0, 4, 4, 0, 0, 0, 0);
                surface_free(s);
                continue;
            }
            else
            {
                texPack[i] = -1;
                continue;
            }
        }
        
        var spr = ds_map_find_value(texMap, texName);
        
        if (is_undefined(spr))
            texPack[i] = -1;
        else
            texPack[i] = spr;
    }
    
    ds_map_destroy(mtlMap);
    ds_map_destroy(texMap);
    ds_map_destroy(colMap);
    return texPack;
}
