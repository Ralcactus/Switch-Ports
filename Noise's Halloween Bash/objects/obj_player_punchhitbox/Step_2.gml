event_inherited();

if (obj_player.state != states.hitstun)
{
    if (obj_player.sprite_index == spr_player_uppunch || obj_player.sprite_index == spr_player_upairpunch)
        sprite_index = spr_player_uppunchhitbox;
    else
        sprite_index = spr_player_punchhitbox;
    
    if (obj_player.state != states.punch || (obj_player.state == states.punch && obj_player.image_index <= 3))
        instance_destroy();
    else
    {
        var _num = instance_place_list(x, y, [par_enemy, par_destructible, obj_destroyablenitro, obj_destroyablecheckpoint, obj_destroyableflame, obj_destroyabletnt, obj_destroyableswitchcrate], global.instancelist, true);
        
        for (var _i = 0; _i < _num; _i++)
        {
            with (global.instancelist[| _i])
                event_user(15);
        }
        
        ds_list_clear(global.instancelist);
    }
}
