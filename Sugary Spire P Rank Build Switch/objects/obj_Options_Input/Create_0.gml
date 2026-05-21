enum OPTION_INPUTSELECTED 
{
	back = 0,
	up = 1,
	right = 2,
	left = 3,
	down = 4,
	jump = 5,
	slap = 6,
	taunt = 7,
	shoot = 8,
	attack = 9,
	start = 10,
	special = 11
}

optionselected = 0;
scr_initinput();
subtitle = "GO BACK TO MAIN SCREEN";
CursorY = -999;
ScrollY = 0;
depth = -100;
selecting = false;
obj_Options_Main.CursorY = -999;
canmove = false;
alarm[0] = 1;
