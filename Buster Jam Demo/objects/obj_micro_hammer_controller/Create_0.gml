event_inherited();
alarm[0] = 1;
enemy_times = [90, 90, 70, 70, 90, 90];
enemy_facing = [-1, -1, -1, 1, 1, 1];
enemy_times = array_shuffle(enemy_times);
enemy_facing = array_shuffle(enemy_facing);
timer[0] = 90;

timer_func[0] = function()
{
    var _inst = instance_create_micro(0, 850, "Over", obj_micro_hammer_enemy);
    _inst.facing = enemy_facing[0];
    
    with (_inst)
    {
        if (facing == 1)
            x = 105;
        else
            x = controller.game_width - 105;
        
        hspd = walkspd * facing;
    }
    
    array_delete(enemy_times, 0, 1);
    array_delete(enemy_facing, 0, 1);
    
    if (array_length(enemy_times) > 0)
        timer[0] = enemy_times[0];
};
