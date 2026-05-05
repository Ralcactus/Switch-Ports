if (other.key_up2 && !instance_exists(obj_palettechanger))
{
    _player = other.id;
    var _players = _player;
    
    with (instance_create(room_width / 2, room_height / 2, obj_palettechanger))
    {
        global.colorchoosen = 0;
        global.oldcolorchoosen = 0;
        player = other._player;
        
        for (i = 0; i < player.colorHeight; i++)
            color[i] = player.color[i];
        
        ini_open("Custom/" + string(_players.characters) + "_" + string(_players.customSavedPalette) + "_palettes.ini");
        palettename = ini_read_string("General", "PaletteName", "Palette 1");
        ini_close_os();
        input = palettename;
        var i = 0;
        
        repeat (3)
        {
            with (instance_create(x, y, obj_palettechangerscrollbar))
            {
                colorchannel = i;
                other.slider[colorchannel] = id;
                readcolor = true;
                ini_open("Custom/" + string(_players.characters) + "_" + string(_players.customSavedPalette) + "_palettes.ini");
                
                switch (colorchannel)
                {
                    case 0:
                        colorvalue = ini_read_real(string(_players.characters) + "Colors" + string(global.colorchoosen), "Red", 0) / 255;
                        break;
                    
                    case 1:
                        colorvalue = ini_read_real(string(_players.characters) + "Colors" + string(global.colorchoosen), "Green", 0) / 255;
                        break;
                    
                    case 2:
                        colorvalue = ini_read_real(string(_players.characters) + "Colors" + string(global.colorchoosen), "Blue", 0) / 255;
                        break;
                }
                
                ini_close_os();
                input = string(round(colorvalue * 255));
                keyboard_string = string(round(colorvalue * 255));
            }
            
            i++;
        }
    }
    
    other.vsp = 20;
    other.state = UnknownEnum.Value_112;
    other.visible = false;
    var _depth = other.depth - 0.5;
    other.paletteSelect = sprite_get_width(other.paletteSprite) - 1;
    
    with (instance_create(other.x + random_range(-5, 5), other.y + random_range(-5, 5), obj_bangEffect))
    {
        depth = _depth;
        image_speed = 0.35;
        sprite_index = spr_poofeffect;
        image_angle = choose(0, 90, 180, 270);
    }
}
