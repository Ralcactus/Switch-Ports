function scr_confecti_normal()
{
    if (sprite_index != spr_appear)
    {
        if (obj_parent_player.hsp != 0)
        {
            if (global.panic == 0)
                sprite_index = spr_run;
            else
                sprite_index = spr_runpanic;
        }
        else if (global.panic == 0)
        {
            sprite_index = spr_idle;
        }
        else
        {
            sprite_index = spr_panic;
        }
    }
    
    if (obj_parent_player.hsp == 0 && obj_parent_player.state != UnknownEnum.Value_72 && obj_parent_player.grounded && image_xscale == obj_parent_player.xscale)
    {
        if (magnitude < 32 && (scr_solid(x - distance, bbox_bottom + 1) || (!place_meeting(x, y, obj_platform) && place_meeting(x, bbox_bottom + 1, obj_platform))) && !scr_solid(x - image_xscale, y))
            magnitude += 0.5;
    }
    else if (magnitude > 0)
    {
        magnitude -= 0.5;
    }
    
    distance = image_xscale * magnitude;
    var leader = -4;
    leader = !ds_list_find_index(global.FollowerList, id) ? obj_parent_player : ds_list_find_value(global.FollowerList, floor(ds_list_find_index(global.FollowerList, id) - 1));
    
    if (!instance_exists(leader))
        leader = obj_parent_player;
    
    if (instance_exists(leader))
    {
        ds_queue_enqueue(followQueue, leader.x);
        ds_queue_enqueue(followQueue, leader.y);
    }
    
    LAG_STEPS = 10;
    
    if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
    {
        targetx = ds_queue_dequeue(followQueue) - distance;
        targety = ds_queue_dequeue(followQueue);
    }
    
    if (image_xscale != obj_parent_player.xscale)
    {
        if (magnitude <= 0)
            image_xscale = obj_parent_player.xscale;
        else
            magnitude -= 0.5;
    }
    
    if (obj_parent_player.x != x)
        drawxscale = -sign(x - obj_parent_player.x);
    
    x = targetx;
    y = targety;
    
    if (obj_parent_player.state == UnknownEnum.Value_42 && obj_parent_player.sprite_index == obj_parent_player.spr_taunt && state != UnknownEnum.Value_1)
    {
        instance_create(x, y, obj_confectitaunt);
        state = UnknownEnum.Value_1;
        image_index = choose(0, 1);
    }
}
