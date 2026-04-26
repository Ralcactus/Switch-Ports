global.MyCollisionList = ds_list_create()

function instance_place_list_collision(arg0, arg1, arg2 = Exclude.NONE, arg3 = undefined)
{
	var collided = 0
	var check_slopes = !isCollisionFlagSet(arg2, Exclude.SLOPES)
	var check_solids = !isCollisionFlagSet(arg2, Exclude.SOLIDS)
	var check_platforms = !isCollisionFlagSet(arg2, Exclude.PLATFORMS)
	var check_moving = !isCollisionFlagSet(arg2, Exclude.MOVING)
	
	if (check_solids)
	{
		collided += instance_place_list_solid(arg0, arg1, undefined, arg3)
		collided += instance_place_list_slopeSolid(arg0, arg1, undefined, arg3)
	}
	
	if (check_slopes)
	{
		if (check_solids)
			collided += instance_place_list_slope(arg0, arg1, undefined, arg3)
		
		if (check_platforms)
			collided += instance_place_list_slopePlatform(arg0, arg1, undefined, arg3)
	}
	
	if (check_platforms)
	{
		collided += instance_place_list_platform(arg0, arg1, undefined, arg3)
		collided += instance_place_list_sidePlatform(arg0, arg1, undefined, arg3)
	}
	
	if (check_moving)
		collided += instance_place_list_platform(arg0, arg1, obj_movingPlatform, arg3)
	
	return collided;
}

function place_meeting_collision(arg0, arg1, arg2 = Exclude.NONE)
{
	var check_slopes = (Exclude.SLOPES & arg2) != Exclude.SLOPES
	var check_solids = (Exclude.SOLIDS & arg2) != Exclude.SOLIDS
	var check_platforms = (Exclude.PLATFORMS & arg2) != Exclude.PLATFORMS
	var check_moving = (Exclude.MOVING & arg2) != Exclude.MOVING
	
	if (check_solids)
	{
		if (place_meeting_solid(arg0, arg1))
			return true;
		
		if (place_meeting_slopeSolid(arg0, arg1))
			return true;
	}
	
	if (check_slopes)
	{
		if (check_solids)
		{
			if (place_meeting_slope(arg0, arg1, false))
				return true;
		}
		
		if (check_platforms)
		{
			if (place_meeting_slopePlatform(arg0, arg1))
				return true;
		}
	}
	
	if (check_platforms)
	{
		if (place_meeting_platform(arg0, arg1))
			return true;
		
		if (place_meeting_sidePlatform(arg0, arg1))
			return true;
	}
	
	return false;
}

function position_meeting_collision(arg0, arg1, arg2 = Exclude.NONE)
{
	var old_mask = mask_index
	mask_index = spr_pixel
	var check_collision = place_meeting_collision(arg0, arg1, arg2)
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_solid(arg0, arg1, arg2 = obj_solid, arg3 = undefined)
{
	var collided = 0
	var col_number = instance_place_list(arg0, arg1, arg2, global.MyCollisionList, false)
	
	if (col_number > 0)
	{
		for (var i = 0; i < col_number; i++)
		{
			var col_object = ds_list_find_value(global.MyCollisionList, i)
			var special_colcheck = true
			
			if (variable_instance_exists(col_object, "canCollide"))
				special_colcheck = col_object.canCollide(col_object, id)
			
			if (special_colcheck)
			{
				collided++
				
				if (!is_undefined(arg3))
					ds_list_add(arg3, col_object.id)
				else
					break
			}
		}
		
		ds_list_clear(global.MyCollisionList)
	}
	
	return collided;
}

function place_meeting_solid(arg0, arg1, arg2 = obj_solid)
{
	return instance_place_list_solid(arg0, arg1, arg2) > 0;
}

function position_meeting_solid(arg0, arg1, arg2 = obj_solid)
{
	var old_mask = mask_index
	mask_index = spr_pixel
	var check_collision = instance_place_list_solid(arg0, arg1, arg2) > 0
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_platform(arg0, arg1, arg2 = obj_platform, arg3 = undefined)
{
	var collided = 0
	var col_number = instance_place_list(arg0, arg1, arg2, global.MyCollisionList, false)
	
	if (col_number > 0)
	{
		for (var i = 0; i < col_number; i++)
		{
			var col_object = ds_list_find_value(global.MyCollisionList, i)
			var special_colcheck = true
			
			if (variable_instance_exists(col_object, "canCollide"))
				special_colcheck = col_object.canCollide(col_object, id)
			
			var platform_check = (sign(col_object.image_yscale) <= -1) ? (arg1 <= y) : (arg1 >= y)
			
			if (special_colcheck && platform_check && !place_meeting(arg0, y, col_object))
			{
				collided++
				
				if (!is_undefined(arg3))
					ds_list_add(arg3, col_object.id)
				else
					break
			}
		}
		
		ds_list_clear(global.MyCollisionList)
	}
	
	return collided;
}

function instance_place_list_sidePlatform(arg0, arg1, arg2 = obj_sidePlatform, arg3 = undefined)
{
	var collided = 0
	var col_number = instance_place_list(arg0, arg1, arg2, global.MyCollisionList, false)
	
	if (col_number > 0)
	{
		for (var i = 0; i < col_number; i++)
		{
			var col_object = ds_list_find_value(global.MyCollisionList, i)
			var special_colcheck = true
			
			if (variable_instance_exists(col_object, "canCollide"))
				special_colcheck = col_object.canCollide(col_object, id)
			
			var s_platform_check = (sign(col_object.image_xscale) < 0) ? (arg0 >= x) : (arg0 <= x)
			
			if (special_colcheck && s_platform_check && !place_meeting(x, arg1, col_object))
			{
				collided++
				
				if (!is_undefined(arg3))
					ds_list_add(arg3, col_object.id)
				else
					break
			}
		}
		
		ds_list_clear(global.MyCollisionList)
	}
	
	return collided;
}

function place_meeting_platform(arg0, arg1, arg2 = obj_platform)
{
	return instance_place_list_platform(arg0, arg1, arg2) > 0;
}

function position_meeting_platform(arg0, arg1, arg2 = obj_platform)
{
	var old_mask = mask_index
	mask_index = spr_pixel
	var check_collision = instance_place_list_platform(arg0, arg1, arg2) > 0
	mask_index = old_mask
	return check_collision;
}

function place_meeting_sidePlatform(arg0, arg1, arg2 = obj_sidePlatform)
{
	return instance_place_list_sidePlatform(arg0, arg1, arg2) > 0;
}

function position_meeting_sidePlatform(arg0, arg1, arg2 = obj_sidePlatform)
{
	var old_mask = mask_index
	mask_index = spr_pixel
	var check_collision = instance_place_list_sidePlatform(arg0, arg1, arg2) > 0
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_slopePlatform(arg0, arg1, arg2 = obj_slopePlatform, arg3 = undefined)
{
	var old_x = x
	var old_y = y
	var old_bbox_top = bbox_top
	var old_bbox_bottom = bbox_bottom
	x = arg0
	y = arg1
	var collided = 0
	var slopeplatform_number = instance_place_list(x, y, arg2, global.MyCollisionList, false)
	
	if (slopeplatform_number > 0)
	{
		for (var i = 0; i < slopeplatform_number; i++)
		{
			var col_object = ds_list_find_value(global.MyCollisionList, i)
			var _can_collide = true
			
			if (variable_instance_exists(col_object, "canCollide"))
				_can_collide = col_object.canCollide(col_object, id)
			
			if (_can_collide)
			{
				var object_side = (col_object.image_xscale > 0) ? bbox_right : bbox_left
				object_side = (object_side - x) + old_x
				var player_pos = point_direction(col_object.x + col_object.sprite_width, col_object.y + col_object.sprite_height, x, y)
				var _xx = col_object.x + sign(col_object.image_xscale)
				var _yy = col_object.y
				var w = col_object.sprite_width
				var h = col_object.sprite_height
				var _check1
				
				if (col_object.image_yscale > 0)
					_check1 = (col_object.image_xscale > 0) ? (player_pos <= 180 && player_pos >= 90) : (player_pos <= 90 && player_pos >= 0)
				else
					_check1 = (col_object.image_xscale > 0) ? (player_pos <= 270 && player_pos >= 180) : ((player_pos <= 360 || player_pos <= 0) && player_pos >= 270)
				
				var _check2 = !triangle_meeting(old_x, old_y, _xx, _yy + h, _xx + w, _yy, _xx + w, _yy + h)
				var _check3 = (col_object.image_xscale > 0) ? (object_side <= col_object.bbox_left) : (object_side >= col_object.bbox_right)
				if (_check1 && (_check2 || _check3) && ((col_object.image_yscale > 0) ? (old_bbox_bottom <= col_object.bbox_bottom) : (old_bbox_top >= col_object.bbox_top)) && triangle_meeting(x, y, _xx, _yy + h, _xx + w, _yy, _xx + w, _yy + h))
				{
					collided++
					
					if (!is_undefined(arg3))
						ds_list_add(arg3, col_object.id)
					else
						break
				}
			}
		}
		
		ds_list_clear(global.MyCollisionList)
	}
	
	x = old_x
	y = old_y
	return collided;
}

function place_meeting_slopePlatform(arg0, arg1, arg2 = obj_slopePlatform)
{
	return instance_place_list_slopePlatform(arg0, arg1, arg2) > 0;
}

function position_meeting_slopePlatform(arg0, arg1, arg2 = obj_slopePlatform)
{
	var old_mask = mask_index
	mask_index = spr_pixel
	var check_collision = instance_place_list_slopePlatform(arg0, arg1, arg2) > 0
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_slope(arg0, arg1, arg2 = obj_slope, arg3 = undefined)
{
	var collided = 0
	var col_number = instance_place_list(arg0, arg1, arg2, global.MyCollisionList, false)
	
	if (col_number > 0)
	{
		for (var i = 0; i < col_number; i++)
		{
			var col_object = ds_list_find_value(global.MyCollisionList, i)
			var special_colcheck = true
			
			if (variable_instance_exists(col_object, "canCollide"))
				special_colcheck = col_object.canCollide(col_object, id)
			
			var _xx = col_object.x + sign(col_object.image_xscale)
			var _yy = col_object.y
			var w = col_object.sprite_width
			var h = col_object.sprite_height
			
			if (special_colcheck && triangle_meeting(arg0, arg1, _xx, _yy + h, _xx + w, _yy, _xx + w, _yy + h))
			{
				collided++
				
				if (!is_undefined(arg3))
					ds_list_add(arg3, col_object.id)
				else
					break
			}
		}
		
		ds_list_clear(global.MyCollisionList)
	}
	
	return collided;
}

function place_meeting_slope(arg0, arg1, arg2 = true, arg3 = obj_slope)
{
	var _check2 = arg2 ? place_meeting_slopePlatform(arg0, arg1) : false
	return instance_place_list_slope(arg0, arg1, arg3) > 0 || _check2;
}

function position_meeting_slope(arg0, arg1, arg2 = obj_slope)
{
	var old_mask = mask_index
	mask_index = spr_pixel
	var check_collision = instance_place_list_slope(arg0, arg1, arg2) > 0
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_slopeSolid(arg0, arg1, arg2 = obj_slope, arg3 = undefined)
{
	var collided = 0
	var col_number = instance_place_list(arg0, arg1, arg2, global.MyCollisionList, false)
	
	if (col_number > 0)
	{
		for (var i = 0; i < col_number; i++)
		{
			var col_object = ds_list_find_value(global.MyCollisionList, i)
			var special_colcheck = true
			
			if (variable_instance_exists(col_object, "canCollide"))
				special_colcheck = col_object.canCollide(col_object, id)
			
			var check_dir = arg0 - x
			var check_1 = sign(col_object.image_xscale) == -check_dir
			var check_2 = (col_object.image_yscale < 0) ? (bbox_bottom <= col_object.bbox_top) : (bbox_top >= col_object.bbox_bottom)
			var _xx = col_object.x + sign(col_object.image_xscale)
			var _yy = col_object.y
			var w = col_object.sprite_width
			var h = col_object.sprite_height
			
			if (special_colcheck && (check_1 || check_2) && triangle_meeting(arg0, arg1, _xx, _yy + h, _xx + w, _yy, _xx + w, _yy + h))
			{
				collided++
				
				if (!is_undefined(arg3))
					ds_list_add(arg3, col_object.id)
				else
					break
			}
		}
		
		ds_list_clear(global.MyCollisionList)
	}
	
	return collided;
}

function place_meeting_slopeSolid(arg0, arg1, arg2 = obj_slope)
{
	return instance_place_list_slopeSolid(arg0, arg1, arg2) > 0;
}

function position_meeting_slopeSolid(arg0, arg1, arg2 = obj_slope)
{
	var old_mask = mask_index
	mask_index = spr_pixel
	var check_collision = instance_place_list_slopeSolid(arg0, arg1, arg2) > 0
	mask_index = old_mask
	return check_collision;
}
