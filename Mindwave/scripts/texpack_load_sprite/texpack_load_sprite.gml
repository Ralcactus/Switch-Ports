function texpack_load_sprite(arg0)
{
    var fname = arg0;
    var spr = -1;
    var ext = string_lower(filename_ext(fname));
    
    switch (ext)
    {
        case ".jpg":
        case ".jpeg":
        case ".gif":
        case ".png":
            spr = sprite_add(fname, 0, 0, 0, 0, 0);
            break;
        
        case ".bmp":
            spr = _load_bmp(fname);
            break;
    }
    
    if (spr < 0)
    {
        show_debug_message("ERROR in script texpack_load_sprite: Could not load sprite " + filename_name(fname));
        return -1;
    }
    
    ds_map_set(global.TexMapExternalSprite, spr, true);
    return spr;
}
