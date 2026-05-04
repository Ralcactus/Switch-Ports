image_speed = 0.35;
scr_collision_init();
image_xscale = -1;
grav = 0.5;

state = PizzanoBossStates.intro;
currentattack = PizzanoBossAttacks.robots
sprite_index = spr_pizzanoboss_intro;

enum PizzanoBossStates{
	intro,
	pickattack,
	attack
}


enum PizzanoBossAttacks{
	robots
}
