scr_collision();

switch (state){
	case PizzanoBossStates.intro:
		scr_pizzanoboss_intro();
	break;
	
	case PizzanoBossStates.pickattack:
		scr_pizzanoboss_pickattack();
	break;
	
	case PizzanoBossStates.attack:
		scr_pizzanoboss_attack();
	break;
}
