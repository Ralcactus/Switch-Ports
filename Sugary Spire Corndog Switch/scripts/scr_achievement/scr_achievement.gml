function scr_hatScript()
{
    ini_open("saveData.ini");
    var entryway = ini_read_string("Ranks", "entryway", "none");
    var steamy = ini_read_string("Ranks", "steamy", "none");
    var molasses = ini_read_string("Ranks", "molasses", "none");
    var mines = ini_read_string("Ranks", "mines", "none");
    
    if (ini_read_real("HatsUnlock", "Entryway", false) == false && entryway == "s")
        ini_write_real("HatsUnlock", "Entryway", true);
    
    if (ini_read_real("HatsUnlock", "Cottontown", false) == false && steamy == "s")
        ini_write_real("HatsUnlock", "Cottontown", true);
    
    if (ini_read_real("HatsUnlock", "Molasses", false) == false && molasses == "s")
        ini_write_real("HatsUnlock", "Molasses", true);
    
    if (ini_read_real("HatsUnlock", "Mines", false) == false && mines == "s")
        ini_write_real("HatsUnlock", "Mines", true);
    
    if (ini_read_real("HatsUnlock", "World1", false) == false && (entryway != "none" && steamy != "none" && molasses != "none" && mines != "none"))
        ini_write_real("HatsUnlock", "World1", true);
    
    ini_close_os();
    ini_open("optionData.ini");
    
    if (ini_read_real("HatsUnlock", "Entryway", false) == false && entryway == "s")
        ini_write_real("HatsUnlock", "Entryway", true);
    
    if (ini_read_real("HatsUnlock", "Cottontown", false) == false && steamy == "s")
        ini_write_real("HatsUnlock", "Cottontown", true);
    
    if (ini_read_real("HatsUnlock", "Molasses", false) == false && molasses == "s")
        ini_write_real("HatsUnlock", "Molasses", true);
    
    if (ini_read_real("HatsUnlock", "Mines", false) == false && mines == "s")
        ini_write_real("HatsUnlock", "Mines", true);
    
    if (ini_read_real("HatsUnlock", "World1", false) == false && (entryway != "none" && steamy != "none" && molasses != "none" && mines != "none"))
        ini_write_real("HatsUnlock", "World1", true);
    
    ini_close_os();
}

function scr_normalAchievments()
{
    ini_open("optionData.ini");
    
    if (global.kungAirTime == 0 && kungAirTime >= 50)
        global.kungAirTime = 1;
    
    ini_close_os();
}
