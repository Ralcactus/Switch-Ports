if (other.state != UnknownEnum.Value_110 && sprite_index == spr_lappingportal_idle && global.panic)
{
    with (other)
    {
        x = other.x;
        y = other.y;
        targetDoor = other.targetDoor;
        targetRoom = other.targetRoom;
        image_index = 0;
        sprite_index = spr_lappingportal_enter;
    }
    
    global.ComboFreeze = 50;
    global.ComboTime = 60;
    ini_open("saveData.ini");
    var ranks = ini_read_string("Ranks", string(global.levelname), "none");
    ini_close();
    
    if (ranks != "p")
        ds_list_add(global.SaveRoom, id);
    
    cutscene_create([cutscene_lapPortal_start, cutscene_lapPortal_middle, cutscene_lapPortal_end]);
    instance_destroy();
}
