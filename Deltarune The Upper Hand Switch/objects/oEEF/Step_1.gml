ty++;

if (arrayContains(seed, "color_green") && ty == 1)
    color = rgb(0, 255, 0);

if (arrayContains(seed, "scale2") && ty == 1)
{
    image_xscale = 2;
    image_yscale = 2;
}

if (arrayContains(seed, "scale0.1") && ty == 1)
{
    image_xscale = 0.1;
    image_yscale = 0.1;
}

if (arrayContains(seed, "randomScale") && ty == 1)
{
    randomScale = irandom_range(10, 20) / 10;
    image_xscale = randomScale;
    image_yscale = randomScale;
}

if (arrayContains(seed, "loopDie"))
{
    if (imageCount < image_index)
        imageCount = image_index;
    
    if (imageCount > image_index)
        des(0);
}

if (arrayContains(seed, "ghostDie"))
{
    if (ty == 1)
    {
        if (arrayContains(seed, "halfGhost"))
            ghost_die = 0.5;
        else
            ghost_die = 1;
    }
    
    if (ghost_die != 0)
    {
        if (arrayContains(seed, "halfGhost"))
            ghost_die -= 0.05;
        else
            ghost_die -= 0.1;
    }
    else
    {
        des(0);
    }
}

if (arrayContains(seed, "FSxy"))
{
    if (ty == 1)
    {
        image_xscale = 6;
        image_yscale = 38;
    }
}

if (arrayContains(seed, "stickEnd"))
{
    if (!arrayContains(seed, "notStick"))
    {
        if (x == 88)
            color = rgb(255, 255, 0);
    }
    
    image_xscale += 0.2;
    image_yscale += 0.2;
    
    if (arrayContains(seed, "bigger"))
    {
        image_xscale += 0.2;
        image_yscale += 0.2;
    }
}

if (arrayContains(seed, "boxAtro") && ty == 1)
{
    image_xscale = oBox.image_xscale;
    image_yscale = oBox.image_yscale;
    image_angle = oBox.image_angle;
}

if (arrayContains(seed, "heartOut"))
{
    if (ty == 1 || ty == 4 || ty == 7)
        spawnEEF(x, y, sSymb, 4, "stickEnd,ghostDie,notStick,bigger");
    
    if (ty == 50)
        des(0);
}

if (arrayContains(seed, "walkRight"))
{
    if (ty == 1)
        i = irandom_range(1, 5) * 2;
    
    x += i;
}

if (arrayContains(seed, "healStar"))
{
    if (ty == 1)
    {
        i1 = irandom_range(1, 6);
        i2 = -irandom_range(5, 10);
        i3 = irandom_range(-10, 10);
    }
    
    x += i1;
    y += i2;
    image_angle += i3;
    i1 *= 0.9;
    i2 *= 0.9;
    
    if (ty > 10)
        image_alpha -= 0.1;
    
    if (image_index > 6)
        des(0);
}

if (arrayContains(seed, "spawnRude"))
{
    if (ty == 1)
    {
        i = 8;
        res_j();
    }
    
    use_keys();
    
    if (TapZ)
        j += 4;
    
    if (!(ty % 2))
    {
        with (instance_create_depth(x, y, -15100, oEEF))
        {
            seed = ["drawN", "ghostDie", "rude"];
            sprite_index = sRude;
            image_index = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_angle = -other.i * 3;
        }
    }
    
    if (ty == 18)
    {
        res_i();
        
        repeat (4)
        {
            with (instance_create_depth(x, y, -15100, oEEF))
            {
                seed = ["drawN", "rudeDes"];
                sprite_index = sRude;
                image_index = 0;
                image_xscale = 2;
                image_yscale = 1.75;
                speed = 6;
                direction = 45 + (other.i * 90);
                image_angle = direction;
                x += (dcos(image_angle) * 30);
                y -= (dsin(image_angle) * 30);
            }
            
            with (instance_create_depth(x, y, -15100, oEEF))
            {
                seed = ["drawN", "rudeDes"];
                sprite_index = sRude;
                image_index = 0;
                image_xscale = 2;
                image_yscale = 2;
                speed = 7;
                direction = 45 + (other.i * 90);
                image_angle = direction;
                x += (dcos(image_angle) * 40);
                y -= (dsin(image_angle) * 40);
            }
            
            i++;
        }
        
        snd(snd_rudebusterHit);
        screenShake(3, 3);
        damageEne(0, clamp(1, 0, array_length(op.party) - 1), round((430 + j) * oBUI.ATKmult * op.custom_partyATK), 0);
        setHand(0, [sNothing, sNothing]);
        setHand(1, [sHand_Hurt, sHand_HurtM]);
        oEnemie.shake = 15;
        oEnemie.armScaleType[1] = 2;
        oEnemie.armExtraScale[1] = -1.25;
        des();
    }
    
    x += 16;
    y += i;
    i -= 1.3;
}

if (arrayContains(seed, "rude"))
{
    image_yscale += ((0 - image_yscale) / 10);
    
    if (ty > 20)
        des();
}

if (arrayContains(seed, "rudeDes"))
{
    speed += ((0 - speed) / 10);
    image_xscale += ((0 - image_xscale) / 10);
    
    if (image_xscale < 0.05)
        des();
    
    image_alpha -= 0.025;
}

if (arrayContains(seed, "alex"))
{
    if (ty == 1)
    {
        res_i();
        i1 = irandom_range(-3, 3);
        i2 = irandom_range(-10, 0);
    }
    
    x += i1;
    y += i2;
    i2 += 0.5;
    
    if (y > (oPlayer.y + 320))
        des();
}

if (arrayContains(seed, "grow1"))
{
    image_xscale += 0.2;
    image_yscale += 0.2;
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (arrayContains(seed, "grow2"))
{
    image_xscale += 0.5;
    image_yscale += 0.5;
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (arrayContains(seed, "starLeave"))
{
    if (ty == 1)
        image_alpha = 0;
    
    image_speed = 1;
    color = 0;
    image_alpha += 0.2;
    y -= 8;
}

if (arrayContains(seed, "MSU_walk1"))
{
    if (ty == 1)
    {
        image_alpha = 1;
        image_xscale = 2;
        image_yscale = 2;
    }
    
    x += 2;
    image_alpha -= (1/30);
    
    if (ty == 30)
        des();
}

if (arrayContains(seed, "MSU_walk2"))
{
    if (ty == 1)
    {
        image_alpha = 1;
        image_xscale = 2;
        image_yscale = 2;
    }
    
    x += 4;
    image_alpha -= (1/30);
    
    if (ty == 30)
        des();
}

if (array_contains(seed, "ending_star"))
{
    if (ty == 1)
    {
        depth = 0;
        
        if (!array_contains(seed, "specialFIX"))
        {
            image_xscale = 2;
            image_yscale = 2;
        }
        
        res_i();
        
        while (i1 == 0)
            i1 = irandom_range(-4, 4);
        
        while (i2 == 0)
            i2 = irandom_range(-4, 4);
    }
    
    x += i1;
    y += i2;
    
    if (ty <= 10)
        image_alpha += 0.1;
    
    if (ty > 30)
    {
        image_alpha -= 0.1;
        
        if (image_alpha <= 0)
            des();
    }
}
