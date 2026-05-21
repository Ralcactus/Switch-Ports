/// @description Initialize variables.
// Credits to PierRoulette#0126 and Trek of the Oddities

// Inherit the parent event
event_inherited();
depth = 4;
image_speed = 0.35;

enum ButtonState 
{
	RELEASED,
	PRESSED,
	PRESSING,
	REVERTING
}

currentState = ButtonState.RELEASED;

//Sprites
spr_Lowering = spr_buttonLowering;
spr_Pressed = spr_buttonPressed;
spr_Released = spr_buttonReleased;
spr_Reverting = spr_buttonReverting;
