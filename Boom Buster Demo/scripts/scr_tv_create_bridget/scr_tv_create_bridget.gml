function scr_tv_create_bridget()
{
    if (bridget_state == bridget_state_dig)
        bridget_sprite = spr_tv_bridget_dig;
    
    bridget_sub = 0;
    bridget_timer = 0;
    bridget_item = 0;
    bridget_itemspd = 1;
    bridget_set_finishtimer = false;
    
    bridget_toss = function()
    {
        bridget_state = bridget_state_toss;
        bridget_sub = 0;
        bridget_sprite = bridget_get("toss");
        var _path, _path_pos;
        
        if (struct_exists(bridget_element, "mypath"))
        {
            _path = asset_get_index(bridget_element.mypath);
            _path_pos = bridget_element.path_pos;
        }
        else
        {
            _path = -4;
        }
        
        var _wings = struct_exists(bridget_element, "wings") && bridget_element.wings;
        var _drop = instance_create_layer(bridget_element.x, bridget_element.y, layer, obj_droptimer);
        _drop.ind = bridget_element.ind;
        
        if (_path != -4)
        {
            _drop.mypath = _path;
            _drop.path_pos = _path_pos;
        }
        
        if (bridget_element.row == 0)
            _drop.item = obj_bom;
        else
            _drop.item = obj_barrel;
        
        _drop.wings = _wings;
        
        if (struct_exists(bridget_element, "land_id"))
            _drop.landYobj = land_id_obj[bridget_element.land_id];
    };
    
    timer[timer_bridget] = -1;
    
    timer_func[timer_bridget] = function()
    {
        var _state = bridget_state;
        
        if (_state == bridget_state_react)
        {
            bridget_state = bridget_state_wind;
            bridget_sub = 0;
            bridget_sprite = bridget_get("wind");
            
            if (bridget_itemspd == 1)
                timer[timer_bridget] = 48;
            else if (bridget_itemspd == 0)
                timer[timer_bridget] = 78;
        }
        else if (_state == bridget_state_wind)
        {
            bridget_toss();
        }
    };
    
    timer[timer_bridget_finish] = -1;
    
    timer_func[timer_bridget_finish] = function()
    {
        bridget_state = bridget_state_done;
        bridget_sub = 0;
        bridget_sprite = spr_tv_bridget_done;
    };
    
    bridget_animend = function()
    {
        var _state = bridget_state;
        
        if (_state == bridget_state_pull && bridget_sprite == spr_tv_bridget_pull_barrel)
        {
            bridget_state = bridget_state_wind;
            timer[timer_bridget] = 48;
            bridget_sub = 0;
            bridget_sprite = spr_tv_bridget_wind_barrel;
        }
        else if (_state == bridget_state_pull)
        {
            if (bridget_itemspd == 2)
            {
                bridget_toss();
            }
            else
            {
                bridget_state = bridget_state_react;
                bridget_sub = 0;
                bridget_sprite = bridget_get("react");
                
                if (bridget_itemspd == 1)
                    timer[timer_bridget] = 30;
                else if (bridget_itemspd == 0)
                    timer[timer_bridget] = 60;
            }
        }
        else if (_state == bridget_state_wind)
        {
            if (bridget_sprite == spr_tv_bridget_wind_purple)
                bridget_sub = 6;
            else if (bridget_sprite == spr_tv_bridget_wind_barrel)
                bridget_sub = 0;
            else
                bridget_sub = 3;
        }
        else if (_state == bridget_state_toss)
        {
            bridget_state = bridget_state_dig;
            bridget_sub = 0;
            bridget_sprite = spr_tv_bridget_dig;
        }
        else if (_state == bridget_state_done)
        {
            var _spr = bridget_sprite;
            
            if (_spr == spr_tv_bridget_done)
            {
                bridget_sub = 0;
                bridget_sprite = spr_tv_bridget_done1;
            }
            else if (_spr == spr_tv_bridget_done1)
            {
                bridget_sub = 8;
            }
        }
    };
}
