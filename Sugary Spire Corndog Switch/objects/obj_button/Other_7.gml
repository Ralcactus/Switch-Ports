if (currentState == UnknownEnum.Value_2)
{
    currentState = UnknownEnum.Value_1;
    sprite_index = spr_Pressed;
}
else if (currentState == UnknownEnum.Value_3)
{
    currentState = UnknownEnum.Value_0;
    sprite_index = spr_Released;
}
