function scr_pizzanoboss_attack(){
	switch (currentattack){
		case PizzanoBossAttacks.robots:
			scr_pizzanoboss_robot_attack();
		break;
	}
}
