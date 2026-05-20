function saveGame()
{
    if (file_exists("Save.sav"))
        file_delete("Save.sav");
    
    ini_open("Save.sav");
    ini_write_real("SAVE_INFO", "Info_0", oP.Win_P);
    ini_write_real("SAVE_INFO", "Info_1", oP.Win_G);
    ini_write_real("SAVE_INFO", "Info_2", oP.setP);
    ini_write_real("SAVE_INFO", "Info_3", oP.setG);
    ini_write_real("SAVE_INFO", "Info_4", oP.Win_NoHit);
    ini_close();
}

function loadGame()
{
    if (file_exists("Save.sav"))
    {
        ini_open("Save.sav");
        oP.Win_P = ini_read_string("SAVE_INFO", "Info_0", 0);
        oP.Win_G = ini_read_string("SAVE_INFO", "Info_1", 0);
        oP.setP = ini_read_string("SAVE_INFO", "Info_2", 0);
        oP.setG = ini_read_string("SAVE_INFO", "Info_3", 0);
        oP.Win_NoHit = ini_read_string("SAVE_INFO", "Info_4", 0);
        ini_close();
    }
}

function deleteSave()
{
    if (file_exists("Save.sav"))
        file_delete("Save.sav");
}
