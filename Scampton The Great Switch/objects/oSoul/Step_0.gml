if (oMakeUI.HurtMode == 0)
    i_F = 75;

if (oMakeUI.HurtMode == 1)
    i_F = 110;

if (oMakeUI.HurtMode == 2)
    i_F = 40;

image_xscale = 1;
image_yscale = 1;

if (ParryTime != 0)
    ParryTime -= 1;

if (ParryDelay != 0)
    ParryDelay -= 1;

if (i_Frames != 0)
    i_Frames -= 1;

if (INV_SPEZ > 0)
    INV_SPEZ -= 1;

if (INV_SPEZ < 0)
    INV_SPEZ = 0;

if (oAlways.Chield != 0)
{
    ChieldBlink += 1;
    
    if (ChieldBlink >= 21)
        ChieldBlink = 0;
}
else
{
    ChieldBlink = 0;
}

if (oP.KeyT == 1)
    KeyW = keyboard_check(ord("W"));
else
    KeyW = keyboard_check(ord("Z"));

KeyS = keyboard_check(ord("S"));

if (oP.KeyT == 1)
    KeyA = keyboard_check(ord("A"));
else
    KeyA = keyboard_check(ord("Q"));

KeyD = keyboard_check(ord("D"));
KeyUP = keyboard_check(vk_up);

if (keyboard_check(ord("W")))
    KeyUP = true;

KeyDOWN = keyboard_check(vk_down);

if (keyboard_check(ord("S")))
    KeyDOWN = true;

KeyLEFT = keyboard_check(vk_left);

if (keyboard_check(ord("A")))
    KeyLEFT = true;

KeyRIGHT = keyboard_check(vk_right);

if (keyboard_check(ord("D")))
    KeyRIGHT = true;

KeyZ = keyboard_check(ord("Z"));

if (keyboard_check(vk_enter))
    KeyZ = true;

KeyX = keyboard_check(ord("X"));

if (keyboard_check(vk_shift))
    KeyX = true;

if (Seed == "Glide" || Seed == "EndPattern")
{
    KeyUP = false;
    KeyDOWN = false;
    KeyLEFT = false;
    KeyRIGHT = false;
    KeyZ = false;
    KeyX = false;
}

if (KeyLEFT)
    SpinDer = 0;

if (KeyRIGHT)
    SpinDer = 1;

if (KeyUP)
    UPtyme += 1;
else
    UPtyme = 0;

if (KeyDOWN)
    DOWNtyme += 1;
else
    DOWNtyme = 0;

if (KeyLEFT)
    LEFTtyme += 1;
else
    LEFTtyme = 0;

if (KeyRIGHT)
    RIGHTtyme += 1;
else
    RIGHTtyme = 0;

if (KeyZ)
    Ztyme += 1;
else
    Ztyme = 0;

if (KeyX)
    Xtyme += 1;
else
    Xtyme = 0;

if (SoulMode == 0)
{
    if (KeyW)
    {
        Wtyme += 1;
    }
    else
    {
        Wtyme = 0;
        
        if (oAlways.SoulSpez)
            Wtyme = 1;
    }
    
    if (KeyS)
    {
        Styme += 1;
    }
    else
    {
        Styme = 0;
        
        if (oAlways.SoulSpez)
            Styme = 1;
    }
    
    if (KeyA)
    {
        Atyme += 1;
    }
    else
    {
        Atyme = 0;
        
        if (oAlways.SoulSpez)
            Atyme = 1;
    }
    
    if (KeyD)
    {
        Dtyme += 1;
    }
    else
    {
        Dtyme = 0;
        
        if (oAlways.SoulSpez)
            Dtyme = 1;
    }
}
else
{
    KeyW = false;
    KeyS = false;
    KeyA = false;
    KeyD = false;
}

if (!KeyUP && !KeyDOWN && !KeyLEFT && !KeyRIGHT)
    SlowFirst = 0;
else if (SlowFirst == 0)
    SlowFirst = 1;

if (oAlways.SoulSpez)
    BigHoldTime = 41;
else
    BigHoldTime = 35;

if (CanMove && (round(oAlways.Tyme / 2) * 2) == oAlways.Tyme)
{
    Speed = 5;
    
    if (KeyX)
        Speed = 2;
    
    x += MoveX;
    y += MoveY;
    MoveX -= sign(MoveX);
    MoveY -= sign(MoveY);
    
    if (SlowFirst == 1)
    {
        SlowFirst = 2;
        Speed = 3;
    }
    
    if (KeyUP)
    {
        if (!place_meeting(x, y - Speed, oGoldenPipis))
            y -= Speed;
    }
    
    if (KeyDOWN)
    {
        if (!place_meeting(x, y + Speed, oGoldenPipis))
            y += Speed;
    }
    
    if (KeyLEFT)
    {
        if (!place_meeting(x - Speed, y, oGoldenPipis))
            x -= Speed;
    }
    
    if (KeyRIGHT)
    {
        if (!place_meeting(x + Speed, y, oGoldenPipis))
            x += Speed;
    }
}

instance_destroy(oChield);

if (oAlways.PointyGuard != 0)
{
    if (CanMove)
    {
        with (instance_create_depth(x, y, depth, oChield))
        {
            image_angle = other.image_angle;
            direction = other.direction;
        }
        
        if ((round(oAlways.Tyme / 2) * 2) == oAlways.Tyme)
            instance_create_depth(x, y, depth, oChield_2);
    }
}

instance_destroy(oGraze);

if (CanMove && false)
    instance_create_depth(x, y, -9999, oGraze);

if (CanShot)
{
    ShotWay = 0;
    
    if (KeyW && BigShotWay == 0)
    {
        BigShotWay = 1;
        BigTyme = 0;
        
        if (oAlways.SoulSpez)
            BigTyme = 10;
    }
    
    if (KeyS && BigShotWay == 0)
    {
        BigShotWay = 2;
        BigTyme = 0;
        
        if (oAlways.SoulSpez)
            BigTyme = 10;
    }
    
    if (KeyA && BigShotWay == 0)
    {
        BigShotWay = 3;
        BigTyme = 0;
        
        if (oAlways.SoulSpez)
            BigTyme = 10;
    }
    
    if (KeyD && BigShotWay == 0)
    {
        BigShotWay = 4;
        BigTyme = 0;
        
        if (oAlways.SoulSpez)
            BigTyme = 10;
    }
    
    if (BigShotWay != 0)
        scrTurnSoul(BigShotWay);
    
    if (BigShotWay != 0)
        BigTyme += 1;
    else
        BigTyme = 0;
    
    if (BigTyme == (BigHoldTime - 22))
    {
        with (instance_create_depth(x, y, -8888, oBigBulletEffect))
            Seed = other.Soul_ID;
    }
    
    if ((!KeyW && BigShotWay == 1) || (!KeyS && BigShotWay == 2) || (!KeyA && BigShotWay == 3) || (!KeyD && BigShotWay == 4))
    {
        if (BigTyme >= BigHoldTime)
        {
            if (oAlways.MultiShot != 0)
            {
                with (instance_create_depth(x, y, -30000, oBigBullet))
                {
                    if (other.BigShotWay == 1)
                    {
                        y -= 10;
                        Way = 1;
                        image_angle = 90;
                    }
                    
                    if (other.BigShotWay == 2)
                    {
                        y += 10;
                        Way = 2;
                        image_angle = -90;
                    }
                    
                    if (other.BigShotWay == 3)
                    {
                        x -= 10;
                        Way = 3;
                        image_angle = 180;
                    }
                    
                    if (other.BigShotWay == 4)
                    {
                        x += 10;
                        Way = 4;
                        image_angle = 0;
                    }
                    
                    image_angle += 8;
                    direction = image_angle;
                    other.BigDelay = 20;
                }
                
                with (instance_create_depth(x, y, -30000, oBigBullet))
                {
                    if (other.BigShotWay == 1)
                    {
                        y -= 10;
                        Way = 1;
                        image_angle = 90;
                    }
                    
                    if (other.BigShotWay == 2)
                    {
                        y += 10;
                        Way = 2;
                        image_angle = -90;
                    }
                    
                    if (other.BigShotWay == 3)
                    {
                        x -= 10;
                        Way = 3;
                        image_angle = 180;
                    }
                    
                    if (other.BigShotWay == 4)
                    {
                        x += 10;
                        Way = 4;
                        image_angle = 0;
                    }
                    
                    image_angle -= 8;
                    direction = image_angle;
                    other.BigDelay = 20;
                }
            }
            else
            {
                with (instance_create_depth(x, y, -30000, oBigBullet))
                {
                    if (other.BigShotWay == 1)
                    {
                        y -= 10;
                        Way = 1;
                        image_angle = 90;
                    }
                    
                    if (other.BigShotWay == 2)
                    {
                        y += 10;
                        Way = 2;
                        image_angle = -90;
                    }
                    
                    if (other.BigShotWay == 3)
                    {
                        x -= 10;
                        Way = 3;
                        image_angle = 180;
                    }
                    
                    if (other.BigShotWay == 4)
                    {
                        x += 10;
                        Way = 4;
                        image_angle = 0;
                    }
                    
                    direction = image_angle;
                    other.BigDelay = 20;
                }
            }
            
            if (oAlways.MultiShot != 0)
                oAlways.MultiShot -= 1;
        }
        else
        {
            instance_destroy(oBigBulletEffect);
            
            if (BigTyme > 10)
            {
                if (BigShotWay == 1)
                {
                    KeyW = true;
                    Wtyme = 1;
                }
                
                if (BigShotWay == 2)
                {
                    KeyS = true;
                    Styme = 1;
                }
                
                if (BigShotWay == 3)
                {
                    KeyA = true;
                    Atyme = 1;
                }
                
                if (BigShotWay == 4)
                {
                    KeyD = true;
                    Dtyme = 1;
                }
            }
            
            BigDelay = 0;
        }
        
        BigShotWay = 0;
        BigTyme = 1;
    }
    
    if (BigDelay == 0)
    {
        if (BigTyme == 0 || BigTyme == 1)
        {
            if ((W_bul + S_bul + A_bul + D_bul) <= 5)
            {
                if (KeyW && Wtyme == 1 && W_bul < BulletLimit)
                    ShotWay = 1;
                
                if (KeyS && Styme == 1 && S_bul < BulletLimit)
                    ShotWay = 2;
                
                if (KeyA && Atyme == 1 && A_bul < BulletLimit)
                    ShotWay = 3;
                
                if (KeyD && Dtyme == 1 && D_bul < BulletLimit)
                    ShotWay = 4;
            }
        }
        
        scrTurnSoul(ShotWay);
    }
    else
    {
        BigDelay -= 1;
    }
    
    if (ShotWay != 0)
    {
        if (oAlways.MultiShot != 0)
        {
            with (instance_create_depth(x, y, -30000, oBullet))
            {
                image_angle = other.image_angle;
                image_angle += 8;
                direction = image_angle;
                
                if (other.ShotWay == 1)
                {
                    y -= 15;
                    Way = 1;
                    other.W_bul += 1;
                }
                
                if (other.ShotWay == 2)
                {
                    y += 15;
                    Way = 2;
                    other.S_bul += 1;
                }
                
                if (other.ShotWay == 3)
                {
                    x -= 15;
                    Way = 3;
                    other.A_bul += 1;
                }
                
                if (other.ShotWay == 4)
                {
                    x += 15;
                    Way = 4;
                    other.D_bul += 1;
                }
            }
            
            with (instance_create_depth(x, y, -30000, oBullet))
            {
                image_angle = other.image_angle;
                image_angle -= 8;
                direction = image_angle;
                
                if (other.ShotWay == 1)
                {
                    y -= 15;
                    Way = 1;
                    other.W_bul += 1;
                }
                
                if (other.ShotWay == 2)
                {
                    y += 15;
                    Way = 2;
                    other.S_bul += 1;
                }
                
                if (other.ShotWay == 3)
                {
                    x -= 15;
                    Way = 3;
                    other.A_bul += 1;
                }
                
                if (other.ShotWay == 4)
                {
                    x += 15;
                    Way = 4;
                    other.D_bul += 1;
                }
            }
        }
        else
        {
            with (instance_create_depth(x, y, -30000, oBullet))
            {
                image_angle = other.image_angle;
                direction = image_angle;
                
                if (other.ShotWay == 1)
                {
                    y -= 15;
                    Way = 1;
                    other.W_bul += 1;
                }
                
                if (other.ShotWay == 2)
                {
                    y += 15;
                    Way = 2;
                    other.S_bul += 1;
                }
                
                if (other.ShotWay == 3)
                {
                    x -= 15;
                    Way = 3;
                    other.A_bul += 1;
                }
                
                if (other.ShotWay == 4)
                {
                    x += 15;
                    Way = 4;
                    other.D_bul += 1;
                }
            }
        }
        
        if (oAlways.MultiShot != 0)
            oAlways.MultiShot -= 1;
        
        ShotWay = 0;
        BigTyme = 0;
    }
}

if (ChargeSound != 0 && BigTyme < (BigHoldTime - 1))
{
    ChargeSound = 0;
    audio_stop_sound(snd_chargeshot_charge);
}

if (SoulMode == 1)
{
    if (KeyZ && Ztyme == 1 && ParryDelay == 0)
    {
        ParryTime = 10;
        ParryDelay = 15;
        Size = 1.5;
        
        if (SpinDer == 1)
            TargetROT += 360;
        else
            TargetROT -= 360;
        
        if (SpinDer == 0)
            SpinDer = 1;
        else
            SpinDer = 0;
        
        if (KeyLEFT)
            x -= 4;
        
        if (KeyRIGHT)
            x += 4;
        
        if (KeyUP)
            y -= 4;
        
        if (KeyDOWN)
            y += 4;
    }
}

if (CanMove && (round(oAlways.Tyme / 2) * 2) == oAlways.Tyme)
{
    if (ForceWall_Y != 0)
    {
        if (y > (oMakeUI.Box_Y + ForceWall_Y))
            y = oMakeUI.Box_Y + ForceWall_Y;
        
        if (y < (oMakeUI.Box_Y - ForceWall_Y))
            y = oMakeUI.Box_Y - ForceWall_Y;
    }
    else
    {
        if (y > ((oMakeUI.Box_Y + (oMakeUI.Box_Yscale * 6)) - 12))
            y = (oMakeUI.Box_Y + (oMakeUI.Box_Yscale * 6)) - 12;
        
        if (y < ((oMakeUI.Box_Y - (oMakeUI.Box_Yscale * 6)) + 12))
            y = (oMakeUI.Box_Y - (oMakeUI.Box_Yscale * 6)) + 12;
    }
    
    if (ForceWall_X != 0)
    {
        if (x > (oMakeUI.Box_X + ForceWall_X))
            x = oMakeUI.Box_X + ForceWall_X;
        
        if (x < (oMakeUI.Box_X - ForceWall_X))
            x = oMakeUI.Box_X - ForceWall_X;
    }
    else
    {
        if (x > ((oMakeUI.Box_X + (oMakeUI.Box_Xscale * 6)) - 12))
            x = (oMakeUI.Box_X + (oMakeUI.Box_Xscale * 6)) - 12;
        
        if (x < ((oMakeUI.Box_X - (oMakeUI.Box_Xscale * 6)) + 12))
            x = (oMakeUI.Box_X - (oMakeUI.Box_Xscale * 6)) + 12;
    }
}

image_xscale = Size * 2;
image_yscale = Size * 2;
