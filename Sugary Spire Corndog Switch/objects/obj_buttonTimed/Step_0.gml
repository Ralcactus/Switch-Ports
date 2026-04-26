if (countdownCounter > 0 && currentState == UnknownEnum.Value_1)
{
    countdownCounter--;
    
    if (countdownCounter <= 0)
    {
        currentState = UnknownEnum.Value_3;
        sprite_index = spr_Reverting;
    }
}
