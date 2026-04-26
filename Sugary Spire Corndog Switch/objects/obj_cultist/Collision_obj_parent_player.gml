if (pray_delay == 0)
{
    with (other)
    {
        if (!is_undefined(scr_transformationCheck(state)))
        {
            event_play_oneshot("event:/SFX/general/cultist");
            state = UnknownEnum.Value_1;
            other.sprite_index = spr_cultist_pray;
            other.pray_delay = 3;
            
            if (key_attack)
            {
                if (abs(movespeed < 10))
                    movespeed = 10;
                else
                    movespeed = abs(movespeed);
                
                state = UnknownEnum.Value_64;
            }
            
            sprite_index = spr_idle;
            instance_create(x, y, obj_poofeffect);
            image_index = 0;
            
            if (other.canCollect && ds_list_find_index(global.SaveRoom, id) == -1)
            {
                ds_list_add(global.SaveRoom, id);
                
                if (!instance_exists(obj_devilboy))
                    instance_create(x, y, obj_devilboy);
                
                for (var i = 0; i < 500; i += 25)
                    create_collect_effect(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), undefined, 25);
                
                global.Collect += 500;
                global.ComboTime = 60;
                other.canCollect = false;
            }
        }
    }
}
