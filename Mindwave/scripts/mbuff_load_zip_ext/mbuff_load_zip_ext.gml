function mbuff_load_zip_ext(arg0, arg1)
{
    var fname = arg0;
    var loadTex = arg1;
    var mBuff = [];
    var texPack = [];
    var folderName = "Zip";
    directory_destroy(folderName);
    directory_create(folderName);
    var unzipSuccessful = zip_unzip(fname, game_save_id + folderName + "\\");
    
    if (unzipSuccessful <= 0)
    {
        show_message("ERROR in script mbuff_load_zip_ext: Could not unzip file " + string(fname));
        return false;
    }
    
    var stack = ds_stack_create();
    var fileList = ds_list_create();
    var source = folderName;
    var p = -1;
    
    while (true)
    {
        if (++p == 0)
        {
            fname = file_find_first(source + "/*.*", 16);
            
            while (fname != "")
            {
                ds_list_add(fileList, fname);
                fname = file_find_next();
            }
            
            file_find_close();
            show_debug_message("Script mbuff_load_zip_ext: Folder " + source + " contains " + string(ds_list_size(fileList)) + " files.");
        }
        
        var n = ds_list_size(fileList);
        var i;
        
        for (i = p; i < n; i++)
        {
            fname = ds_list_find_value(fileList, i);
            var filepath = source + "\\" + fname;
            
            if (directory_exists(filepath))
            {
                ds_stack_push(stack, fileList, source, i);
                fileList = ds_list_create();
                source = filepath;
                p = -1;
                break;
            }
            else
            {
                show_debug_message("Script mbuff_load_zip_ext: Attempting to load file " + fname);
                
                switch (string_lower(filename_ext(fname)))
                {
                    case ".obj":
                        var ind = array_length(mBuff);
                        var buff = buffer_load(filepath);
                        var obj = mbuff_load_obj_from_buffer(buff, true);
                        buffer_delete(buff);
                        mBuff = mbuff_add(mBuff, obj[0]);
                        
                        if (loadTex && array_length(obj[1]) > 0)
                            array_copy(texPack, ind, obj[1], 0, array_length(obj[1]));
                        
                        break;
                    
                    case ".smf":
                        break;
                }
            }
        }
        
        if (i < n)
            continue;
        
        ds_list_destroy(fileList);
        
        if (ds_stack_empty(stack))
            break;
        
        p = ds_stack_pop(stack);
        source = ds_stack_pop(stack);
        fileList = ds_stack_pop(stack);
    }
    
    directory_destroy(folderName);
    ds_stack_destroy(stack);
    return [mBuff, texPack];
}
