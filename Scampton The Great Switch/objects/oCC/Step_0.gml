if (!oAlways.StopCCtyme)
    Tyme += 1;

TymeFree += 1;

if (Seed == "1st")
{
    if (Tyme == 1)
    {
        oSpamtonRig.AnSpeed = 0;
        oSpamtonRig.Animation = "";
        instance_destroy(oTextEngine);
        sou(88);
        oSpamtonRig.R_Arm_Rot = irandom_range(-45, 45);
        oSpamtonRig.R_Arm_TargetRot = oSpamtonRig.R_Arm_Rot;
        oSpamtonRig.L_Arm_Rot = irandom_range(-45, 45);
        oSpamtonRig.L_Arm_TargetRot = oSpamtonRig.L_Arm_Rot;
        oSpamtonRig.R_Leg_Rot = irandom_range(-45, 45);
        oSpamtonRig.R_Leg_TargetRot = oSpamtonRig.R_Leg_Rot;
        oSpamtonRig.L_Leg_Rot = irandom_range(-45, 45);
        oSpamtonRig.L_Leg_TargetRot = oSpamtonRig.L_Leg_Rot;
        oSpamtonRig.Index_Head = 2;
        oSpamtonRig.StringShake = 4;
        oSpamtonRig.Index_String1 = 13;
        oSpamtonRig.HeadROT = -20;
    }
    
    if (Tyme == 175)
    {
        oSusie.SusieMouth = false;
        oSpamtonRig.Animation = "Dead";
        oSpamtonRig.Var1 = 0;
        oSpamtonRig.Var2 = 0;
        oSpamtonRig.BackBlack = true;
        scrShowParty(false);
    }
    
    if (Tyme >= 175)
    {
        oSpamtonRig.BodX -= (oAlways.BCspeed * 5);
        oAlways.BCspeed *= 0.95;
    }
    
    if (Tyme == 450)
    {
        oSpamtonRig.Animation = "";
        
        with (instance_create_depth(240, -100, -9999, oCC))
        {
            Seed = "Nail_1";
            sprite_index = sNeedles;
            image_yscale = 2;
            image_xscale = 2;
            image_angle = -80;
            direction = image_angle;
        }
        
        instance_destroy();
    }
}

if (Seed == "Nail_1")
{
    if (Tyme == 1)
        Var1 = 25;
    
    if (Tyme < 111)
        speed = Var1;
    
    if (Tyme >= 3 && Tyme <= 30)
        Var1 *= 0.75;
    
    if (Tyme >= 55 && Tyme <= 80)
        Var1 -= 0.1;
    
    if (Tyme == 80)
    {
        Var1 = 45;
        oSpamtonRig.SpezAN = "Line_1_Show";
        oSpamtonRig.Index_String1 = 11;
    }
    
    if (Tyme == 81)
    {
        audio_play_sound(Song_DealGoneWrong, 9999, true);
        audio_sound_pitch(Song_DealGoneWrong, 1);
        sou(88);
        oSpamtonRig.BackBlack = false;
        scrShowParty(true);
        layer_set_visible(layer_get_id("BC_5"), false);
        oSusie.sprite_index = sSusie_Ones;
        oSusie.image_index = 0;
        oRalsei.sprite_index = sRalsei_Ones;
        oRalsei.image_index = 0;
        
        with (instance_create_depth(330, 160, -9999, oCC))
            Seed = "AAA";
        
        with (instance_create_depth(-100, -100, -9999, oCC))
        {
            Seed = "FadeOut";
            sprite_index = sWhite;
            image_blend = c_red;
            image_xscale = 100;
            image_yscale = 100;
        }
    }
    
    if (Tyme >= 81)
        oSpamtonRig.LimbShake = 2;
    
    if (Tyme >= 81 && Tyme <= 110)
    {
        Var1 *= 0.85;
        oSpamtonRig.Index_Head = 20;
    }
    
    if (Tyme == 130)
    {
        Var1 = x;
        Var2 = -80;
        speed = 0;
    }
    
    if (Tyme >= 130 && Tyme <= 200)
    {
        Var2 += ((0 - Var2) / 20);
        image_angle = Var2;
        direction = image_angle;
        x += (((Var1 + 50) - x) / 20);
        y += ((400 - y) / 20);
    }
    
    if (Tyme == 200)
    {
        image_angle = 0;
        direction = 0;
        speed = 2;
    }
    
    if (Tyme >= 200)
    {
        speed += 0.1;
        
        if (image_angle != 90)
        {
            image_angle += 1.25;
            direction += 1.25;
        }
    }
    
    if (Tyme == 290)
    {
        Var1 = 0;
        Var2 = 0;
    }
    
    if (Tyme >= 290)
    {
        oSpamtonRig.R_Arm_TargetRot = 180;
        oSpamtonRig.LimbDelay = 20;
        Var1 += 0.1;
        Var2 += 0.025;
        oSpamtonRig.BodY -= Var1;
        oSpamtonRig.BodX += Var2;
        oSpamtonRig.WholeROT += ((0 - oSpamtonRig.WholeROT) / 15);
        oSpamtonRig.L_Arm_TargetRot += ((0 - oSpamtonRig.L_Arm_TargetRot) / 15);
        oSpamtonRig.R_Leg_TargetRot += ((0 - oSpamtonRig.R_Leg_TargetRot) / 15);
        oSpamtonRig.L_Leg_TargetRot += ((0 - oSpamtonRig.L_Leg_TargetRot) / 15);
    }
    
    if (Tyme == 300)
    {
        with (instance_create_depth(350, 60, -9999, oTextEngine))
        {
            Font = sFont_Sma;
            RGB = make_color_rgb(0, 0, 0);
            BC = false;
            image_xscale = 1;
            image_yscale = 1;
            Bubble_Xscale[0] = 4;
            Bubble_Yscale[0] = 1;
            Bubble_Arrow[0] = 1;
            Voice = snd_txtspam;
            Text[0] = "HELP ME";
        }
    }
    
    if (Tyme == 350)
        instance_destroy(oTextEngine);
    
    if (Tyme == 400)
    {
        with (instance_create_depth(0, 0, 0, oCC))
            Seed = "2nd";
        
        with (oCC)
        {
            if (Seed == "Nail_1_String")
                instance_destroy();
        }
        
        instance_destroy();
    }
}

if (Seed == "2nd")
{
    if (Var1 < 2)
    {
        if ((round(Tyme / 2) * 2) == Tyme)
            oSpamtonRig.R_Arm_TargetRot = 160 + irandom_range(-20, 20);
    }
    
    if (Tyme == 1)
    {
        Var1 = 0;
        audio_play_sound(snd_chain_extend, 0, true);
        oSpamtonRig.Animation = "Dang_1";
        oSpamtonRig.AnSpeed = 0.25;
        oSpamtonRig.LimbDelay = 10;
        oSpamtonRig.BodX = 450;
        oSpamtonRig.BodY = -100;
        oSpamtonRig.L_Arm_TargetRot = 0;
        oSpamtonRig.Index_Head = 16;
        oSpamtonRig.SpezAN = 0;
        oSpamtonRig.String_Arms = true;
        oSpamtonRig.StringROT = 0;
        oSpamtonRig.L_ArmStringScale = 0;
    }
    
    if (Tyme > 1 && Var1 == 0)
    {
        oSpamtonRig.LimbShake = 2;
        oSpamtonRig.BodY += 2;
        
        if (oSpamtonRig.BodY >= 150)
        {
            oSpamtonRig.BodY = 150;
            Var1 = 1;
            Tyme = 2;
            oSpamtonRig.LimbShake = 10;
            Var2 = -1;
            oSpamtonRig.Animation = "Dang_2";
            audio_stop_sound(snd_chain_extend);
            sou(31);
        }
    }
    
    if (Var1 == 1)
    {
        oSpamtonRig.FallY += Var2;
        Var2 += 0.1;
        
        if (Tyme == 20)
            scrQuickBubText("DO SOMETHING!", 400, 120, 6.5, 1, 1, snd_txtspam);
        
        if (Tyme == 100)
        {
            with (instance_create_depth(700, 125, -9999, oCC))
            {
                Seed = "String_2";
                sprite_index = sNeedles;
                image_angle = 180;
                speed = 40;
                image_xscale = 2;
                image_yscale = 2;
                direction = image_angle;
            }
        }
        
        if (Tyme == 110)
            oSpamtonRig.LimbShake = 15;
        
        if (Tyme >= 110)
        {
            if ((round(Tyme / 2) * 2) == Tyme)
                oSpamtonRig.L_Arm_TargetRot = -160 + irandom_range(-20, 20);
            
            if (oSpamtonRig.L_ArmStringScale != 40)
                oSpamtonRig.L_ArmStringScale += 0.5;
        }
        
        if (Tyme == 130)
        {
            instance_destroy(oTextEngine);
            scrQuickBubText("PLEASE!", 400, 120, 4, 1, 1, snd_txtspam);
            oSpamtonRig.Index_Head = 20;
        }
        
        if (Tyme >= 130)
            oSpamtonRig.HeadROT = -45 + irandom_range(-8, 8);
        
        if (Tyme == 160)
        {
            oSusie.sprite_index = sSusie_Rude;
            oSusie.image_index = 9;
        }
    }
    
    if (Var1 == 2)
    {
        if (Tyme >= 400)
        {
        }
        else
        {
            if ((round(TymeFree / 2) * 2) == TymeFree)
                oSpamtonRig.R_Arm_TargetRot = 160 + irandom_range(-20, 20);
            
            if ((round(TymeFree / 2) * 2) == TymeFree)
                oSpamtonRig.L_Arm_TargetRot = -160 + irandom_range(-20, 20);
        }
        
        if (Tyme < 80)
            oSpamtonRig.HeadROT = -90 + irandom_range(-8, 8);
        
        if (Tyme == 80)
        {
            scrQuickBubText("DO SOMETHING@USEFUL!", 400, 120, 6.5, 2, 1, snd_txtspam);
            oSpamtonRig.Index_Head = 16;
            Var4 = 20;
        }
        
        if (Tyme >= 80 && Tyme < 200)
            oSpamtonRig.HeadROT += ((0 - oSpamtonRig.HeadROT) / 3);
        
        if (Tyme == (175 + Var4))
            Var3 = 1;
        
        if (Tyme > (175 + Var4))
        {
            Var3 += 0.02;
            audio_sound_pitch(Song_DealGoneWrong, Var3);
        }
        
        if (Tyme == (175 + Var4) || Tyme == (225 + Var4) || Tyme == (275 + Var4))
        {
            oSpamtonRig.Needle += 1;
            oSpamtonRig.LimbShake = 7;
            sou(88);
        }
        
        if (Tyme == (175 + Var4))
        {
            instance_destroy(oTextEngine);
            scrQuickBubText("OUCH", 400, 120, 2.75, 1, 1, snd_txtspam);
            oSpamtonRig.HeadROT = -25;
            oSusie.sprite_index = sSusie_Ones;
            oSusie.image_index = 0;
        }
        
        if (Tyme == (225 + Var4))
        {
            instance_destroy(oTextEngine);
            scrQuickBubText("YIKES", 400, 120, 3.25, 1, 1, snd_txtspam);
            oSpamtonRig.HeadROT = -50;
        }
        
        if (Tyme == (275 + Var4))
        {
            instance_destroy(oTextEngine);
            scrQuickBubText("MAKE IT STOP!", 400, 120, 6.5, 1, 1, snd_txtspam);
            oSpamtonRig.HeadROT = -75;
            oSpamtonRig.Index_Head = 20;
        }
        
        if (Tyme >= (275 + Var4))
            oSpamtonRig.LimbShake = 2;
        
        if (Tyme == (375 + Var4 + 50))
        {
            audio_stop_sound(Song_DealGoneWrong);
            oSpamtonRig.BackBlack = true;
            scrShowParty(false);
            oSpamtonRig._R = 0;
            oSpamtonRig._G = 0;
            oSpamtonRig._B = 0;
            instance_destroy(oTextEngine);
        }
        
        if (Tyme == (475 + Var4 + 50))
        {
            with (instance_create_depth(320, 240, -9999, oSoul))
                ForceSound = true;
            
            with (instance_create_depth(0, 0, 0, oCC))
                Seed = "Soul_CC";
            
            instance_destroy();
        }
    }
}

if (Seed == "String_2")
{
    if (Tyme == 5)
        sou(88);
    
    if (Tyme >= 5)
    {
        image_angle += ((90 - image_angle) / 3);
        direction = image_angle;
        speed += ((10 - speed) / 3);
    }
}

if (Seed == "RB_EEF")
{
    image_alpha -= 0.05;
    image_yscale -= 0.05;
    
    if (image_alpha == 0)
        instance_destroy();
}

if (Seed == "RB_PLOD")
{
    speed *= 0.85;
    image_xscale *= 0.9;
    image_alpha -= 0.01;
    
    if (image_alpha == 0)
        instance_destroy();
}

if (Seed == "InstaGone")
{
    if (Tyme == 3)
        instance_destroy();
}

if (Seed == "SoulPlod")
{
    image_xscale += 0.2;
    image_yscale += 0.2;
    image_alpha -= 0.025;
    
    if (image_alpha == 0)
        instance_destroy();
}

if (Seed == "WASD_BT")
{
    if (Tyme == 1)
        image_speed = 0;
    
    image_yscale += ((1 - image_yscale) / 10);
    image_alpha = abs(sin(oAlways.Tyme * 0.1));
}

if (Seed == "Shine_Back")
{
    if (Var1 == 0)
    {
        oSpamtonRig.BackWhiteA += 0.025;
        
        if (oSpamtonRig.BackWhiteA == 1)
        {
            Var1 = 1;
            layer_set_visible(layer_get_id("BC_5"), true);
        }
    }
    else
    {
        oSpamtonRig.BackWhiteA -= 0.025;
        
        if (oSpamtonRig.BackWhiteA <= 0)
            instance_destroy();
    }
}

if (Seed == "FadeOut")
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "Soul_CC")
{
    if (Var2 == 0)
    {
        if (oSoul.Tyme == 215)
        {
            with (instance_create_depth(360, 240, -7777, oCC))
            {
                Seed = "WASD_BT";
                sprite_index = sWASD;
                image_yscale = 0;
                image_index = 3;
            }
            
            with (instance_create_depth(680, 240, -9999, oBlueAttack))
            {
                Seed = "Intro_R";
                Loops = 7;
                AnSpeed = 4;
            }
            
            with (instance_create_depth(720, 240, -9999, oBlueAttack))
            {
                Seed = "Intro_R";
                Loops = 7;
                AnSpeed = 4;
            }
            
            with (instance_create_depth(760, 240, -9999, oBlueAttack))
            {
                Seed = "Intro_R";
                Loops = 7;
                AnSpeed = 4;
            }
            
            with (instance_create_depth(820, 240, -9999, oBlueAttack))
            {
                Seed = "Intro_R";
                Loops = 7;
                AnSpeed = 4;
                Scale = 2;
            }
        }
        
        if (oSoul.BigHead == 1 && Var1 == 0)
        {
            Var1 = 1;
            
            with (instance_create_depth(280, 240, -7777, oCC))
            {
                Seed = "WASD_BT";
                sprite_index = sWASD;
                image_yscale = 0;
                image_index = 1;
                
                if (oP.KeyT == 2)
                    image_index = 5;
            }
            
            with (instance_create_depth(-40, 240, -9999, oBlueAttack))
            {
                Seed = "Intro_L";
                Loops = 7;
                AnSpeed = 4;
                Xscale = -1;
            }
            
            with (instance_create_depth(-80, 240, -9999, oBlueAttack))
            {
                Seed = "Intro_L";
                Loops = 7;
                AnSpeed = 4;
                Xscale = -1;
            }
            
            with (instance_create_depth(-120, 240, -9999, oBlueAttack))
            {
                Seed = "Intro_L";
                Loops = 7;
                AnSpeed = 4;
                Xscale = -1;
            }
            
            with (instance_create_depth(-180, 240, -9999, oBlueAttack))
            {
                Seed = "Intro_L";
                Loops = 7;
                AnSpeed = 4;
                Scale = 2;
                Xscale = -1;
            }
        }
        
        if (oSoul.BigHead == 2 && Var1 == 1)
        {
            Var1 = 2;
            
            with (instance_create_depth(320, 280, -7777, oCC))
            {
                Seed = "WASD_BT";
                sprite_index = sWASD;
                image_yscale = 0;
                image_index = 2;
            }
            
            with (instance_create_depth(320, 580, -9999, oBlueAttack))
            {
                Seed = "Intro_D";
                Loops = 7;
                AnSpeed = 4;
                Xscale = -1;
            }
            
            with (instance_create_depth(320, 620, -9999, oBlueAttack))
            {
                Seed = "Intro_D";
                Loops = 7;
                AnSpeed = 4;
                Xscale = -1;
            }
            
            with (instance_create_depth(320, 680, -9999, oBlueAttack))
            {
                Seed = "Intro_D";
                Loops = 7;
                AnSpeed = 4;
                Scale = 2;
                Xscale = -1;
            }
        }
        
        if (oSoul.BigHead == 3 && Var1 == 2)
        {
            Var1 = 3;
            oSpamtonRig.Animation = "Dang_A";
            oAlways.BCspeed = 1;
            oSpamtonRig.Index_Head = 15;
            oSpamtonRig.Index_Arms = 18;
            oSpamtonRig.Index_Halo = 26;
            oSpamtonRig.Index_Torso = 39;
            oAlways.PepSlide = true;
            
            with (instance_create_depth(320, 200, -7777, oCC))
            {
                Seed = "WASD_BT";
                sprite_index = sWASD;
                image_yscale = 0;
                image_index = 0;
                
                if (oP.KeyT == 2)
                    image_index = 4;
            }
            
            with (instance_create_depth(320, -100, -9999, oBlueAttack))
            {
                Seed = "Intro_U";
                Loops = 7;
                AnSpeed = 4;
            }
            
            with (instance_create_depth(320, -140, -9999, oBlueAttack))
            {
                Seed = "Intro_U";
                Loops = 7;
                AnSpeed = 4;
            }
            
            with (instance_create_depth(320, -200, -9999, oBlueAttack))
            {
                Seed = "Intro_U";
                Loops = 7;
                AnSpeed = 4;
                Scale = 2;
            }
        }
        
        if (oSoul.BigHead == 4 && Var2 == 0)
            Var2 = 1;
    }
    
    if (Var2 != 0)
    {
        Var2 += 1;
        
        if (Var2 == 50)
        {
            sou(10);
            audio_play_sound(shinkansen, 100, true);
            audio_stop_sound(snd_chargeshot_charge);
            oSpamtonRig.BackBlack = false;
            scrShowParty(true);
            instance_destroy(oBigBulletEffect);
            instance_destroy(oSoul);
            instance_destroy(oBigBullet);
            instance_destroy(oBullet);
            
            with (oCC)
            {
                if (Seed == "WASD_BT")
                    instance_destroy();
            }
        }
        
        if (Var2 == 150)
            oSpamtonRig._Wings = 0.5;
        
        if (Var2 == 152)
            oSpamtonRig._Wings = 0.75;
        
        if (Var2 == 154)
        {
            oSpamtonRig._Wings = 1.5;
            sou(31);
        }
        
        if (Var2 == 156)
            oSpamtonRig._Wings = 1.4;
        
        if (Var2 == 158)
            oSpamtonRig._Wings = 1.25;
        
        if (Var2 == 160)
            oSpamtonRig._Wings = 1.1;
        
        if (Var2 == 162)
            oSpamtonRig._Wings = 1;
        
        if (Var2 == 225)
        {
            with (instance_create_depth(400, 120, -9999, oTextEngine))
            {
                Seed = "TBub";
                Font = sFont_Sma;
                image_xscale = 1;
                image_yscale = 1;
                RGB = make_color_rgb(0, 0, 0);
                BC = false;
                Text[0] = "It seems after all I@couldn't be anything@more than a simple@puppet.";
                Text[1] = "But you three...€€€€€€€€€@You're strong.";
                Text[2] = "Maybe with the@right touch.";
                Text[3] = "An Angel's touch...";
                EndMesg = "BYOS";
                Bubble_Xscale[0] = 10;
                Bubble_Yscale[0] = 4;
                Bubble_Arrow[0] = 1;
                Bubble_Xscale[1] = 8;
                Bubble_Yscale[1] = 2;
                Bubble_Arrow[1] = 1;
                Bubble_Xscale[2] = 7.5;
                Bubble_Yscale[2] = 2;
                Bubble_Arrow[2] = 1;
                Bubble_Xscale[3] = 9.5;
                Bubble_Yscale[3] = 1;
                Bubble_Arrow[3] = 1;
                Voice = snd_txtspam;
            }
        }
        
        if (oAlways.Mesg == "BYOS" || Var3 != 0)
        {
            Var3 += 1;
            
            if (oAlways.Mesg == "BYOS")
                oAlways.Mesg = 0;
        }
        
        if (Var3 == 1)
        {
            audio_stop_sound(shinkansen);
            sou(76);
            
            with (instance_create_depth(0, 0, -9999, oCC))
                Seed = "Shine_Back";
        }
        
        if (Var3 > 0 && oSpamtonRig._R != 255)
        {
            oSpamtonRig._R += 5;
            oSpamtonRig._G += 5;
            oSpamtonRig._B += 5;
        }
        
        if (Var3 == 100)
        {
            with (instance_create_depth(400, 120, -9999, oTextEngine))
            {
                Seed = "TBub";
                Font = sFont_Sma;
                image_xscale = 1;
                image_yscale = 1;
                RGB = make_color_rgb(0, 0, 0);
                BC = false;
                Text[0] = "You can [BREAK] your@own [STRINGS]!";
                EndMesg = "LaughSB";
                Bubble_Xscale[0] = 10;
                Bubble_Yscale[0] = 2;
                Bubble_Arrow[0] = 1;
                Voice = snd_txtspam;
                TextSpeed = 0.5;
            }
        }
        
        if (oAlways.Mesg == "LaughSB" || Var4 != 0)
        {
            Var4 += 1;
            
            if (oAlways.Mesg == "LaughSB")
            {
                oAlways.Mesg = 0;
                sou(16);
                oSpamtonRig.Index_Head = 42;
                oSpamtonRig.LimbShake = 5;
            }
        }
        
        if (Var4 == 1)
        {
            oSpamtonRig.Animation = "";
            oSpamtonRig.AnSpeed = 0;
            oSpamtonRig.HeadROT = -90;
            oSpamtonRig.HeadScale = 2.5;
        }
        
        if (Var4 > 1 && Var4 < 50)
        {
            oSpamtonRig.HeadScale += ((1 - oSpamtonRig.HeadScale) / 5);
            Var5 += 1;
            oSpamtonRig.HeadROT += (sin(Var5 * 1) * 15);
        }
        
        if (Var4 == 50)
        {
            oSpamtonRig.HeadScale = 2;
            oAlways.BCspeed = 1;
            oSpamtonRig.Animation = "Dang_A";
            instance_create_depth(0, 0, -1000, oMakeUI);
            oSpamtonRig.Index_Head = 15;
        }
        
        if (Var4 >= 50)
        {
            oSpamtonRig.HeadScale += ((1 - oSpamtonRig.HeadScale) / 10);
            oSpamtonRig.AnSpeed += ((0.25 - oSpamtonRig.AnSpeed) / 10);
        }
        
        if (Var4 == 150)
        {
            oSpamtonRig.HeadScale = 1;
            oSpamtonRig.AnSpeed = 0.25;
            instance_destroy();
        }
    }
}

if (Seed == "SetWings")
{
    if (Tyme == 1)
        oSpamtonRig._Wings = 0.5;
    
    if (Tyme == 3)
        oSpamtonRig._Wings = 0.75;
    
    if (Tyme == 5)
        oSpamtonRig._Wings = 1.5;
    
    if (Tyme == 7)
        oSpamtonRig._Wings = 1.4;
    
    if (Tyme == 9)
        oSpamtonRig._Wings = 1.25;
    
    if (Tyme == 11)
        oSpamtonRig._Wings = 1.1;
    
    if (Tyme == 13)
    {
        oSpamtonRig._Wings = 1;
        instance_destroy();
    }
}

if (Seed == "SpamtonFinal_1")
{
    if (Tyme == 1)
    {
        Var1 = -2;
        oAlways.Mesg = 0;
        Var3 = 0;
    }
    
    if (Tyme <= 27)
        Var1 -= 0.5;
    else
        Var1 += 0.5;
    
    if (Tyme >= 83)
        Var1 = 0;
    
    oSpamtonRig.BodX += Var1;
    
    if (oAlways.Mesg == "SF_ms1" && Var3 == 0)
    {
        Var3 = 1;
        Tyme = 100;
    }
    
    with (oTextEngine)
    {
        if (Spez == "SF_ms1")
            other.Var2 = AtText;
    }
    
    if (other.Var2 == 1)
        oSpamtonRig.Index_Head = 15;
    
    if (other.Var2 == 2)
    {
        oSpamtonRig.Index_Head = sFont_Sma;
        oSpamtonRig.LimbShake = 1;
    }
    
    if (Tyme == 83)
    {
        oSpamtonRig.LimbShake = 10;
        oSpamtonRig.Index_Head = 43;
        sou(31);
        
        if (oP.NoHit == "Enabled")
        {
            with (instance_create_depth(320, -40, -9999, oCC))
            {
                Seed = "MarsEND";
                image_speed = 0;
                sprite_index = sMarselo;
                image_index = 3;
                image_xscale = 2;
                image_yscale = 2;
            }
            
            instance_destroy();
        }
        else
        {
            audio_stop_sound(oAlways.BattleMusic);
            
            with (instance_create_depth(400, 120, -9999, oTextEngine))
            {
                Seed = "TBub";
                Font = sFont_Sma;
                image_xscale = 1;
                image_yscale = 1;
                RGB = make_color_rgb(0, 0, 0);
                BC = false;
                Spez = "SF_ms1";
                EndMesg = "SF_ms1";
                Voice = snd_txtspam;
                TextSpeed = 0.5;
                Text[0] = "[STOP!!][!]";
                Text[1] = "This [FIGHT] has gone@on for way too long...";
                Text[2] = "[[ GUN. GUN BULLET!@BULLET BULLET.@BULLET GUN! ]]";
                Bubble_Xscale[0] = 6;
                Bubble_Yscale[0] = 1;
                Bubble_Arrow[0] = 1;
                Bubble_Xscale[1] = 11;
                Bubble_Yscale[1] = 2;
                Bubble_Arrow[1] = 1;
                Bubble_Xscale[2] = 10;
                Bubble_Yscale[2] = 3;
                Bubble_Arrow[2] = 1;
            }
        }
    }
    
    if (Var3 == 1)
    {
        if (Tyme == 100)
        {
            oSpamtonRig.MovX = 3;
            
            with (instance_create_depth(oSpamtonRig.BodX, oSpamtonRig.BodY, -9999, oCC))
            {
                Seed = "FinHeart_1";
                sprite_index = sSpamHeart;
            }
            
            with (instance_create_depth(oSpamtonRig.BodX, oSpamtonRig.BodY, -9999, oCC))
            {
                Seed = "FinHeart_2";
                sprite_index = sSpamHeart;
            }
        }
        
        if (Tyme == 250)
        {
            oSpamtonRig.Index_Head = 15;
            
            if (oMakeUI.End == "G")
                oMakeUI.Spare = 93;
            
            sou(69);
            
            with (instance_create_depth(0, 0, 100, oCC))
                Seed = "FinPower";
            
            with (instance_create_depth(30, 382, -9999, oTextEngine))
            {
                JustText = true;
                Text[0] = "* Spamton Restitched's ATTACK dropped!£* Spamton Restitched's DEFENSE rose@greatly!";
                Spez = "ADDR";
            }
            
            instance_destroy();
        }
    }
}

if (Seed == "EndHome")
{
    if (Tyme == 200)
        instance_destroy(oTextEngine);
    
    if (Tyme == 525)
    {
        with (instance_create_depth(0, 0, 0, oGO_go))
            Seed = 2;
        
        oP.Deaths = 0;
        audio_stop_sound(oAlways.BattleMusic);
    }
}

if (Seed == "Wish")
    x += 2;

if (Seed == "SusEnd")
{
    if (Tyme == 1)
    {
        with (instance_create_depth(400, 120, -9999, oTextEngine))
        {
            Seed = "TBub";
            Font = sFont_Sma;
            image_xscale = 1;
            image_yscale = 1;
            RGB = make_color_rgb(0, 0, 0);
            BC = false;
            Spez = "SF_ms1";
            EndMesg = "SUSKILLNOW";
            Voice = snd_txtspam;
            TextSpeed = 0.5;
            Spez2 = "LastSUS";
            Text[0] = "RESTITCHED TOGETHER!!!";
            Text[1] = "AND FOREVER...";
            Text[2] = "SHUT UP!!!";
            Text[3] = "STOP SAYING CRYPTIC GARBAGE@THAT MAKES NO SENSE!";
            Text[4] = "...";
            Text[5] = "Haha...";
            Text[6] = "HE HA HHAHEHA";
            Text[7] = "THE RICH RATS ARE COMING!";
            Text[8] = "YOUR WISH IS MY COMMAND!";
            Text[9] = "I'M THE BIGGEST [SHOT]@IN ALL OF THE LAND!!!";
            Bubble_Xscale[0] = 11;
            Bubble_Yscale[0] = 1;
            Bubble_Arrow[0] = 1;
            Bubble_Xscale[1] = 7;
            Bubble_Yscale[1] = 1;
            Bubble_Arrow[1] = 1;
            Bubble_Xscale[2] = 5.5;
            Bubble_Yscale[2] = 1;
            Bubble_Arrow[2] = 3;
            Bubble_Xscale[3] = 13;
            Bubble_Yscale[3] = 2;
            Bubble_Arrow[3] = 3;
            Bubble_Xscale[4] = 2.5;
            Bubble_Yscale[4] = 1;
            Bubble_Arrow[4] = 1;
            Bubble_Xscale[5] = 4;
            Bubble_Yscale[5] = 1;
            Bubble_Arrow[5] = 1;
            Bubble_Xscale[6] = 7;
            Bubble_Yscale[6] = 1;
            Bubble_Arrow[6] = 1;
            Bubble_Xscale[7] = 12;
            Bubble_Yscale[7] = 1;
            Bubble_Arrow[7] = 1;
            Bubble_Xscale[8] = 11.5;
            Bubble_Yscale[8] = 1;
            Bubble_Arrow[8] = 1;
            Bubble_Xscale[9] = 11;
            Bubble_Yscale[9] = 2;
            Bubble_Arrow[9] = 1;
        }
    }
    
    with (oTextEngine)
    {
        if (Spez2 == "LastSUS")
        {
            if (AtText == 2)
            {
                Voice = 38;
                StartX = 325;
                StartY = 170;
            }
            
            if (AtText == 3)
                StartX = 475;
            
            if (AtText == 4)
            {
                Voice = snd_txtspam;
                StartX = SSx;
                StartY = SSy;
            }
        }
    }
    
    if (oAlways.Mesg == "SUSKILLNOW")
    {
        with (instance_create_depth(0, 0, 0, oCC))
            Seed = "SUSKILLNOW";
        
        audio_stop_sound(TS_End);
        instance_destroy();
    }
}

if (Seed == "SUSKILLNOW")
{
    if (Tyme < 11)
    {
        with (oSusie)
        {
            with (instance_create_depth(x + KnockX + Ex, y, -9999, oCC))
            {
                sprite_index = oSusie.sprite_index;
                image_index = oSusie.image_index;
                speed = 0;
                Seed = "SusFade";
                image_xscale = 2;
                image_yscale = 2;
            }
        }
        
        oSusie.Ex += 25;
    }
    
    if (Tyme == 11)
        sou(96);
    
    if (Tyme == 21)
    {
        oTP.TP -= 50;
        
        if (oTP.TP < 0)
            oTP.TP = 0;
        
        oSusie.sprite_index = sSusie_Rude;
        oSusie.image_index = 8;
    }
}

if (Seed == "SusFade")
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "MarsEND")
{
    if (Tyme >= 100 && Tyme < 112)
        y += 20;
    
    if (Tyme == 112 || Tyme == 260)
    {
        oAlways.ShakePower = 5;
        oAlways.ShakeTyme = 10;
        audio_stop_sound(oAlways.BattleMusic);
        sou(96);
    }
    
    if (Tyme == 150)
    {
        with (instance_create_depth(106, 330, -7777, oTextEngine))
        {
            Text[0] = "DON'T WORRY I WILL SAVE YOU";
            StringAT = 999;
            Spez = "MarsCheck";
        }
    }
    
    if (Tyme >= 250 && Tyme < 260)
    {
        x += 10;
        y -= 5;
    }
    
    if (Tyme >= 260 && Tyme < 280)
    {
        oSpamtonRig.BodX += 20;
        oSpamtonRig.BodY -= 10;
        x -= 5;
        y += Var1;
        Var1 += 1;
    }
    
    if (Tyme == 260)
    {
        Var1 = -6.5;
        oKris.sprite_index = sKris_Ones;
        oKris.image_index = 0;
        oSusie.sprite_index = sSusie_Ones;
        oSusie.image_index = 2;
        oRalsei.sprite_index = sRalsei_Ones;
        oRalsei.image_index = 1;
        
        with (oTextEngine)
        {
            if (Spez == "MarsCheck")
                instance_destroy();
        }
        
        with (instance_create_depth(178, 330, -7777, oTextEngine))
        {
            Text[0] = "I KILLED HIM I WIN";
            StringAT = 999;
            Spez = "MarsCheck";
        }
    }
    
    if (Tyme == 280)
        sou(10);
    
    if (Tyme == 410)
    {
        with (oTextEngine)
        {
            if (Spez == "MarsCheck")
                instance_destroy();
        }
        
        with (instance_create_depth(360, 95, -9999, oTextEngine))
        {
            Seed = "TBub";
            Font = sFont_Sma;
            image_xscale = 1;
            image_yscale = 1;
            RGB = make_color_rgb(0, 0, 0);
            BC = false;
            EndMesg = "KrisMars";
            TextSpeed = 0.5;
            Spez = "KrisMars";
            Text[0] = "Thank you Marselo,@you're my hero.";
            Bubble_Xscale[0] = 9;
            Bubble_Yscale[0] = 2;
            Bubble_Arrow[0] = 3;
        }
    }
    
    if (oAlways.Mesg == "KrisMars")
    {
        Var2 += 1;
        
        if (Var2 == 1)
        {
            with (instance_create_depth(154, 330, -7777, oTextEngine))
            {
                Text[0] = "DON'T MENTION IT KRIS";
                StringAT = 999;
                Spez = "MarsCheck";
            }
        }
        
        if (Var2 == 101)
        {
            sou(27);
            
            with (oTextEngine)
            {
                if (Spez == "MarsCheck")
                    instance_destroy();
            }
            
            with (instance_create_depth(203, 330, -7777, oTextEngine))
            {
                Text[0] = "MARSELO AWAY!!!";
                StringAT = 999;
                Spez = "MarsCheck";
            }
        }
        
        if (Var2 >= 101)
        {
            x += 5;
            y -= 10;
        }
        
        if (Var2 == 250)
        {
            with (oTextEngine)
            {
                if (Spez == "MarsCheck")
                    instance_destroy();
            }
            
            with (instance_create_depth(420, 190, -7777, oCC))
            {
                Seed = "DrawSelf";
                sprite_index = sMarselo_2;
            }
            
            with (instance_create_depth(0, 190, -7777, oCC))
            {
                Seed = "DrawSelf";
                sprite_index = sWhite;
                image_index = 1;
                image_xscale = 100;
                image_yscale = 3;
                image_alpha = 0.5;
            }
            
            with (instance_create_depth(25, 208, -9999, oTextEngine))
            {
                Text[0] = "_crMARSELO ENDING YOU'RE WIN!!!";
                StringAT = 999;
                Spez = "MarsCheck";
            }
        }
        
        if (Var2 == 241)
            audio_play_sound(Sonic, -999, false);
        
        if (Var2 == 251)
        {
            oKris.image_index = 2;
            oSusie.image_index = 4;
            oRalsei.image_index = 3;
            oAlways.BCspeed = 0;
        }
        
        if (Var2 == 700)
            game_end();
    }
}
