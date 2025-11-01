function scr_swap_chars()
{
    var _obj = obj_map_player_follower;
    
    if (global.follower)
    {
        var _distance = point_distance(x, y + z, _obj.x, _obj.y + _obj.z);
        
        if (!global.cutscene_swap && grounded && _obj.grounded && _distance >= 40 && input_check_pressed("swap"))
        {
            global.cutscene_swap = true;
            hspd = 0;
            vspd = 0;
            swap_xstart = x;
            swap_ystart = y;
            swap_zstart = z;
            swap_x = x;
            swap_y = y;
            swap_z = z;
            xto = _obj.x;
            yto = _obj.y;
            zto = _obj.z;
            
            with (_obj)
            {
                swap_x = x;
                swap_y = y;
                swap_z = z;
                xto = other.x;
                yto = other.y;
                zto = other.z;
                swap_xstart = x;
                swap_ystart = y;
                swap_zstart = z;
            }
        }
        
        if (global.cutscene_swap)
        {
            swap_x = use_curve(acurv_linear, global.cutscene_swap_percent, undefined, swap_xstart, xto);
            swap_y = use_curve(acurv_linear, global.cutscene_swap_percent, undefined, swap_ystart, yto);
            swap_z = use_curve(acurv_linear, global.cutscene_swap_percent, undefined, swap_zstart, zto);
            
            with (_obj)
            {
                swap_x = use_curve(acurv_linear, global.cutscene_swap_percent, undefined, swap_xstart, xto);
                swap_y = use_curve(acurv_linear, global.cutscene_swap_percent, undefined, swap_ystart, yto);
                swap_z = use_curve(acurv_linear, global.cutscene_swap_percent, undefined, swap_zstart, zto);
            }
            
            exit;
        }
    }
}
