x = lerp(x, player.x - 200, 1);
y = lerp(y, player.y - 110, 0.05);

if (state == UnknownEnum.Value_1)
{
    sprite_index = spr_beefarmer_sing;
    
    if (alarm[0] == -1)
        alarm[0] = singLength;
}
else if (state == UnknownEnum.Value_0)
{
    sprite_index = spr_beefarmer;
    
    if (alarm[1] == -1)
        alarm[1] = singWaitTime;
}
else if (state == UnknownEnum.Value_2)
{
    sprite_index = spr_beefarmer;
}
else if (state == UnknownEnum.Value_3)
{
    sprite_index = spr_beefarmer_sing;
}
