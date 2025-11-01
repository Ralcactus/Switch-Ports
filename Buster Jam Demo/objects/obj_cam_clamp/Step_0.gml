if (!instance_exists(obj_map_cam) && !ready)
    exit;

with (obj_map_player)
{
    var _mask = mask_index;
    mask_index = spr_map_player_mask_point;
    
    if (instance_place_3d(x, y, z, other))
    {
        with (other)
        {
            for (var i = 0; i < 4; i++)
            {
                if (myclamp[i] != undefined)
                {
                    obj_map_cam.myclamp[i] = myclamp[i];
                    obj_map_cam.myclamp_to[i] = myclamp[i];
                }
                
                if (myclamp_to[i] != undefined)
                {
                    obj_map_cam.myclamp_to[i] = myclamp_to[i];
                    get_cams(0);
                    
                    if (!touching)
                    {
                        if (i == 0 || i == 1)
                            obj_map_cam.myclamp[i] = clamp(obj_map_cam.myclamp[i], camy, camy + 1080);
                        else
                            obj_map_cam.myclamp[i] = clamp(obj_map_cam.myclamp[i], camx, camx + 1920);
                        
                        obj_map_cam.myclamp_dir[i] = myclamp_dir[i];
                        
                        if (myclamp_start[i])
                            obj_map_cam.myclamp[i] = myclamp_to[i];
                    }
                }
            }
            
            image_blend = c_red;
            touching = true;
        }
    }
    else
    {
        other.touching = false;
        other.image_blend = c_white;
    }
    
    mask_index = _mask;
}
