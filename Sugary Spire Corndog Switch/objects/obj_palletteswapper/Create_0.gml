drawing = false;
palettename = "NULL";
bgblend = 0;
textblend = 0;
fally = -540;
image_speed = 0.35;
palsel = spr_pizzelleselectpal;
curchar = 0;

if (obj_parent_player.character == UnknownEnum.Value_1)
    curchar = 1;
else if (obj_parent_player.character == UnknownEnum.Value_3)
    curchar = 2;

palnames[0] = ["NONE", "DEFAULT", "SUGAR", "FAMILIAR GREMLIN", "MASSACRE", "RIVALS", "GUM", "OLD SCHOOL", "ZOMBIFIED", "FORESTATION", "LAMDA", "GOLDEN", "GNOME WIZARD"];
palnames[1] = ["NONE", "DEFAULT", "FAMILIAR GREMLIN", "FAMILIAR CHEF", "LASAGNA", "SPICE", "PLUMBER", "GREEN APPLE", "GRAPE SODA", "ANTIPATHIC", "GUMMY BEAR", "LIME"];
palnames[2] = ["NONE", "DEFAULT", "FAMILIAR SLIME", "RAGE", "RAT", "RETRO", "CLOUDY DAY", "SADNESS"];
