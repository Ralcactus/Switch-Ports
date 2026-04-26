if (state == UnknownEnum.Value_0)
{
    if (other.state != UnknownEnum.Value_132 && other.state != UnknownEnum.Value_0 && other.state != UnknownEnum.Value_134 && other.state != UnknownEnum.Value_42)
    {
        with (other)
        {
            other.x = other.xstart;
            other.y = other.ystart;
            scr_taunt_storeVariables();
            state = UnknownEnum.Value_132;
            other.playerID = id;
        }
        
        state = UnknownEnum.Value_2;
    }
}
