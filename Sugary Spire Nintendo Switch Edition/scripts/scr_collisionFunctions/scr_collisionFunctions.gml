function scr_checkPositionSolidAngle(arg0, arg1, arg2, arg3, arg4, arg5, arg6 = Exclude.NONE, arg7 = false)
{
	var point_a = 
	{
		x: arg0,
		y: arg1,
		xstart: arg0,
		ystart: arg1,
		targetX: arg0,
		targetY: arg1
	}
	var point_b = 
	{
		x: arg0,
		y: arg1,
		xstart: arg0,
		ystart: arg1,
		targetX: arg0,
		targetY: arg1
	}
	var _check = false
	var _dist = arg2
	
	while (!_check)
	{
		point_a.x = round(point_a.xstart + lengthdir_x(arg2, 90 + arg5))
		point_a.y = round(point_a.ystart + lengthdir_y(arg2, 90 + arg5))
		point_a.targetX = round(point_a.x + lengthdir_x(arg4, arg5))
		point_a.targetY = round(point_a.y + lengthdir_y(arg4, arg5))
		
		while (point_distance(point_a.x, point_a.y, point_a.targetX, point_a.targetY) > 0)
		{
			if (position_meeting_collision(point_a.x, point_a.y, arg6))
			{
				_check = true
				break
			}
			
			point_a.x += lengthdir_x(1, arg5)
			point_a.y += lengthdir_y(1, arg5)
			
			if (point_distance(point_a.x, 0, point_a.targetX, 0) <= 1)
				point_a.x = point_a.targetX
			
			if (point_distance(0, point_a.y, 0, point_a.targetY) <= 1)
				point_a.y = point_a.targetY
		}
		
		if (arg7 && arg2 != -_dist && !_check)
		{
			arg2 = approach(arg2, -_dist, 1)
		}
		else if (!_check)
		{
			point_a.x = point_a.xstart + lengthdir_x(_dist, 90 + arg5)
			point_a.y = point_a.ystart + lengthdir_y(_dist, 90 + arg5)
			point_a.targetX = round(point_a.x + lengthdir_x(arg4, arg5))
			point_a.targetY = round(point_a.y + lengthdir_y(arg4, arg5))
			_check = true
		}
	}
	
	_check = false
	_dist = arg3
	
	while (!_check)
	{
		point_b.x = round(point_b.xstart + lengthdir_x(arg3, -90 + arg5))
		point_b.y = round(point_b.ystart + lengthdir_y(arg3, -90 + arg5))
		point_b.targetX = round(point_b.x + lengthdir_x(arg4, arg5))
		point_b.targetY = round(point_b.y + lengthdir_y(arg4, arg5))
		
		while (point_distance(point_b.x, point_b.y, point_b.targetX, point_b.targetY) > 0)
		{
			if (position_meeting_collision(point_b.x, point_b.y, arg6))
			{
				_check = true
				break
			}
			
			point_b.x += lengthdir_x(1, arg5)
			point_b.y += lengthdir_y(1, arg5)
			
			if (point_distance(point_b.x, 0, point_b.targetX, 0) <= 1)
				point_b.x = point_b.targetX
			
			if (point_distance(0, point_b.y, 0, point_b.targetY) <= 1)
				point_b.y = point_b.targetY
		}
		
		if (arg7 && arg3 != -_dist && !_check)
		{
			arg3 = approach(arg3, -_dist, 1)
		}
		else if (!_check)
		{
			point_b.x = point_b.xstart + lengthdir_x(_dist, -90 + arg5)
			point_b.y = point_b.ystart + lengthdir_y(_dist, -90 + arg5)
			point_b.targetX = round(point_b.x + lengthdir_x(arg4, arg5))
			point_b.targetY = round(point_b.y + lengthdir_y(arg4, arg5))
			_check = true
		}
	}
	
	var _angle = point_direction(point_a.x, point_a.y, point_b.x, point_b.y) - 180
	return _angle;
}

function triangle_meeting(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
	var old_x = x
	var old_y = y
	x = arg0
	y = arg1
	var result = rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom, arg2, arg3, arg4, arg5, arg6, arg7) > 0
	x = old_x
	y = old_y
	return result;
}

function bbox_in_rectangle(arg0, arg1, arg2, arg3, arg4)
{
	if (!instance_exists(arg0))
		return false;
	
	return rectangle_in_rectangle(arg0.bbox_left, arg0.bbox_top, arg0.bbox_right, arg0.bbox_bottom, arg1, arg2, arg3, arg4);
}

function conveyorBelt_hsp()
{
	if (place_meeting(x, y + 1, obj_conveyorBelt) && vsp >= 0 && grounded)
	{
		var rail_inst = instance_place(x, y + 1, obj_conveyorBelt)
		return rail_inst.movespeed * sign(rail_inst.image_xscale);
	}
	
	return 0;
}

function scr_conveyorBeltKinematics()
{
	useConveyorFlag = true
}

function place_meeting_adjacent(arg0)
{
	return place_meeting(x, y, arg0) || place_meeting(x - 1, y, arg0) || place_meeting(x + 1, y, arg0) || place_meeting(x, y - 1, arg0) || place_meeting(x, y + 1, arg0) || place_meeting(x - 1, y - 1, arg0) || place_meeting(x + 1, y - 1, arg0) || place_meeting(x - 1, y + 1, arg0) || place_meeting(x + 1, y + 1, arg0);
}

function place_meeting_collision_adjacent(arg0)
{
	return place_meeting_collision(x, y, arg0) || place_meeting_collision(x - 1, y, arg0) || place_meeting_collision(x + 1, y, arg0) || place_meeting_collision(x, y - 1, arg0) || place_meeting_collision(x, y + 1, arg0) || place_meeting_collision(x - 1, y - 1, arg0) || place_meeting_collision(x + 1, y - 1, arg0) || place_meeting_collision(x - 1, y + 1, arg0) || place_meeting_collision(x + 1, y + 1, arg0);
}

function isCollisionFlagSet(arg0, arg1)
{
	return (arg0 & arg1) == arg1;
}
