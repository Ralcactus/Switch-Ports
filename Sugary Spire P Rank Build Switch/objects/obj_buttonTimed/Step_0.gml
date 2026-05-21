if (countdownCounter > 0 && currentState == ButtonState.PRESSED)
{
    countdownCounter--;
    
    if (countdownCounter <= 0)
    {
        currentState = ButtonState.REVERTING;
        sprite_index = spr_Reverting;
    }
}
