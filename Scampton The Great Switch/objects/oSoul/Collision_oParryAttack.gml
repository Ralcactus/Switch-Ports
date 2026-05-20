if (other.ParryWait == 0)
{
    if (oP.PinkMode == 0 || ParryTime == 0)
    {
        with (other)
        {
            other.CheckTime_ParryHit = CT_PH;
            CT_PH -= 1;
            
            if (scrACp("BlueDam"))
            {
                CT_PH = 0;
                other.CheckTime_ParryHit = 0;
            }
        }
        
        if (TakeDamage && INV_SPEZ == 0 && CheckTime_ParryHit == 0)
        {
            with (other)
            {
                if (!scrACp("NoDamage") && DamageTime == 0 && ParryFrame == 0)
                {
                    if (oSoul.i_Frames == 0)
                    {
                        oSoul.i_Frames = oSoul.i_F;
                        oAlways.Damage = true;
                    }
                    
                    if (!scrACp("NoDestroy"))
                        instance_destroy();
                }
            }
        }
    }
    else
    {
        with (other)
        {
            ParryPlode();
            
            if (scrACp("NoDestroy"))
                ParryFrame = 5;
            
            if (!scrACp("ParFree"))
            {
                if (scrACp("ParEvDes"))
                    oPattern.ParryEvent = 1;
                
                des(0);
            }
            else
            {
                PPP = 1;
                ParryWait = 10;
                oPattern.ParryEvent = 1;
            }
            
            if (scrACp("BOMB"))
            {
                WalkY = -12;
                i1 = 1;
                oPattern.Var2 += 0.1;
                audio_sound_pitch(snd_Parry, oPattern.Var2);
            }
        }
    }
}
