function scr_get_glyph(arg0)
{
    var _keyboard = input_source_using(__input_global().__source_keyboard);
    
    switch (arg0)
    {
        case spr_glyph_gp_cross:
            if (_keyboard)
                return spr_glyph_kb_z;
            else
                return spr_glyph_gp_cross;
            
            break;
        
        case spr_glyph_gp_circle:
            if (_keyboard)
                return spr_glyph_kb_x;
            else
                return spr_glyph_gp_circle;
            
            break;
        
        case spr_glyph_gp_triangle:
            if (_keyboard)
                return spr_glyph_kb_c;
            else
                return spr_glyph_gp_triangle;
            
            break;
        
        case spr_glyph_gp_square:
            if (_keyboard)
                return spr_glyph_kb_x;
            else
                return spr_glyph_gp_square;
            
            break;
    }
}
