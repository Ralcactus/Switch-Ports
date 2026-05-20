if (y == oMakeUI.Box_Y && !Die)
{
    image_index += 1;
    
    if (oP.NoHit == "Enabled")
        image_index += 1;
    
    sou(88);
    
    with (other)
    {
        if (Way == 1)
        {
            oSoul.W_bul -= 1;
            instance_destroy();
        }
        
        if (Way == 2)
        {
            oSoul.S_bul -= 1;
            instance_destroy();
        }
        
        if (Way == 3)
        {
            oSoul.A_bul -= 1;
            instance_destroy();
        }
        
        if (Way == 4)
        {
            oSoul.D_bul -= 1;
            instance_destroy();
        }
    }
    
    if (image_index > 1)
    {
        Die = true;
    }
    else
    {
        White = 1;
        
        with (instance_create_depth(x, y, depth, oEEF))
        {
            Seed = "Pipis_B";
            sprite_index = sGoldenPipis_B;
            image_xscale = 1;
            image_yscale = 1;
        }
        
        with (instance_create_depth(x, y, depth, oEEF))
        {
            Seed = "Pipis_B";
            sprite_index = sGoldenPipis_B;
            image_xscale = 1;
            image_yscale = 1;
        }
        
        with (instance_create_depth(x, y, depth, oEEF))
        {
            Seed = "Pipis_B";
            sprite_index = sGoldenPipis_B;
            image_xscale = 1;
            image_yscale = 1;
        }
    }
}
