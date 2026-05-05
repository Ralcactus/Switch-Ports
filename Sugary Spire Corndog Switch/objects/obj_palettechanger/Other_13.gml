ini_open("Custom/" + string(player.characters) + "_" + string(player.customSavedPalette) + "_palettes.ini");
ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Red", slider[0].finalvalue);
ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Green", slider[1].finalvalue);
ini_write_real(string(player.characters) + "Colors" + string(global.colorchoosen), "Blue", slider[2].finalvalue);
ini_close_os();
