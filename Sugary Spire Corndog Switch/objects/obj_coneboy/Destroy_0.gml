if (ds_list_find_index(global.BaddieRoom, id) == -1 || importantEnemy)
{
    obj_tv.image_index = irandom_range(0, 4);
    
    repeat (3)
    {
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddieGibs);
    }
    
    instance_create(x, y + 30, obj_bangEffect);
    camera_shake_add(3, 3);
    
    with (instance_create(x, y, obj_baddieDead))
        sprite_index = other.baddieSpriteDead;
    
    event_play_oneshot("event:/SFX/enemies/kill");
    
    if (!importantEnemy)
    {
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
    }
    
    ds_list_add(global.BaddieRoom, id);
}
