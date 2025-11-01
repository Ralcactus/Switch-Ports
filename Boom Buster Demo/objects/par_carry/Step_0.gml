if (exit_freeze())
    exit;

anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;

if (wings)
{
    wings_sin = sin(time) * 3;
    time += 0.2;
    wing_ind += 0.35;
    
    if (mypath == -4)
    {
        y = lerp(y, landY, 0.1);
        
        if (y <= (landY - 64))
            has_collision = false;
        else
            landed = true;
        
        exit;
    }
}

if (inPipe)
{
    if (!has_collision)
        x = lerp(x, inPipe.x + 128, 0.2);
    
    if (y >= (inPipe.y + 100))
        has_collision = true;
    
    x += hspd;
    y += vspd;
    
    if ((hspd > 0 && bbox_right > ((inPipe.boxX + 256 + hspd) - 28)) || (hspd < 0 && bbox_left < (inPipe.boxX + hspd + 28)))
        event_wall();
    
    if (vspd > 0 && y > (inPipe.boxY + 165 + vspd))
    {
        y = inPipe.boxY + 165;
        event_floor();
    }
    
    vspd += grav;
    exit;
}

if (throwable)
{
    timer_logic(1);
    
    if (!thrown)
        hspd = approach(hspd, 0, 0.5);
}

if (mypath != -4 && !on_path && y >= (landY + path_yoff))
{
    on_path = true;
    x = path_get_x(mypath, path_pos);
    y = path_get_y(mypath, path_pos);
}

path_follow();

if (landYobj != -4)
    landY = landYobj.y - 2;

if (y < landY)
    has_collision = false;
else
    landed = true;

if (landed && place_meeting(x, y + 1, obj_spike) && !tossed)
    vspd = -20;

if (ignore != -4)
{
    if (ds_list_size(ignore.list_carry) > 0 && ds_list_find_value(ignore.list_carry, 0).col != col)
    {
        ignore_timer = 0;
        ignore = -4;
    }
}

if (ignore_timer)
{
    ignore_timer--;
    
    if (ignore_timer == 0)
    {
        if (place_meeting(x, y, ignore))
            ignore_timer = 15;
        else
            ignore = -4;
    }
}

if (carried == -4)
{
    if (!place_meeting(x, y, obj_solid))
        has_gravity = true;
    
    physics_apply();
    hspd_bounce = approach(hspd_bounce, 0, 0.1);
    
    if (!throwable && inPipe == -4 && place_meeting(x, y, obj_pipe) && landed)
    {
        var _pipe = instance_place(x, y, obj_pipe);
        
        if (_pipe.col == col)
        {
            var _num;
            
            with (_pipe)
            {
                event_user(0);
                _num = array_length(boms);
                
                if (_num >= 12)
                    _num--;
                
                boms[_num] = {};
            }
            
            event_user(1);
            struct_set(_pipe.boms[_num], "x", x);
            struct_set(_pipe.boms[_num], "y", y);
            struct_set(_pipe.boms[_num], "hspd", irandom_range(2.5, 4) * choose(-1, 1));
            struct_set(_pipe.boms[_num], "vspd", 20);
            instance_destroy();
            exit;
        }
        
        event_explode();
    }
}
else
{
    ignore = -4;
    ignore_timer = 0;
    hspd = 0;
    hspd_bounce = 0;
    vspd = 0;
}

if (vspd > 26)
    vspd = 26;

if (tossed)
    grav = 1.5;
