switch (state)
{
    case UnknownEnum.Value_0:
        if (donutNumber < 5)
        {
            if (place_meeting(x, y, obj_parent_donut))
            {
                var _list = ds_list_create();
                var _num = instance_place_list(x, y, obj_parent_donut, _list, false);
                
                if (_num > 0)
                {
                    for (var i = 0; i < _num; i++)
                    {
                        with (ds_list_find_value(_list, i))
                        {
                            if (shattedBy != other.id)
                            {
                                instance_destroy();
                                
                                with (other.id)
                                {
                                    alarm[0] = rotateSpeed;
                                    image_index = 0;
                                    sprite_index = spr_donutShitterEating;
                                    donutNumber++;
                                }
                            }
                        }
                    }
                }
                
                ds_list_destroy(_list);
            }
        }
        
        if (sprite_index == spr_donutShitterEating && animation_end())
        {
            state = UnknownEnum.Value_1;
            image_index = 0;
            sprite_index = spr_donutShitterSwallowing;
        }
        
        break;
    
    case UnknownEnum.Value_1:
        alarm[0] = rotateSpeed;
        
        if (sprite_index == spr_donutShitterSwallowing && animation_end())
        {
            image_index = 0;
            sprite_index = spr_donutShitterShitting;
        }
        
        if (sprite_index == spr_donutShitterShitting)
        {
            if (floor(image_index) >= 8 && donutNumber > 0)
            {
                with (instance_create(x, y, obj_donutShitted))
                {
                    var _angle = (other.image_xscale > 0) ? other.image_angle : (other.image_angle - 180);
                    Hmovespeed = lengthdir_x(12, _angle);
                    Vmovespeed = lengthdir_y(12, _angle);
                    shattedBy = other.id;
                }
                
                donutNumber--;
                image_index = 0;
            }
            
            if (donutNumber <= 0 && animation_end())
            {
                sprite_index = spr_donutShitter;
                state = UnknownEnum.Value_0;
            }
        }
        
        break;
}
