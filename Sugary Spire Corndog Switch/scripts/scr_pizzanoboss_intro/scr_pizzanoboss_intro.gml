function scr_pizzanoboss_intro(){	
	if (sprite_animation_end() && sprite_index == spr_pizzanoboss_intro){
		sprite_index = spr_pizzanoboss_intro2;
	}
	
	if (sprite_animation_end() && sprite_index == spr_pizzanoboss_intro2){
		state = PizzanoBossStates.pickattack;
	}
}
