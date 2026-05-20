function scrGoldenPipisDie()
{
    oAlways.GoldenPipisPoints = 1;
    
    if (oP.NoHit == "Disabled")
        instance_create_depth(320, -20, -8888, oGoldenPipis);
    
    with (instance_create_depth(x, y, depth, oEEF))
    {
        Seed = "Pipis_B";
        sprite_index = sGoldenPipis_B;
    }
    
    with (instance_create_depth(x, y, depth, oEEF))
    {
        Seed = "Pipis_B";
        sprite_index = sGoldenPipis_B;
    }
    
    with (instance_create_depth(x, y, depth, oEEF))
    {
        Seed = "Pipis_B";
        sprite_index = sGoldenPipis_B;
    }
    
    with (instance_create_depth(x, y, depth - 1000, oEEF))
    {
        Seed = "BallBye";
        sprite_index = sBallBye;
    }
    
    with (instance_create_depth(x, y, -6666, oEEF))
    {
        Seed = "BlastRing2";
        sprite_index = sCircle;
        image_xscale = 0;
        image_yscale = 0;
    }
    
    sou(83);
    sou(83);
    
    for (SpamRing += 1; SpamRing != 19; SpamRing += 1)
        scrMakeAttack(oWhiteAttack, "5speed@TickSound", x, y, 0, 0, 0, 0, 0, 47, 0, 0, 1, 1, 0, SpamRing * 20);
    
    instance_destroy();
}
