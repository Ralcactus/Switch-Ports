function scr_collision_init()
{
	grounded = false
	groundedSlope = false
	terminalVelocity = 10
	onMovingPlatform = -4
	grav = 0
	hsp = 0
	vsp = 0
	prevHsp = 0
	prevVsp = 0
	fracHsp = 0
	fracVsp = 0
	hspCarry = 0
	vspCarry = 0
	true_hsp = 0
	true_vsp = 0
	conveyorHsp = 0
	useConveyorFlag = false
	downSlope = true
}

function scr_collision()
{
	var _old_grounded = grounded
	grounded = false
	groundedSlope = false
	onMovingPlatform = -4
	scr_movingPlatformsUpdate()
	var conveyor_hsp = 0
	
	if (useConveyorFlag)
		conveyor_hsp = conveyorHsp
	
	useConveyorFlag = false
	var true_hsp = hsp
	var true_vsp = vsp
	var final_hsp = hsp + hspCarry + conveyor_hsp
	var final_vsp = vsp + vspCarry
	hsp = absfloor(final_hsp)
	vsp = absfloor(final_vsp)
	var whole_integer = 0
	fracHsp += (final_hsp - hsp)
	
	if (abs(fracHsp) >= 1)
	{
		whole_integer = absfloor(fracHsp)
		hsp += whole_integer
		fracHsp -= whole_integer
	}
	
	fracVsp += (final_vsp - vsp)
	
	if (abs(fracVsp) >= 1)
	{
		whole_integer = absfloor(fracVsp)
		vsp += whole_integer
		fracVsp -= whole_integer
	}
	
	var remaining_vsp = vsp
	var move_steps = ceil(abs(vsp) / (bbox_bottom - bbox_top))
	
	repeat (move_steps)
	{
		var move_vsp = clamp(abs(remaining_vsp), 0, bbox_bottom - bbox_top) * sign(remaining_vsp)
		
		if (place_meeting_collision(x, y + move_vsp))
		{
			while (!place_meeting_collision(x, y + sign(move_vsp)))
				y += sign(move_vsp)
			
			move_vsp = 0
			true_vsp = 0
			fracVsp = 0
			vsp = 0
			break
		}
		
		y += move_vsp
		remaining_vsp -= move_vsp
	}
	
	var remaining_hsp = hsp
	move_steps = ceil(abs(hsp) / (bbox_right - bbox_left))
	
	repeat (move_steps)
	{
		var move_hsp = clamp(abs(remaining_hsp), 0, bbox_right - bbox_left) * sign(remaining_hsp)
		var on_ground = place_meeting_collision(x, y + 1)
		
		if (place_meeting_collision(x + move_hsp, y))
		{
			repeat (abs(move_hsp))
			{
				y -= slope_check_up(x + sign(move_hsp), y)
				
				if (!place_meeting_collision(x + sign(move_hsp), y))
				{
					x += sign(move_hsp)
				}
				else
				{
					move_hsp = 0
					true_hsp = 0
					remaining_hsp = 0
					fracHsp = 0
					hsp = 0
					break
				}
			}
			
			break
		}
		
		x += move_hsp
		
		if (downSlope && on_ground && vsp >= 0 && !place_meeting_collision(x, y + 1) && place_meeting_collision(x, y + abs(move_hsp) + 1))
		{
			while (!place_meeting_collision(x, y + 1))
				y++
		}
		
		remaining_hsp -= move_hsp
	}
	
	hsp = true_hsp
	vsp = true_vsp
	hspCarry = 0
	vspCarry = 0
	
	if (vsp < terminalVelocity)
		vsp += grav
	
	grounded = place_meeting_collision(x, y + 1)
	groundedSlope = place_meeting_slope(x, y + 1)
	
	if (!grounded && _old_grounded && instance_exists(onMovingPlatform))
	{
		hspCarry = (onMovingPlatform.x - onMovingPlatform.xprevious) / 2
		vspCarry = (onMovingPlatform.y - onMovingPlatform.yprevious) / 2
	}
	
	prevHsp = hsp
	prevVsp = vsp
}

function scr_movingPlatformsUpdate()
{
}

function kinematics_movingPlatforms(arg0, arg1, arg2 = true)
{
	with (arg1)
	{
		var _hsp = round(x - xprevious)
		var _vsp = round(y - yprevious)
		
		if (!arg2)
		{
			with (arg0)
			{
				x += _hsp
				y += _vsp
			}
		}
		else
		{
			with (arg0)
			{
				repeat (abs(_hsp))
				{
					if (!place_meeting_collision(x + sign(_hsp), y))
					{
						x += sign(_hsp)
					}
					else
					{
						_hsp = 0
						break
					}
				}
				
				repeat (abs(_vsp))
				{
					if (!place_meeting_collision(x, y + sign(_vsp)))
					{
						y += sign(_vsp)
					}
					else
					{
						_vsp = 0
						break
					}
				}
			}
		}
	}
}

function slope_check_up(arg0, arg1, arg2 = 2)
{
	for (var i = arg2; i > 0; i--)
	{
		var _check = true
		var _z = i - 1
		
		repeat (i - 1)
		{
			if (!place_meeting_collision(arg0, arg1 - _z))
				_check = false
			
			_z--
		}
		
		if (place_meeting_collision(arg0, arg1) && _check && !place_meeting_collision(arg0, arg1 - i))
			return i;
	}
	
	return 0;
}

function slope_check_down(arg0, arg1, arg2 = 2)
{
	for (var i = 1; i < (arg2 + 1); i++)
	{
		var _check = true
		var _z = 1
		
		repeat (i)
		{
			if (place_meeting_collision(arg0, arg1 + _z))
				_check = false
			
			_z++
		}
		
		if (!place_meeting_collision(arg0, arg1) && _check && place_meeting_collision(arg0, arg1 + (i + 1)))
			return i;
	}
	
	return 0;
}

function slope_check_left(arg0, arg1, arg2 = 3)
{
	for (var i = 0; i < arg2; i++)
	{
		if (place_meeting_collision(arg0, arg1) && !place_meeting_collision(arg0 - i, arg1))
			return i;
	}
	
	return 0;
}

function slope_check_right(arg0, arg1, arg2 = 3)
{
	for (var i = 0; i < arg2; i++)
	{
		if (place_meeting_collision(arg0, arg1) && !place_meeting_collision(arg0 + i, arg1))
			return i;
	}
	
	return 0;
}

function reverseSlope_check_down(arg0, arg1, arg2 = 3)
{
	for (var i = 0; i < arg2; i++)
	{
		if (place_meeting_collision(arg0, arg1) && !place_meeting_collision(arg0, arg1 + i))
			return i;
	}
	
	return 0;
}

function reverseSlope_check_up(arg0, arg1, arg2 = 3)
{
	for (var i = 0; i < arg2; i++)
	{
		if (!place_meeting_collision(arg0, arg1) && !place_meeting_collision(arg0, arg1 - i) && place_meeting_collision(arg0, arg1 - (i + 1)))
			return i;
	}
	
	return 0;
}
