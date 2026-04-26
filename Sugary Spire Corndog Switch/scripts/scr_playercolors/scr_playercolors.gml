function scr_playercolors()
{
    switch (character)
    {
        case UnknownEnum.Value_0:
            characters = "Pizzelle";
            colorHeight = 11;
            break;
        
        case UnknownEnum.Value_1:
            characters = "Pizzano";
            colorHeight = 10;
            break;
        
        case UnknownEnum.Value_3:
            characters = "Gumbob";
            colorHeight = 7;
            break;
        
        case UnknownEnum.Value_4:
            characters = "Coneboy";
            colorHeight = 7;
            break;
        
        default:
            characters = "BF";
            colorHeight = 0;
            break;
    }
    
    colorindex[0] = 0;
    colorindex[1] = 1;
    colorindex[2] = 2;
    colorindex[3] = 3;
    colorindex[4] = 4;
    colorindex[5] = 5;
    colorindex[6] = 6;
    colorindex[7] = 7;
    colorindex[8] = 8;
    colorindex[9] = 9;
    colorindex[10] = 10;
    ini_open("Custom/" + string(characters) + "_" + string(customSavedPalette) + "_palettes.ini");
    
    if (!ini_section_exists(string(characters) + "Colors" + string(colorindex[0])))
    {
        ini_write_real(string(characters) + "Colors" + string(colorindex[0]), "Red", 0);
        ini_write_real(string(characters) + "Colors" + string(colorindex[0]), "Green", 0);
        ini_write_real(string(characters) + "Colors" + string(colorindex[0]), "Blue", 0);
    }
    
    for (var i = 1; i < colorHeight; i++)
    {
        if (!ini_section_exists(string(characters) + "Colors" + string(colorindex[i])))
        {
            ini_write_real(string(characters) + "Colors" + string(colorindex[i]), "Red", 255);
            ini_write_real(string(characters) + "Colors" + string(colorindex[i]), "Green", 255);
            ini_write_real(string(characters) + "Colors" + string(colorindex[i]), "Blue", 255);
        }
    }
    
    ini_open("Custom/" + string(characters) + "_" + string(customSavedPalette) + "_palettes.ini");
    
    for (var i = 0; i < colorHeight; i++)
    {
        colored[colorindex[i]][0] = ini_read_real(string(characters) + "Colors" + string(colorindex[i]), "Red", 0);
        colored[colorindex[i]][1] = ini_read_real(string(characters) + "Colors" + string(colorindex[i]), "Green", 0);
        colored[colorindex[i]][2] = ini_read_real(string(characters) + "Colors" + string(colorindex[i]), "Blue", 0);
    }
    
    ini_close();
    
    for (var i = 0; i < colorHeight; i++)
        color[i] = make_color_rgb(colored[i][0], colored[i][1], colored[i][2]);
}
