if (DestroyedBy.object_index == obj_parent_player || DestroyedBy.object_index == obj_player1 || DestroyedBy.object_index == obj_player2)
{
    if ((place_meeting(x, y - DestroyedBy.vsp, DestroyedBy) || place_meeting(x, y - sign(DestroyedBy.vsp), DestroyedBy)) && DestroyedBy.vsp < 0 && DestroyedBy.state == UnknownEnum.Value_55)
    {
        DestroyedBy.vsp = 0;
        instance_destroy();
    }
    else if (place_meeting(x - DestroyedBy.hsp, y, DestroyedBy) && DestroyedBy.state == UnknownEnum.Value_16)
    {
        with (DestroyedBy)
        {
            with (other.id)
                instance_destroy();
            
            hsp = xscale * -4;
            vsp = -4;
            machTwo = 0;
            image_index = 0;
            
            if (state == UnknownEnum.Value_63)
                sprite_index = spr_canehit;
            else
                sprite_index = choose(spr_player_PZ_blockbreak_1, spr_player_PZ_blockbreak_2, spr_player_PZ_blockbreak_3, spr_player_PZ_blockbreak_4, spr_player_PZ_blockbreak_5, spr_player_PZ_blockbreak_6, spr_player_PZ_blockbreak_7);
            
            state = UnknownEnum.Value_52;
        }
    }
    else
    {
        with (DestroyedBy)
        {
            if (freeFallSmash < 10)
            {
                if (state == UnknownEnum.Value_69 || state == UnknownEnum.Value_70)
                {
                    state = UnknownEnum.Value_70;
                    sprite_index = spr_bodyslamland;
                    image_index = 0;
                    vsp = 0;
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
                    bounce = 0;
                    create_particle(x, y + 35, spr_bangEffect);
                    create_particle(x, y, spr_landcloud);
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
                    baddieGrabbedID = -4;
                }
            }
        }
        
        instance_destroy();
    }
}
else if (DestroyedBy.object_index == obj_donutShitted)
{
    if (!DestroyedBy.bigShot)
        instance_destroy(DestroyedBy);
    
    instance_destroy();
}
else
{
    instance_destroy();
}
