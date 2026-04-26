if (DestroyedBy.object_index == obj_parent_player || DestroyedBy.object_index == obj_player1 || DestroyedBy.object_index == obj_player2)
{
    if (place_meeting(x - DestroyedBy.hsp, y, DestroyedBy))
    {
        if (DestroyedBy.state == UnknownEnum.Value_63 || DestroyedBy.state == UnknownEnum.Value_64)
        {
            with (DestroyedBy)
            {
                with (other.id)
                {
                    if (hp < 1)
                    {
                        instance_destroy();
                    }
                    else
                    {
                        ShakeBuffer = 5;
                        hp -= 1;
                        instance_create(x, y, obj_bangEffect);
                        instance_create(x, y, obj_slapstar);
                        instance_create(x, y, obj_baddieGibs);
                        camera_shake_add(3, 3);
                    }
                }
                
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
        else if (DestroyedBy.state == UnknownEnum.Value_16)
        {
            instance_destroy();
        }
        else
        {
            instance_destroy();
        }
    }
}
else
{
    instance_destroy();
}
