KeyZ = keyboard_check(ord("Z"));

if (keyboard_check(vk_enter))
    KeyZ = true;

if (KeyZ)
    Ztyme += 1;
else
    Ztyme = 0;

if (HitTime > 0)
    HitTime += 1;

if (KeyZ && Ztyme == 1 && HitTime == 0)
    HitTime = 1;

Tyme += 1;

if ((round(Tyme / 3) * 3) == Tyme && Tyme != TimePlod && Tyme != (TimePlod - 1))
{
    with (instance_create_depth(x, y, -9999, oCC))
    {
        image_xscale = 2;
        image_yscale = 2;
        Seed = "RB_EEF";
        sprite_index = sRude;
        image_speed = 0.5;
        image_angle = other.image_angle;
        direction = image_angle;
    }
}

image_angle += Turn;
direction = image_angle;

if (Tyme == TimePlod)
{
    with (instance_create_depth(x, y, -9999, oCC))
    {
        image_angle = 45;
        speed = 20;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
        Seed = "RB_PLOD";
        sprite_index = sRude;
        direction = image_angle;
    }
    
    with (instance_create_depth(x, y, -9999, oCC))
    {
        image_angle = 45;
        speed = 25;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
        Seed = "RB_PLOD";
        sprite_index = sRude;
        direction = image_angle;
    }
    
    with (instance_create_depth(x, y, -9999, oCC))
    {
        image_angle = 135;
        speed = 20;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
        Seed = "RB_PLOD";
        sprite_index = sRude;
        direction = image_angle;
    }
    
    with (instance_create_depth(x, y, -9999, oCC))
    {
        image_angle = 135;
        speed = 25;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
        Seed = "RB_PLOD";
        sprite_index = sRude;
        direction = image_angle;
    }
    
    with (instance_create_depth(x, y, -9999, oCC))
    {
        image_angle = 225;
        speed = 20;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
        Seed = "RB_PLOD";
        sprite_index = sRude;
        direction = image_angle;
    }
    
    with (instance_create_depth(x, y, -9999, oCC))
    {
        image_angle = 225;
        speed = 25;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
        Seed = "RB_PLOD";
        sprite_index = sRude;
        direction = image_angle;
    }
    
    with (instance_create_depth(x, y, -9999, oCC))
    {
        image_angle = 315;
        speed = 20;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
        Seed = "RB_PLOD";
        sprite_index = sRude;
        direction = image_angle;
    }
    
    with (instance_create_depth(x, y, -9999, oCC))
    {
        image_angle = 315;
        speed = 25;
        image_speed = 0;
        image_xscale = 2;
        image_yscale = 2;
        Seed = "RB_PLOD";
        sprite_index = sRude;
        direction = image_angle;
    }
    
    with (oCC)
    {
        if (Seed == "2nd")
        {
            Var1 = 2;
            Tyme = 2;
            oSpamtonRig.Index_Head = 12;
            instance_destroy(oTextEngine);
        }
    }
    
    oSpamtonRig.LimbShake = 15;
    sou(36);
    oSpamtonRig.Glow = true;
    
    if (oAlways.GameON)
    {
        if (oMakeUI.End == "G")
        {
            oMakeUI.G_Fight += 20;
            i1 = round(225 / oMakeUI.G_Fight);
            scrNumber(425, 155, 288, make_color_rgb(204, 153, 204), 0, i1, 0);
            oMakeUI.SpamtonHP -= i1;
        }
        else if (HitTime != 0 && HitTime <= 10)
        {
            scrNumber(425, 155, 288, make_color_rgb(204, 153, 204), 0, 255, 0);
            oMakeUI.SpamtonHP -= 255;
        }
        else
        {
            scrNumber(425, 155, 288, make_color_rgb(204, 153, 204), 0, 225, 0);
            oMakeUI.SpamtonHP -= 225;
        }
    }
    
    instance_destroy();
}
