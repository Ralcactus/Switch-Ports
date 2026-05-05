if (ds_list_find_index(global.BaddieRoom, id) == -1 || importantEnemy)
{
    obj_tv.image_index = irandom_range(0, 4);
    
    repeat (3)
    {
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddieGibs);
    }
    
    create_particle(x, y + 30, spr_bangEffect);
    camera_shake_add(10, 30);
    
    if (debris)
    {
        with (instance_create(x, y, obj_baddieDead))
        {
            sprite_index = other.baddieSpriteDead;
            paletteSprite = other.paletteSprite;
            paletteSelect = other.paletteSelect;
        }
        
        if (random_range(0, 100) > 95)
            event_play_oneshot("event:/SFX/enemies/deathscream", x, y);
        
        event_play_oneshot("event:/SFX/enemies/kill");
    }
    
    if (thiefKeyInv == 1)
        instance_create(x, y, obj_spookey);
    
    if (!importantEnemy)
    {
        obj_parent_player.superTauntBuffer++;
        global.Combo++;
        
        switch (global.Combo)
        {
            case 0:
            case 1:
                create_small_number(x, y, "10");
                global.Collect += 10;
                break;
            
            case 2:
                create_small_number(x, y, "20");
                global.Collect += 20;
                break;
            
            case 3:
                create_small_number(x, y, "40");
                global.Collect += 40;
                break;
            
            default:
                create_small_number(x, y, "80");
                global.Collect += 80;
                break;
        }
        
        global.ComboTime = 60;
        global.style += 4;
        global.ComboFreeze = 30;
    }
    
    ini_open("saveData.ini");
    var obj = object_get_name(object_index);
    var checkkills = ini_read_real("Kills", obj, 0);
    ini_write_real("Kills", obj, checkkills + 1);
    ini_close_os();
    ds_list_add(global.BaddieRoom, id);
}
