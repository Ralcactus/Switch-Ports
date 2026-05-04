function scr_pizzanoboss_pickattack(){
	var turn = irandom(0);
	currentattack = turn;
	state = PizzanoBossStates.attack;
}