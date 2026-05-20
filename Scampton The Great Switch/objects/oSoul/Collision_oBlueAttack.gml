image_xscale = 1;
image_yscale = 1;

if (TakeDamage && INV_SPEZ == 0)
{
    with (other)
    {
        if (!scrACp("NoDamage") && DamageTime == 0 && place_meeting(x, y, oSoul))
        {
            if (oSoul.i_Frames == 0)
            {
                oSoul.i_Frames = oSoul.i_F;
                oAlways.Damage = true;
            }
            
            if (Scale > 1.9)
                oSoul.BigHead += 1;
            else
                oSoul.SmallHead += 1;
            
            instance_destroy();
        }
    }
}
