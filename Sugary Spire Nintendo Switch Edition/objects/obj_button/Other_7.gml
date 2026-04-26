if (currentState == PlayerState.titlescreen)
{
	currentState = PlayerState.normal
	sprite_index = spr_Pressed
}
else if (currentState == PlayerState.run)
{
	currentState = PlayerState.frozen
	sprite_index = spr_Released
}
