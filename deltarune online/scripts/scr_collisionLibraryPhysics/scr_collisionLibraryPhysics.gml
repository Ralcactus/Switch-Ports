#macro bbox_width (bbox_right - bbox_left)
#macro bbox_height (bbox_bottom - bbox_top)
#macro xorigin (x - sprite_xoffset)
#macro xcenter (xorigin + sprite_width / 2)
#macro bbox_xcenter (bbox_left + (bbox_width / 2))
#macro bbox_xrange random_range(bbox_left, bbox_right)
#macro yorigin (y - sprite_yoffset)
#macro ycenter (yorigin + sprite_height / 2)
#macro bbox_ycenter (bbox_top + (bbox_height / 2))
#macro bbox_yrange random_range(bbox_top, bbox_bottom)

enum SlopeCheckFlag {
    NONE = 0,            // Binary: 0000
    GROUND_UP = 1,       // Binary: 0001
    GROUND_DOWN = 2,     // Binary: 0010
    AIR_UP = 4,          // Binary: 0100
    AIR_DOWN = 8,        // Binary: 1000
    SIDEWAYS = 16,       // Binary: 10000
    ALL = 31             // Binary: 11111
}

/// @desc Initializes Collision Variables. To be used in Create Event.
function scr_collision_init() {
	usesCollision = true;
	grounded = false;
	groundedSlope = false;	
	terminalVelocity = 10;
	onMovingPlatform = noone;

	grav = 0;		
	hsp = 0;
	vsp = 0;
	prevHsp = 0;
	prevVsp = 0;

	fracHsp = 0;
	fracVsp = 0;
	
	
	hspCarry = 0;
	vspCarry = 0;


	
	slopeMovementFlags = SlopeCheckFlag.GROUND_DOWN | SlopeCheckFlag.GROUND_UP; // Allow only some slopes to adjust your position.
	slopeMaxDistance = 1; // Only move up slopes (and loop) X amount of distance.
	// Note: Increasing slopeMaxDistance exponentially lags the game. 
	// Slope operations are kind of messy and laggy sorry.
}

/// @desc Handles Collision Physics.
function scr_collision() {
	var _old_grounded = grounded;
	grounded = false;
	groundedSlope = false;
	onMovingPlatform = noone;
	
	#region // Moving Platforms
	with (obj_movingPlatform) { 
		// Update Moving Platforms Step.
		if (!hasMove) {
			self.moveCode();
		}
		
		var _hspeed = (x - xprevious);
		var _vspeed = (y - yprevious);
		with (other.id) {
			x += _hspeed;
			y += _vspeed;
			if (place_meeting_collision(x, y + 1, ~Exclude.MOVING) && place_meeting(x, y + 1, other)) {
				onMovingPlatform = other.id;
			}
			x -= _hspeed;
			y -= _vspeed;			
		}
	}
	if (instance_exists(onMovingPlatform)) { // If collision with Moving Platform is detected, run kinematics.
		kinematics_movingPlatforms(id, onMovingPlatform, true);		
	}
	#endregion	

	
	// Subpixel Fix.
	var true_hsp = hsp;
	var true_vsp = vsp;
	
	var final_hsp = (hsp + hspCarry);
	var final_vsp = (vsp + vspCarry);
	
	hsp = math_absfloor(final_hsp);
	vsp = math_absfloor(final_vsp);
	var whole_integer = 0;
	
	fracHsp += (final_hsp - hsp); 
	if (abs(fracHsp) >= 1) {
	    whole_integer = math_absfloor(fracHsp);
	    hsp += whole_integer;
	    fracHsp -= whole_integer;
	}	
	
	fracVsp += (final_vsp - vsp);
	if (abs(fracVsp) >= 1) {
	    whole_integer = math_absfloor(fracVsp);
	    vsp += whole_integer;
	    fracVsp -= whole_integer;
	}	
	
	#region Vertical
	var remaining_vsp = vsp; // Track the remaining vertical movement.
	var move_steps = ceil((abs(vsp) / bbox_height)); // Repeat per Bbox Height.
	var move_vsp;
	
	repeat (move_steps) { // Repeat per Bbox Height.
		move_vsp = clamp(abs(remaining_vsp), 0, bbox_height) * sign(remaining_vsp); // Calculate max units to move.	

		if (place_meeting_collision(x, y + move_vsp)) { 
			repeat(abs(move_vsp)) { // Do pixel by pixel check.	
			
				if (isCollisionFlagSet(slopeMovementFlags, SlopeCheckFlag.SIDEWAYS) && vsp < 0) {
					// Move Left Slopes
					x -= slope_check_left(x, y + sign(move_vsp), slopeMaxDistance);
					// Move Right Slopes
					x += slope_check_right(x, y + sign(move_vsp), slopeMaxDistance);
				}	
			
				if (!place_meeting_collision(x, y + sign(move_vsp))) {
					y += sign(move_vsp); 
				} else {
					move_vsp = 0;					
					true_vsp = 0;
					remaining_vsp = 0;
					fracVsp = 0;
					vsp = 0;
					break;
				}
			}
		}
		
		y += move_vsp;	
		remaining_vsp -= move_vsp;		
	}
	#endregion
	
	#region Horizontal
	var remaining_hsp = hsp; // Track the remaining horizontal movement.
	var move_steps = ceil((abs(hsp) / bbox_width)); // Repeat per Bbox Height.
	var move_hsp;
	
	repeat (move_steps) { // Repeat per Bbox Height.
		move_hsp = clamp(abs(remaining_hsp), 0, bbox_width) * sign(remaining_hsp); // Calculate max units to move.	
		var on_ground = place_meeting_collision(x, y + 1);
		
		if (place_meeting_collision(x + move_hsp, y)) { // If Collision is detected within Bbox Height.
			repeat(abs(move_hsp)) { // Do pixel by pixel check.
				
				// Move Up Slopes.
				if (isCollisionFlagSet(slopeMovementFlags, SlopeCheckFlag.GROUND_UP)) {
					y -= slope_check_up(x + sign(move_hsp), y, slopeMaxDistance);			
				}
				
				// Move Down Upside Down Slopes
				if (isCollisionFlagSet(slopeMovementFlags, SlopeCheckFlag.AIR_DOWN) && !on_ground) {
					y += reverseSlope_check_down(x + sign(move_hsp), y, slopeMaxDistance);
				}
		
				// Move Up Upside Down Slopes
				if (isCollisionFlagSet(slopeMovementFlags, SlopeCheckFlag.AIR_UP) && vsp <= 0 && place_meeting_collision(x, y - 1)) {
					y -= reverseSlope_check_up(x + sign(move_hsp), y, slopeMaxDistance);
				}
				
				if (!place_meeting_collision(x + sign(move_hsp), y)) {
					x += sign(move_hsp); 
				} else {
					move_hsp = 0;					
					true_hsp = 0;
					remaining_hsp = 0;
					fracHsp = 0;
					hsp = 0;
					break;
				}
			}
			break;
		}
		
		x += move_hsp;	
		
		// Move Down Slopes. Currently only 1 pixel high slopes are supported.
		if (isCollisionFlagSet(slopeMovementFlags, SlopeCheckFlag.GROUND_DOWN) && on_ground && vsp >= 0 && !place_meeting_collision(x, y + 1) && place_meeting_collision(x, y + abs(move_hsp) + 1)) {
			//y += slope_check_down(x, y + abs(move_hsp), slopeMaxDistance);
			
			while (!place_meeting_collision(x, y + 1)) {
				y++;
			}
		}		
			
		remaining_hsp -= move_hsp;	
	}	
	#endregion
	

	
	hsp = true_hsp;
	vsp = true_vsp;	
	hspCarry = 0;
	vspCarry = 0;	
	

	// Gravity
	if (vsp < terminalVelocity) {
		vsp += grav;
	}

	
	// Grounded Check
	grounded = (place_meeting_collision(x, y + 1));
	groundedSlope = (place_meeting_slope(x, y + 1));
	
	// Kinematic Stuff 
	if (!grounded && _old_grounded && instance_exists(onMovingPlatform)) {
		hspCarry = (onMovingPlatform.x - onMovingPlatform.xprevious)/2;
		vspCarry = (onMovingPlatform.y - onMovingPlatform.yprevious)/2;
	}
	
	
	// Previous hsp and vsp
	prevHsp = hsp;
	prevVsp = vsp;	
}
/// @desc Handles movement of object affected by MOVING PLATFORMS.
/// @param {any*} obj The ID of the object affected/
/// @param {any*} platform_id The ID of the MOVING platform.
/// @param {bool} [collisions] Toggles checking of collisions.
function kinematics_movingPlatforms(obj, platform_id, collisions = true) {
	with (platform_id) {
		var _hsp = round(x - xprevious);
		var _vsp = round(y - yprevious);		
		if (!collisions) { // Ignore Collisions
			with (obj) {
				x += _hsp;
				y += _vsp;
			}
		} else { // Collision Checks
			with (obj) {
				repeat(abs(_hsp)) {	
					if (!place_meeting_collision(x + sign(_hsp), y)) {
						x += sign(_hsp); 
					} else {
						_hsp = 0;
						break;
					}
				}
				repeat(abs(_vsp)) {	
					if (!place_meeting_collision(x, y + sign(_vsp))) {
						y += sign(_vsp); 
					} else {
						_vsp = 0;
						break;
					}
				}
			}
		}
	}
}


/// @desc Returns by how much (in pixel) upwards until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function slope_check_up(x_pos, y_pos, max_units = 3) {
	// Move up slope
	for (var i = max_units; i > 0; --i) {
		var _check = true;
		var _z = (i - 1);
		repeat (i - 1) {
			if (!place_meeting_collision(x_pos, y_pos - _z)) {
				_check = false;
			}
			_z--;
		}
		if (place_meeting_collision(x_pos, y_pos) && _check && !place_meeting_collision(x_pos, y_pos - i)) {
			return i;
		}
	}
	return 0;	
}
	
/// @desc Returns by how much (in pixel) downwards until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function slope_check_down(x_pos, y_pos, max_units = 3) {
	// Move down slope
	for (var i = 1; i < max_units + 1; ++i) {
		var _check = true;
		var _z = 1;
		repeat (i) {
			if (place_meeting_collision(x_pos, y_pos + _z)) {
				_check = false;
			}
			_z++;
		}			
		if (!place_meeting_collision(x_pos, y_pos) && _check && place_meeting_collision(x_pos, y_pos + (i + 1))) {
			return i;
		}
	}	
	return 0;	
}
	
/// @desc Returns by how much (in pixel) to the left until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function slope_check_left(x_pos, y_pos, max_units = 3) {
	// Move to the left
	for (var i = 0; i < max_units; ++i) {
		if (place_meeting_collision(x_pos, y_pos) && !place_meeting_collision(x_pos - i, y_pos)) {
			return i;
		}
	}
	return 0;	
}
	
/// @desc Returns by how much (in pixel) to the right until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function slope_check_right(x_pos, y_pos, max_units = 3) {
	// Move to the Right
	for (var i = 0; i < max_units; ++i) {
		if (place_meeting_collision(x_pos, y_pos) && !place_meeting_collision(x_pos + i, y_pos)) {
			return i;
		}
	}
	return 0;		
}	

/// @desc Returns by how much (in pixel) going down until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function reverseSlope_check_down(x_pos, y_pos, max_units = 3) {
	// Move to the Bottom
	for (var i = 0; i < max_units; ++i) {
		if (place_meeting_collision(x_pos, y_pos) && !place_meeting_collision(x_pos, y_pos + i)) {
			return i;
		}
	}
	return 0;	
}
	
/// @desc Returns by how much (in pixel) going up until a valid surface is found. Used in slope collisions.
/// @param {any*} x The x position to check.
/// @param {any*} y The y position to check.
/// @param {real} [max_units] The max amount of pixels to check.
/// @returns {real}
function reverseSlope_check_up(x_pos, y_pos, max_units = 3) {
	// Move to the Top
	for (var i = 0; i < max_units; ++i) {
		if (!place_meeting_collision(x_pos, y_pos) && !place_meeting_collision(x_pos, y_pos - i) && place_meeting_collision(x_pos, y_pos - (i + 1))) {
			return i;
		}		
	}
	return 0;		
}	