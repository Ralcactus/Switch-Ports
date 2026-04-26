event_inherited();

if (!active)
{
    if (state != UnknownEnum.Value_0)
        state = UnknownEnum.Value_0;
    
    if (baddieStunTimer > 0)
        active = true;
}
