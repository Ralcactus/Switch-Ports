if (DestroyedBy.object_index == obj_parent_player || DestroyedBy.object_index == obj_player1 || DestroyedBy.object_index == obj_player2)
{
    with (DestroyedBy)
    {
        if (state == UnknownEnum.Value_69 || state == UnknownEnum.Value_70)
        {
            event_play_oneshot("event:/SFX/player/groundpound", x, y);
            image_index = 0;
            state = UnknownEnum.Value_70;
            jumpAnim = true;
            jumpStop = false;
            
            with (obj_parent_baddie)
            {
                if (bbox_in_camera(id, view_camera[0]) && grounded)
                {
                    vsp = -7;
                    hsp = 0;
                }
            }
            
            camera_shake_add(10, 30);
            combo = 0;
            instance_create(x, y, obj_landcloud);
            freefallstart = 0;
            image_index = 0;
            
            if (sprite_index == spr_bodyslamfall)
                sprite_index = spr_bodyslamland;
            else
                sprite_index = spr_player_donutSlam_land;
        }
        else if (state == UnknownEnum.Value_33)
        {
            sprite_index = spr_piledriverland;
            event_play_oneshot("event:/SFX/player/groundpound", x, y);
            jumpAnim = true;
            jumpStop = false;
            image_index = 0;
            camera_shake_add(20, 40);
            hsp = 0;
            
            with (instance_create(x, y + 35, obj_bangEffect))
                xscale = obj_parent_player.xscale;
            
            instance_create(x, y, obj_landcloud);
            freefallstart = 0;
            
            with (obj_parent_baddie)
            {
                if (bbox_in_camera(id, view_camera[0]) && grounded)
                {
                    image_index = 0;
                    vsp = -7;
                    hsp = 0;
                }
            }
            
            scr_piledriverEnd(baddieGrabbedID);
        }
    }
}

instance_destroy();
