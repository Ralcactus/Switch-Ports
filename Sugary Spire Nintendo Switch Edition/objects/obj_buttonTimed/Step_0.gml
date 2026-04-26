if (countdownCounter > 0 && currentState == PlayerState.normal)
{
	countdownCounter--
	
	if (countdownCounter <= 0)
	{
		currentState = PlayerState.run
		sprite_index = spr_Reverting
	}
}
