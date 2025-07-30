function state_player_honey() {
	hsp = 0
	vsp = 0
	movespeed = 0
	move = (key_left + key_right)
	//var _s = tauntstoredstate 
	//var knight = _s == states.knightpep || _s == states.knightpepattack || _s == states.knightpepbump
	sprite_index = spr_player_honeystuck
	image_speed = 0.35
	if (move != 0)
		xscale = move
	var webID = instance_place(x, y, obj_honeypanel)	
	if instance_exists(webID)
	{
		x = lerp(x, webID.x, 0.3)
		y = lerp(y, webID.y, 0.3)
	}
	if key_jump || key_slap2
	{
		if instance_exists(webID) {
		x = webID.x
		y = webID.y
		}
		scr_taunt_setVariables()
		vsp = 0
		if key_jump2
			vsp = -11
		
		if state == states.machslide state = states.mach2
		if state = states.chainsaw {
			sprite_index = spr_jump
			movespeed = 0
			state = states.jump
		}
		jumpAnim = 1
		scr_sound(sound_jump)
		if instance_exists(webID)
		{
			with (webID)
				event_user(0)
		}
	}
	exit;


}
