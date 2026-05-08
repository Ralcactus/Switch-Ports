var world_value = 0;
route = 2;

if (file_exists("Save.sav"))
{
    ini_open("Save.sav");
    global.current_room_overworld = ini_read_string("Save1", "room", "rm_ruins00");
    global.menu_sprite = asset_get_index(ini_read_string("Save1", "Menu", "bg_ruins02"));
    route = ini_read_real("Route", "00", 2);
    world_value = scr_determine_world_value_yellow();
    ini_close();
}

mus = mus_menu_ruins;

switch (world_value)
{
    case 0:
    case 5:
        mus = mus_menu_ruins;
        break;
    
    case 1:
        mus = mus_menu_darkruins;
        break;
    
    case 2:
        mus = mus_menu_snowdin;
        break;
    
    case 3:
        mus = mus_menu_wild_east;
        break;
    
    case 4:
        mus = mus_menu_steamworks;
        break;
}

if (route != 3)
    audio_play_sound(mus, 20, 1);

p[3] = false;
p[2] = false;
p[1] = true;
sh = 0.5;
waiter = 0;
