if (global.panic && room != sucrose_1)
{
    with (obj_parent_player)
    {
        if (grounded && (!other.drop || other.drop_state == 1) && key_up && (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_63 || state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_59))
        {
            targetDoor = "none";
            scr_savelevelDetails();
            obj_tv.tvsprite = spr_tvoff;
            
            if (state != UnknownEnum.Value_72)
            {
                sprite_index = spr_lookdoor;
                state = UnknownEnum.Value_72;
                image_index = 0;
            }
            
            if (!instance_exists(obj_endlevelfade))
            {
                with (instance_create(x, y, obj_endlevelfade))
                {
                    var _cam_x = camera_get_view_x(view_camera[0]);
                    var _cam_y = camera_get_view_y(view_camera[0]);
                    PlayerX = other.x - _cam_x;
                    PlayerY = other.y - _cam_y;
                }
            }
            
            global.panic = false;
            global.lapmusic = false;
        }
    }
}
