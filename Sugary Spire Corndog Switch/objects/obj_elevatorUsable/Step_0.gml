with (obj_parent_player)
{
    if (place_meeting(x, y, other.id) && !instance_exists(obj_fadeoutTransition) && key_up && grounded && !instance_exists(obj_cutsceneManager) && (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_59 || state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65) && state != UnknownEnum.Value_72 && state != UnknownEnum.Value_56 && state != UnknownEnum.Value_57 && state != UnknownEnum.Value_110)
    {
        obj_camera.chargeCameraX = 0;
        targetRoom = mineshaft_elevator;
        targetDoor = other.targetDoor;
        
        if (ds_list_find_index(global.SaveRoom, other.id) == -1)
            ds_list_add(global.SaveRoom, other.id);
        
        with (other)
        {
            var _cutscene = cutscene_create([cutscene_elevator_prestart, cutscene_elevator_start, cutscene_elevator_premiddle, cutscene_elevator_middle, cutscene_elevator_preend, cutscene_elevator_end]);
            cutscene_declare_actor(id, "ELEVATOR");
        }
    }
}

y += vsp;
