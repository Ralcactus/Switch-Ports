function scr_pizzanoboss_robot_attack(){
	if (!place_meeting(x-1, y, obj_solid)){
		sprite_index = spr_player_PN_groundPound_land;
		sprite_index = spr_player_PN_mach3;
		hsp = -8;
	}
	else{
		sprite_index = spr_player_PN_hitWall_mach3;
	}
}
