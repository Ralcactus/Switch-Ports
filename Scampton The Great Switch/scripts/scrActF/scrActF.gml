function scrActF()
{
    ActionFound = true;
    PepDid = Pep;
    
    if (SixS != 5 && SixS != 6)
    {
        with (oPep)
        {
            if (Pep == (other.PepDid + 1))
                image_speed = 1;
        }
    }
}
