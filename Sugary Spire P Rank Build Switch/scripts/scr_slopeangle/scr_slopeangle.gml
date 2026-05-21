//Redo of slope angle
/// @description scr_slopeangle
/// @param x
/// @param y
function scr_slopeangle(x_pos = x, y_pos = y, distance = 2)
{
    var array = 0;
    var checkside = -1;
    var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
    var top = -4;
    var i = 0;
    array[0] = y;
    array[1] = y;
    
    var _function = function(x_pos, y_pos)
    {
        return scr_solid_player(x_pos, y_pos) || (scr_slope_ext(x_pos, y_pos) && scr_slopePlatform(x_pos, y_pos));
    };
    
    while (i < 2)
    {
        while (top < height)
        {
            array[i] = y;
            var check_1 = _function(x + (distance * checkside), y + top);
            var check_2 = !_function(x + (distance * checkside), (y + top) - 1);
            
            if (check_1 && check_2)
            {
                var sex = (y + top) - 1;
                array[i] = sex;
                break;
            }
            
            top++;
        }
        //It turns negative
        checkside = !checkside;
        i++;
    }
    
    var pointer1 = array[0];
    var pointer2 = array[1];
    var _angle = 0;
    
    if (pointer1 != pointer2)
        _angle = point_direction(x - distance, pointer1, x + distance, pointer2);
    
    return _angle;
}

function scr_slopeanglenonplayer(x_pos, y_pos, distance = 1)
{
	/// @description scr_slopeangle
	/// @param x
	/// @param y
    var array = 0;
    var checkside = -1;
    var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
    var top = -4;
    var i = 0;
    array[0] = y_pos;
    array[1] = y_pos;
    
    var _function = function(x_pos, y_pos)
    {
        return scr_solid(x_pos, y_pos) || (scr_slope_ext(x_pos, y_pos) && scr_slopePlatform(x_pos, y_pos));
    };
    
    while (i < 2)
    {
        while (top < height)
        {
            array[i] = y_pos;
            var check_1 = _function(x_pos + (distance * checkside), y_pos + top);
            var check_2 = !_function(x_pos + (distance * checkside), (y_pos + top) - 1);
            
            if (check_1 && check_2)
            {
                var sex = (y_pos + top) - 1;
                array[i] = sex;
                break;
            }
            
            top++;
        }
        //It turns negative
        checkside = !checkside;
        i++;
    }
    
    var pointer1 = array[0];
    var pointer2 = array[1];
    var _angle = 0;
    
    if (pointer1 != pointer2)
        _angle = point_direction(x_pos - distance, pointer1, x_pos + distance, pointer2);
    
    return _angle;
}

function scr_checkSlopeAngle()
{
    return scr_checkPositionSolidAngle(x, bbox_bottom, abs(x - bbox_left), abs(x - bbox_right) - 1, (bbox_bottom - bbox_top) / 2, -90, undefined, true);
}
