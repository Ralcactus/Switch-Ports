global.instancelist = ds_list_create();

function check_and_destroy(arg0, arg1, arg2)
{
    if (!place_meeting(arg0, arg1, arg2) || arg2.object_index == obj_brimthwomp)
        exit;
    
    var _num = instance_place_list(arg0, arg1, arg2, global.instancelist, false);
    
    if (_num > 0)
    {
        for (var i = 0; i < ds_list_size(global.instancelist); i++)
        {
            with (ds_list_find_value(global.instancelist, i))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        ds_list_clear(global.instancelist);
    }
}

function scr_collide_destructibles()
{
    var side_to_side_states = [UnknownEnum.Value_64, UnknownEnum.Value_120, UnknownEnum.Value_119, UnknownEnum.Value_121, UnknownEnum.Value_53, UnknownEnum.Value_150, UnknownEnum.Value_152, UnknownEnum.Value_151, UnknownEnum.Value_36, UnknownEnum.Value_71, UnknownEnum.Value_133, UnknownEnum.Value_109, UnknownEnum.Value_65, UnknownEnum.Value_3, UnknownEnum.Value_145, UnknownEnum.Value_28, UnknownEnum.Value_97, UnknownEnum.Value_102, UnknownEnum.Value_17, UnknownEnum.Value_62, UnknownEnum.Value_88, UnknownEnum.Value_92, UnknownEnum.Value_94, UnknownEnum.Value_95, UnknownEnum.Value_104, UnknownEnum.Value_72, UnknownEnum.Value_57, UnknownEnum.Value_103, UnknownEnum.Value_100, UnknownEnum.Value_130, UnknownEnum.Value_105, UnknownEnum.Value_123, UnknownEnum.Value_124, UnknownEnum.Value_106, UnknownEnum.Value_78, UnknownEnum.Value_79, UnknownEnum.Value_108, UnknownEnum.Value_160];
    
    if (array_contains(side_to_side_states, state) || (state == UnknownEnum.Value_139 && substate == 0) || (state == UnknownEnum.Value_87 && sprite_index == spr_player_PZ_cotton_attack))
    {
        check_and_destroy(x + hsp, y, obj_destructibles);
        check_and_destroy(x + sign(hsp), y, obj_destructibles);
        check_and_destroy(x + xscale, y, obj_destructibles);
    }
    
    if ((state == UnknownEnum.Value_28 && sprite_index == spr_dive) || state == UnknownEnum.Value_160 || state == UnknownEnum.Value_109 || (state == UnknownEnum.Value_62 && vsp > 0))
    {
        check_and_destroy(x + hsp, y + vsp, obj_destructibles);
        check_and_destroy(x + sign(hsp), y + sign(vsp), obj_destructibles);
    }
    
    if (((state == UnknownEnum.Value_17 || state == UnknownEnum.Value_102 || state == UnknownEnum.Value_160 || state == UnknownEnum.Value_33 || state == UnknownEnum.Value_94) && vsp >= 0) || (state == UnknownEnum.Value_12 || state == UnknownEnum.Value_96 || state == UnknownEnum.Value_123 || (state == UnknownEnum.Value_139 && substate == 2) || state == UnknownEnum.Value_109) || ((state == UnknownEnum.Value_11 || state == UnknownEnum.Value_88) && vsp < 0))
    {
        check_and_destroy(x, y + vsp, obj_destructibles);
        check_and_destroy(x, y + sign(vsp), obj_destructibles);
        check_and_destroy(x, y + vsp + 2, obj_destructibles);
    }
    
    if (vsp >= 0 && (state == UnknownEnum.Value_94 || state == UnknownEnum.Value_122 || state == UnknownEnum.Value_152 || state == UnknownEnum.Value_33 || (state == UnknownEnum.Value_69 || state == UnknownEnum.Value_70)))
    {
        if (state == UnknownEnum.Value_94 || state == UnknownEnum.Value_122 || (state == UnknownEnum.Value_152 && sprite_index == spr_player_PZ_frostburn_spin) || (state == UnknownEnum.Value_33 && freeFallSmash >= 10) || ((state == UnknownEnum.Value_69 || state == UnknownEnum.Value_70) && freeFallSmash >= 10))
        {
            check_and_destroy(x, y + vsp, obj_metalblock);
            check_and_destroy(x, y + sign(vsp), obj_metalblock);
            check_and_destroy(x, y + 1, obj_metalblock);
        }
        
        check_and_destroy(x, y + vsp, obj_destructibles);
        check_and_destroy(x, y + sign(vsp), obj_destructibles);
        check_and_destroy(x, y + vsp + 2, obj_destructibles);
    }
    
    if ((state == UnknownEnum.Value_55 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_123 || state == UnknownEnum.Value_124) && vsp < 0)
        check_and_destroy(x, y - 1, obj_destructibles);
    
    if (state == UnknownEnum.Value_16)
    {
        with (obj_destroyable3_hard)
        {
            if (place_meeting(x - other.hsp, y, other))
            {
                with (other)
                {
                    hsp = -xscale * 4;
                    vsp = -4;
                    machTwo = 0;
                    image_index = 0;
                    sprite_index = choose(spr_player_PZ_blockbreak_1, spr_player_PZ_blockbreak_2, spr_player_PZ_blockbreak_3, spr_player_PZ_blockbreak_4, spr_player_PZ_blockbreak_5, spr_player_PZ_blockbreak_6, spr_player_PZ_blockbreak_7);
                    state = UnknownEnum.Value_52;
                }
                
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        with (obj_destructibles)
        {
            if (place_meeting(x - obj_parent_player.hsp, y, obj_parent_player))
            {
                var _player = instance_nearest(x, y, obj_parent_player);
                DestroyedBy = _player;
                event_user(0);
            }
        }
    }
    
    with (obj_train)
    {
        if (place_meeting(x + hsp, y, obj_destructibles))
        {
            with (instance_place(x + hsp, y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x + sign(hsp), y, obj_destructibles))
        {
            with (instance_place(x + sign(hsp), y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    with (obj_minedummycart)
    {
        if (place_meeting(x + hsp, y + vsp, obj_destructibles))
        {
            with (instance_place(x + hsp, y + vsp, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles))
        {
            with (instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x + hsp, y, obj_destructibles))
        {
            with (instance_place(x + hsp, y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x + sign(hsp), y, obj_destructibles))
        {
            with (instance_place(x + sign(hsp), y, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x, y + vsp, obj_destructibles))
        {
            with (instance_place(x, y + vsp, obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
        
        if (place_meeting(x, y + sign(vsp), obj_destructibles))
        {
            with (instance_place(x, y + sign(vsp), obj_destructibles))
            {
                DestroyedBy = other.id;
                event_user(0);
            }
        }
    }
    
    if (state == UnknownEnum.Value_66 || state == UnknownEnum.Value_11 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_145)
        check_and_destroy(x + sign(hsp), y + sign(vsp), obj_parent_clutterDestroyable);
    
    if (state == UnknownEnum.Value_55 || state == UnknownEnum.Value_1)
    {
        check_and_destroy(x, y + 1, obj_parent_clutterDestroyable);
        check_and_destroy(x, y + vsp, obj_parent_clutterDestroyable);
        check_and_destroy(x, y + sign(vsp), obj_parent_clutterDestroyable);
    }
}

function scr_baddie_collide_destroyables()
{
    if (state == UnknownEnum.Value_5)
    {
        check_and_destroy(x + hsp, y + vsp, obj_destructibles);
        check_and_destroy(x + sign(hsp), y + sign(vsp), obj_destructibles);
    }
}
