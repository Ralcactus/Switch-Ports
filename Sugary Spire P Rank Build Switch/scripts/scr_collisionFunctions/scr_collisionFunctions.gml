/// @desc Checks the angle of the surface of the collided collision object.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} pdist_a Distance of Point A from the center point.
/// @param {real} pdist_b Distance of Point B from the center point.
/// @param {real} len Magnitude of the point to check.
/// @param {real} dir Direction of the point to check.
/// @param {real} [exclude] Using the EXLCUDE flags you can exclude types of objects. Ex: (Exclude.SLOPES|Exclude.PLATFORMS). You can also invert it like so: (~Exclude.MOVING).
/// @param {bool} [can_approach] Toggles whether to move points closer together if point is in the air.
/// @returns {real} Angle of the surface of the collided collision object.
function scr_checkPositionSolidAngle(x, y, pdist_a, pdist_b, len, dir, exclude = Exclude.NONE, can_approach = false) {
	// To Do: Research better ways of doing this if possible.
	
	// Initialize Variables.
	var point_a = { 
		x : x, 
		y : y, 
		xstart : x, 
		ystart : y, 
		targetX : x, 
		targetY : y 
	}, point_b = { 
		x : x, 
		y : y, 
		xstart : x, 
		ystart : y, 
		targetX : x, 
		targetY : y 
	};
		
	
	var _check = false;
	var _dist = pdist_a;
	while (!_check) {
		// Determine Starting Positions.
		point_a.x = round(point_a.xstart + lengthdir_x(pdist_a, 90 + dir));
		point_a.y = round(point_a.ystart + lengthdir_y(pdist_a, 90 + dir));
		
		// Determine Target Positions.
		point_a.targetX = round(point_a.x + lengthdir_x(len, dir));
		point_a.targetY = round(point_a.y + lengthdir_y(len, dir));		
		
		// Approach Target Position.
		while (point_distance(point_a.x, point_a.y, point_a.targetX, point_a.targetY) > 0) {
			if (position_meeting_collision(point_a.x, point_a.y, exclude)) {
				_check = true;
				break;
			}
			
			point_a.x += lengthdir_x(1, dir);	
			point_a.y += lengthdir_y(1, dir);
			if point_distance(point_a.x, 0, point_a.targetX, 0) <= 1 { point_a.x = point_a.targetX; }
			if point_distance(0, point_a.y, 0, point_a.targetY) <= 1 { point_a.y = point_a.targetY; }			
		}
		
		if (can_approach && pdist_a != -_dist && !_check) {
			pdist_a	= approach(pdist_a, -_dist, 1);
		} else if (!_check) {
			point_a.x = point_a.xstart + lengthdir_x(_dist, 90 + dir);
			point_a.y = point_a.ystart + lengthdir_y(_dist, 90 + dir);	
			
			point_a.targetX = round(point_a.x + lengthdir_x(len, dir));
			point_a.targetY = round(point_a.y + lengthdir_y(len, dir));				
			_check = true;
		}
	}
	var _check = false;
	var _dist = pdist_b;
	while (!_check) {
		// Determine Starting Positions.
		point_b.x = round(point_b.xstart + lengthdir_x(pdist_b, -90 + dir));
		point_b.y = round(point_b.ystart + lengthdir_y(pdist_b, -90 + dir));
		
		// Determine Target Positions.
		point_b.targetX = round(point_b.x + lengthdir_x(len, dir));
		point_b.targetY = round(point_b.y + lengthdir_y(len, dir));		
		
		// Approach Target Position.
		while (point_distance(point_b.x, point_b.y, point_b.targetX, point_b.targetY) > 0) {
			if (position_meeting_collision(point_b.x, point_b.y, exclude)) {
				_check = true;
				break;
			}
			
			point_b.x += lengthdir_x(1, dir);
			point_b.y += lengthdir_y(1, dir);
			if point_distance(point_b.x, 0, point_b.targetX, 0) <= 1 { point_b.x = point_b.targetX; }
			if point_distance(0, point_b.y, 0, point_b.targetY) <= 1 { point_b.y = point_b.targetY; }						
		}
		
		if (can_approach && pdist_b != -_dist && !_check) {
			pdist_b	= approach(pdist_b, -_dist, 1);
		} else if (!_check) {
			point_b.x = point_b.xstart + lengthdir_x(_dist, -90 + dir);
			point_b.y = point_b.ystart + lengthdir_y(_dist, -90 + dir);	
			
			point_b.targetX = round(point_b.x + lengthdir_x(len, dir));
			point_b.targetY = round(point_b.y + lengthdir_y(len, dir));					
			_check = true;
		}
	}
	
	// Return Angle
	var _angle = (point_direction(point_a.x, point_a.y, point_b.x, point_b.y) - 180);
	#region Debug Stuff.
	if (global.debugmode) {
		draw_point_color(point_a.x, point_a.y, c_blue);
		draw_point_color(point_b.x, point_b.y, c_yellow);
	
		draw_line_width_color(point_a.x, point_a.y, point_a.targetX, point_a.targetY, 2, c_red, c_black);
		draw_line_width_color(point_b.x, point_b.y, point_b.targetX, point_b.targetY, 2, c_green, c_black);
	
		draw_point_color(point_a.targetX, point_a.targetY, c_white);
		draw_point_color(point_b.targetX, point_b.targetY, c_white);
		
		draw_text(point_a.x, point_a.y, string(_angle));
	}
	#endregion
	
	return _angle;
}

/// @desc Returns true if object collision collides with a given triangle
/// @param  {real} sx The x position to check for.
/// @param  {real} sy The y position to check for.
/// @param  {real} x1 x-coordinate of 1st point of triangle.
/// @param  {real} y1 y-coordinate of 1st point of triangle.
/// @param  {real} x2 x-coordinate of 2nd point of triangle.
/// @param  {real} y2 y-coordinate of 2nd point of triangle.
/// @param  {real} x3 x-coordinate of 3rd point of triangle.
/// @param  {real} y3 y-coordinate of 3rd point of triangle.
/// @returns {bool}

function triangle_meeting(sx, sy, x1, y1, x2, y2, x3, y3)
{
	var old_x = x;
	var old_y = y;
	x = sx;
	y = sy;

	if rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom, x1, y1, x2, y2, x3, y3) > 0 {
		x = old_x;
		y = old_y;
		return true;	
	}
	x = old_x;
	y = old_y;	
	return false;
}
