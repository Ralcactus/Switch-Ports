with (playerID)
{
    for (var i = 0; i < 9; i++)
    {
        var h_sign = (i % 3) - 1;
        var v_sign = floor(i / 3) - 1;
        
        if (h_sign != 0 && v_sign != 0)
        {
            with (create_afterimage(choose(UnknownEnum.Value_1, UnknownEnum.Value_2), xscale))
            {
                hsp = h_sign * 20;
                vsp = v_sign * 20;
                alarm[0] = 60;
                alarm[1] = 999;
                gonealpha = 1;
                image_alpha = 1;
            }
        }
    }
}

instance_destroy();
