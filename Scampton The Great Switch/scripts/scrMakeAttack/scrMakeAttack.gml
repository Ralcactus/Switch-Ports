function scrMakeAttack(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15)
{
    with (instance_create_depth(arg2, arg3, -7000, arg0))
    {
        scrFBres();
        ID = 0;
        ID[0] = 0;
        
        if (arg1 != 0)
        {
            while (i != string_length(arg1))
            {
                i++;
                CL = string_char_at(arg1, i);
                
                if (i == string_length(arg1))
                    Make += CL;
                
                if (CL == "@" || i == string_length(arg1))
                {
                    ID[j] = Make;
                    j += 1;
                    Make = "";
                }
                else
                {
                    Make += CL;
                }
            }
        }
        
        if (scrACp("DPE"))
            DPE = 1;
        
        if (scrACp("DPE2"))
            DPE = 2;
        
        if (scrACp("DPE3"))
            DPE = 3;
        
        if (scrACp("DPE4"))
            DPE = 4;
        
        if (scrACp("Ghi"))
            image_alpha = 0;
        
        if (scrACp("DamageTime1"))
            DamageTime = 10;
        
        if (scrACp("DamageTime2"))
            DamageTime = 20;
        
        if (scrACp("DamageTime3"))
            DamageTime = 16;
        
        if (scrACp("DamageTime4"))
            DamageTime = 25;
        
        if (scrACp("OffsetExy"))
            OffsetExy = irandom_range(-9, 9);
        
        if (scrACp("Ticked"))
            Tick = false;
        
        if (scrACp("OtherAlpha"))
            image_alpha = other.image_alpha;
        
        if (scrACp("HP3"))
            HP = 3;
        
        if (scrACp("RanSpin"))
        {
            while (RanSpin == 0)
                RanSpin = irandom_range(-1, 1) * 30;
        }
        
        if (scrACp("RanSpin2"))
        {
            while (RanSpin == 0)
                RanSpin = irandom_range(-1, 1) * 10;
        }
        
        if (scrACp("AlphaZero"))
            image_alpha = 0;
        
        if (scrACp("3speed"))
            speed = 3;
        
        if (scrACp("5speed"))
            speed = 5;
        
        if (scrACp("4.5speed"))
            speed = 4.5;
        
        if (scrACp("6speed"))
            speed = 6;
        
        if (scrACp("7speed"))
            speed = 7;
        
        if (scrACp("TickSound"))
            TickSound = false;
        
        if (scrACp("RGB_Gold"))
        {
            _R = 255;
            _G = 235;
            _B = 0;
        }
        
        if (scrACp("Mouth"))
            Loops = 999;
        
        if (scrACp("1_4var"))
        {
            Var1 = 1;
            Var2 = 1;
            Var3 = 1;
            Var4 = 1;
        }
        
        if (scrACp("9Same"))
            Var9 = other.Var9;
        
        if (scrACp("UpToSxy"))
        {
            StartY = y;
            y = 550;
        }
        
        if (scrACp("EmFront1"))
            depth -= 3000;
        
        if (scrACp("Tick2"))
            TickPower = 2;
        
        if (scrACp("ChieldProof"))
            ChieldProof = true;
        
        if (scrACp("p1"))
            TickPower = 1;
        
        if (scrACp("Si1"))
            RanSpin = 1;
        
        if (scrACp("p2"))
            TickPower = 2;
        
        if (scrACp("Si2"))
            RanSpin = 2;
        
        if (scrACp("p3"))
            TickPower = 3;
        
        if (scrACp("Si3"))
            RanSpin = 3;
        
        if (scrACp("Walk3"))
            speed = 3;
        
        if (scrACp("p4"))
            TickPower = 4;
        
        if (scrACp("Si4"))
            RanSpin = 4;
        
        if (scrACp("Walk4"))
            speed = 4;
        
        if (scrACp("p5"))
            TickPower = 5;
        
        if (scrACp("Si5"))
            RanSpin = 5;
        
        if (scrACp("Walk5"))
            speed = 5;
        
        if (scrACp("p6"))
            TickPower = 6;
        
        if (scrACp("Si6"))
            RanSpin = 6;
        
        if (scrACp("Walk6"))
            speed = 6;
        
        if (scrACp("p7"))
            TickPower = 7;
        
        if (scrACp("Si7"))
            RanSpin = 7;
        
        if (scrACp("Walk7"))
            speed = 7;
        
        if (scrACp("p8"))
            TickPower = 8;
        
        if (scrACp("Si8"))
            RanSpin = 8;
        
        if (scrACp("Walk8"))
            speed = 8;
        
        if (scrACp("p9"))
            TickPower = 9;
        
        if (scrACp("Si9"))
            RanSpin = 9;
        
        if (scrACp("Walk9"))
            speed = 9;
        
        if (scrACp("p10"))
            TickPower = 10;
        
        if (scrACp("Si10"))
            RanSpin = 10;
        
        if (scrACp("Walk10"))
            speed = 10;
        
        if (scrACp("p17"))
            TickPower = 17;
        
        if (scrACp("p30"))
            TickPower = 30;
        
        if (!scrACp("RevSpin")){
			if (variable_instance_exists(id, "RanSpin"))
				RanSpin = -RanSpin;
		}
        
        if (scrACp("GS 1/2"))
            GlowSiz = 0.5;
        
        if (scrACp("CardSpin1"))
        {
            y += 999;
            speed = oPattern.i1[0];
        }
        
        if (scrACp("CardGet"))
        {
            x = oBox.x;
            y = oBox.y;
            speed = oPattern.i1[0];
            j1 = 1;
            j2 = other.i1[2];
        }
        
        if (scrACp("CardBack"))
        {
            x = oBox.x;
            y = oBox.y;
            speed = oPattern.i1[0];
            i1[2] = other.j2;
            j3 = 1;
        }
        
        if (scrACp("moveRot1"))
        {
            moveRot(arg2, arg3, arg15, 250);
            
            if (scrACp("SmoB"))
            {
                with (instance_create_depth(x, y, -20000, oEEF))
                    Seed = "SmokePop";
            }
        }
        
        if (scrACp("Front1"))
        {
            depth -= 2000;
            
            if (arg0 == oParryAttack)
                depth -= 3000;
        }
        
        if (scrACp("Front2"))
        {
            depth -= 3000;
            
            if (arg0 == oParryAttack)
                depth -= 3000;
        }
        
        if (scrACp("Front3"))
            depth = -15000;
        
        if (scrACp("Front-1"))
            depth = oBox.depth + 1000;
        
        if (scrACp("CupATK"))
            i1 = other.i2;
        
        if (scrACp("CT_PH3"))
            CT_PH = 3;
        
        WalkX = arg4;
        eX = arg5;
        WalkY = arg6;
        eY = arg7;
        
        if (arg8 != 0)
            SpeedCap = arg8;
        
        if (arg9 != 0)
            sprite_index = arg9;
        
        image_index = arg10;
        
        if (arg11 == 0)
            image_speed = 1;
        else
            image_speed = arg11;
        
        if (arg12 == 0)
            image_xscale = 1;
        else if (arg12 == "#")
            image_xscale = 0;
        else
            image_xscale = arg12;
        
        if (arg13 == 0)
            image_yscale = 1;
        else if (arg13 == "#")
            image_yscale = 0;
        else
            image_yscale = arg13;
        
        image_angle = arg14;
        direction = arg15;
        
        if (scrACp("t=0"))
            direction = 180;
        
        if (scrACp("t=5"))
            direction = 185;
        
        if (scrACp("t5"))
            direction += 5;
        
        if (scrACp("t=6"))
            direction = 186;
        
        if (scrACp("t6"))
            direction += 6;
        
        if (scrACp("t=10"))
            direction = 190;
        
        if (scrACp("t10"))
            direction += 10;
        
        if (scrACp("t=15"))
            direction = 195;
        
        if (scrACp("t15"))
            direction += 15;
        
        if (scrACp("t=20"))
            direction = 200;
        
        if (scrACp("t20"))
            direction += 20;
        
        if (scrACp("t=-5"))
            direction = 175;
        
        if (scrACp("t-5"))
            direction -= 5;
        
        if (scrACp("t=-6"))
            direction = 174;
        
        if (scrACp("t-6"))
            direction -= 6;
        
        if (scrACp("t=-10"))
            direction = 170;
        
        if (scrACp("t-10"))
            direction -= 10;
        
        if (scrACp("t=-15"))
            direction = 165;
        
        if (scrACp("t-15"))
            direction -= 15;
        
        if (scrACp("t=-20"))
            direction = 160;
        
        if (scrACp("t-20"))
            direction -= 20;
        
        if (arg0 == 12)
        {
            if (arg12 == 0)
                Xscale = 1;
            else
                Xscale = arg12;
            
            if (arg13 == 0)
                Scale = 1;
            else
                Scale = arg13;
        }
    }
}
