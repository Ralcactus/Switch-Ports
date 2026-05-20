function battlePatterns()
{
    if (ty == 1)
    {
        ss = 999;
        tt = 0;
    }
    
    if (ss <= 0 && pattern != "final")
    {
        tt++;
        
        if (tt == 30)
            endPattern();
        
        oBUI.extraTP = 0;
    }
    
    if (pattern == "tutorial")
    {
        if (ty == 1)
        {
            if (!op.challengeMode)
                oBUI.damageTimes = 0.5;
            
            ss = 4;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            mg(sG1, 120, 275);
            
            if (!op.superMode)
                mg(sG2, 260, 290);
            else
                mg(sG3, 320, 290);
            
            mg(sG3, 470, 265);
            mg(sG4, 540, 170);
            ma(["star2"], undefined, undefined, 220 + (op.superMode * 10), 250, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5, 4]);
            make_wow(430, 272, 20, 50);
            i2 = 60;
            
            if (op.challengeMode)
            {
                ss = 8;
                mg(sG1, 320, 100);
                ma(["star2"], undefined, undefined, 320, 70, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 0], [[220 + (op.superMode * 10), 250], [470, 225], [320, 70]]);
            }
        }
        
        if (ty == 6)
            ma(["star2"], undefined, undefined, 320, 210, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 4]);
        
        if (ty == 11)
            ma(["star2"], undefined, undefined, 470, 225, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [[540, 125]]);
        
        if (op.challengeMode)
        {
            if (!(ty % i2))
            {
                if (i1 == 0)
                {
                    ma(["star1", "depth1", "graze2"], undefined, undefined, 690, -25, undefined, undefined, -6, 3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, -8, 0]);
                    ma(["star1", "depth1", "graze2"], undefined, undefined, 0, -75, undefined, undefined, 6, 3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, 8, 0]);
                }
                
                if (i1 == 1)
                {
                    ma(["star1", "depth1", "graze2"], undefined, undefined, 640, -75, undefined, undefined, -6, 3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, -8, 0]);
                    ma(["star1", "depth1", "graze2"], undefined, undefined, -100, 25, undefined, undefined, 6, 3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, 8, 0]);
                }
                
                if (i1 == 2)
                {
                    ma(["star1", "depth1", "graze2"], undefined, undefined, 740, 25, undefined, undefined, -6, 3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, -8, 0]);
                    ma(["star1", "depth1", "graze2"], undefined, undefined, -50, -25, undefined, undefined, 6, 3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, 8, 0]);
                }
                
                i1++;
                
                if (i1 >= 3)
                    i1 = 0;
            }
            
            if (!(ty % (30 - (op.superMode * 10))) && (!op.superMode || (op.superMode && !!(ty % 80))))
            {
                ma(["star1", "depth1", "graze1"], undefined, undefined, 390, 350, undefined, undefined, undefined, -3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -8, 0]);
                
                if (op.superMode)
                    ma(["star1", "depth1", "graze1"], undefined, undefined, 230, -30, undefined, undefined, undefined, 3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -8, 0]);
            }
        }
    }
    
    if (pattern == "maneuver")
    {
        if (ty == 1)
        {
            ss = 4;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            make_wow(80, 290, 50, 50);
            
            if (!oBUI.loop)
            {
                mg(sG1, 270, 305, undefined, 1);
                mg(sG1, 360, 260);
                mg(sG3, 280, 150);
                mg(sG1, 340, 86);
                ma(["star2"], undefined, undefined, 340, 40, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 9], [[250, 270], [400, 220], [380, 40]]);
            }
            else
            {
                ss = 5;
                ground = [sG1, sG3, sG4, sG5];
                
                if (op.superMode)
                    ground = [sG5, sG5, sG5, sG5];
                
                mg(ground[1], 230 + (op.superMode * 10), 285, undefined, 1);
                mg(ground[2], 200, 185, undefined, 1);
                mg(ground[3], 240, 85, undefined, 1);
                mg(ground[0], 410 + (op.superMode * 10), 285, undefined, 1);
                mg(ground[1], 470, 205);
                mg(ground[3], 420, 125, undefined, 2);
                res_j();
                j = [];
                j1 = [[240, 40], [200, 140], [230 + (op.superMode * 10), 240]];
                j2 = [[420, 80], [470, 160], [380 + (op.superMode * 40), 240]];
                
                var _pickRandom = function(arg0 = 0)
                {
                    j3 = irandom_range(0, array_length(arg0) - 1);
                    array_push(j, arg0[j3]);
                    array_delete(arg0, j3, 1);
                };
                
                repeat (3)
                {
                    _pickRandom(j2);
                    _pickRandom(j1);
                }
                
                res_k();
                k1 = j[0];
                array_delete(j, 0, 1);
                array_pop(j);
                ma(["star2"], undefined, undefined, k1[0], k1[1], undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 7], j);
            }
            
            i2 = 20;
            
            if (oBUI.loop)
                i2 = 30;
        }
        
        if (op.challengeMode)
        {
            if (oBUI.loop)
                i2 = 60;
            else
                i2 = 50;
            
            if (!(ty % 45))
            {
                ma(["star1", "depth1", "graze1"], undefined, undefined, -50, 150, undefined, undefined, 4, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, -8, 0]);
                ma(["star1", "depth1", "graze1"], undefined, undefined, 690, 250, undefined, undefined, -4, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, -8, 0]);
            }
        }
        
        if (!(ty % i2))
        {
            if (i1 == 0)
                ma(["star1", "depth1", "graze2"], undefined, undefined, 690, -25, undefined, undefined, -4 * (1.5 + (op.superMode * 0.5)), 2 * (1.5 + (op.superMode * 0.5)), undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -8 - (op.superMode * 3), 0]);
            
            if (i1 == 1)
                ma(["star1", "depth1", "graze2"], undefined, undefined, 640, -75, undefined, undefined, -4 * (1.5 + (op.superMode * 0.5)), 2 * (1.5 + (op.superMode * 0.5)), undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -8 - (op.superMode * 3), 0]);
            
            if (i1 == 2)
                ma(["star1", "depth1", "graze2"], undefined, undefined, 740, 25, undefined, undefined, -4 * (1.5 + (op.superMode * 0.5)), 2 * (1.5 + (op.superMode * 0.5)), undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -8 - (op.superMode * 3), 0]);
            
            if (oBUI.loop)
            {
                if (i1 == 2)
                    ma(["star1", "depth1", "graze2"], undefined, undefined, -50, -25, undefined, undefined, 4 * (1.5 + (op.superMode * 0.5)), 2 * (1.5 + (op.superMode * 0.5)), undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 8 + (op.superMode * 3), 0]);
                
                if (i1 == 1)
                    ma(["star1", "depth1", "graze2"], undefined, undefined, -100, 25, undefined, undefined, 4 * (1.5 + (op.superMode * 0.5)), 2 * (1.5 + (op.superMode * 0.5)), undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 8 + (op.superMode * 3), 0]);
                
                if (i1 == 0)
                    ma(["star1", "depth1", "graze2"], undefined, undefined, 0, -75, undefined, undefined, 4 * (1.5 + (op.superMode * 0.5)), 2 * (1.5 + (op.superMode * 0.5)), undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 8 + (op.superMode * 3), 0]);
            }
            
            i1++;
            
            if (i1 >= 3)
                i1 = 0;
        }
    }
    
    if (pattern == "handsSide")
    {
        if (ty == 1)
        {
            ss = 4;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            res_k();
            k5 = 45;
            y = 320;
            k6 = "";
            i2 = 1;
            i3 = [ss, 30];
            
            if (!oBUI.loop)
                ma(["star2"], undefined, undefined, 320, 50, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4.5, 5, 11], [[320, 280], [320, 50], [320, 280]]);
            
            if (oBUI.loop)
                ma(["star2"], undefined, undefined, 320, 50, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4.5, 5, 6], [[320, 280], [320, 50], [320, 280], [320, 50], [320, 280]]);
            
            mg(sG1, -9999, 480);
            res_j();
            
            if (oBUI.loop)
                j = 75;
            
            make_wow(140 - j, 0, 2, 480);
            make_wow(500 + j, 0, 2, 480);
            k5 = 45;
            
            if (op.challengeMode && oBUI.loop)
            {
                k5 = 60;
                oEnemie.drawL = 1;
            }
            
            if (op.challengeMode)
            {
                ma(["star1", "followerStar", "keep", "depth2"], undefined, undefined, 320, -50 + (oBUI.loop * 400), undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.08, 1, 6, 2.2, 5, 3]);
                
                if (oBUI.loop)
                {
                    ma(["drawLazer"], undefined, undefined, 0, 0, 0, 0);
                    squashHand(0, 20, undefined, [sNothing, sNothing]);
                    squashHand(undefined, undefined, undefined, [sHand_Lazer, sHand_LazerM], undefined, snd_grab);
                }
            }
        }
        
        if (!oBUI.loop)
        {
            if (i3[1] > 0)
            {
                i3[1]--;
                
                if (i3[1] == 0 && ss > 0)
                    oGround.shake = 5;
            }
            
            if (i3[0] != ss)
            {
                i3[1] = 20;
                oGround.shake = 5;
            }
            
            i3[0] = ss;
            
            if (ss > 0)
            {
                oGround.move = [0, 0];
                res_j();
                
                if (!(ss % 2))
                {
                    if (i3[1] == 0)
                    {
                        y += 2;
                        oGround.move = [0, 2];
                    }
                    
                    while (y >= -210)
                    {
                        with (oGround)
                        {
                            if (y == other.y)
                                other.j = 1;
                        }
                        
                        if (j == 0 && (i3[1] == 0 || ty == 1))
                            mg(sG1, 320 + (i2 * 16), y, [0, 0], irandom_range(0, 2));
                        
                        i2 = -i2;
                        y -= 70;
                    }
                }
                else
                {
                    if (i3[1] == 0)
                    {
                        y -= 1;
                        oGround.move = [0, -1];
                    }
                    
                    while (y <= 610)
                    {
                        with (oGround)
                        {
                            if (y == other.y)
                                other.j = 1;
                        }
                        
                        if ((j == 0 && (i3[1] == 0 || ty == 1)) || true)
                            mg(sG1, 320 + (i2 * 16), y, [0, 0], irandom_range(0, 2));
                        
                        i2 = -i2;
                        
                        with (oGround)
                        {
                            with (oGround)
                            {
                                if (other.ty < 3 && y == other.y && other != self)
                                    des(other);
                            }
                        }
                        
                        y += 70;
                    }
                }
            }
            else
            {
                oGround.move = [0, 0];
            }
        }
        else
        {
            if (ty == 1)
            {
                res_k();
                k1 = 320;
                k2 = 0;
                k3 = -1;
                k4 = -1;
                ss = 6;
                k5 = 45;
                
                if (op.challengeMode && oBUI.loop)
                    k5 = 60;
            }
            
            k1 += 2;
            k2 -= 2;
            
            while (k1 >= -210)
            {
                mg(sG3, 220 + (k3 * 16), k1, [0, 2 + op.superMode], irandom_range(0, 2));
                k3 = -k3;
                k1 -= 70;
            }
            
            while (k2 <= 610)
            {
                mg(sG3, 420 + (k4 * 16), k2, [0, -2 - op.superMode], irandom_range(0, 2));
                k4 = -k4;
                k2 += 70;
            }
        }
        
        if (!(ty % k5))
        {
            res_j();
            i1++;
            
            if (i1 % 2)
                j = 1;
            else
                j = -1;
            
            if (oSoul.y > 160)
                j2 = 370;
            else
                j2 = -50;
            
            ma(["hand1", "keep", "graze4", "depth1"], sHand1, undefined, 320 - (220 * j), j2, 2 * j, 2);
        }
        
        if (op.challengeMode && oBUI.loop)
        {
            if (!(ty % (90 + (op.superMode * 60))))
            {
                ma(["handLazer", "keep", 0], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(520, 104, oSoul.x, oSoul.y));
                
                if (!op.superMode)
                    ma(["handLazer", "keep", 0], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(520, 104, oSoul.x, oSoul.y) + 5);
            }
        }
    }
    
    if (pattern == "fallingPlatforms")
    {
        if (ty == 1)
        {
            ss = 5;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            i1 = -1;
            i3 = [0, 1, 2];
            i = 0;
            oBUI.soulFloorBounce = 13;
            res_j();
            j = 2.5;
            j1 = 90;
            
            if (oBUI.loop)
            {
                j = 2.75;
                j1 = 70;
            }
            
            res_k();
            k = -1;
            mg(sG1, 320 + (irandom_range(-2, 2) * 4), 175, [0, j], 0);
            mg(sGf1, 220, 100, [0, j], 0);
            mg(sGf1, 420, 45, [0, j], 1);
            mg(sGf1, 320, -10, [0, j], 2);
            
            if (op.challengeMode)
            {
                oEnemie.drawL = 1;
                squashHand(0, 20, undefined, [sNothing, sNothing]);
                squashHand(undefined, undefined, undefined, [sHand_Lazer, sHand_LazerM], undefined, snd_grab);
                ma(["drawLazer"], undefined, undefined, 0, 0, 0, 0);
            }
            
            k2 = 1;
        }
        
        if (!((ty - 1) % round(j1 / 3)))
        {
            k *= -1;
            ma(["star1", "depth1", "graze1"], undefined, undefined, 320 + (370 * k), -76, undefined, undefined, -k * 6, 3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, -k * 10, 10]);
            make_wow(310 + (400 * k), -96, 20, 20, -k * 6, 3 + irandom_range(0, 1));
            
            if (oBUI.loop && false)
                ma(["star1", "depth1", "graze2"], undefined, undefined, 320 - (175 * k), -126, undefined, undefined, k * 3, 5, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2, k * 10, 10]);
        }
        
        if (!((ty - 1) % j1))
        {
            i4 = irandom_range(0, array_length(i3) - 1);
            i = i3[i4];
            array_delete(i3, i4, 1);
            i1 = i;
            
            if (array_length(i3) == 0)
            {
                if (i1 != 0)
                    array_push(i3, 0);
                
                if (i1 != 1)
                    array_push(i3, 1);
                
                if (i1 != 2)
                    array_push(i3, 2);
            }
            
            if (irandom_range(0, 1) == 0)
                i2 = -1;
            else
                i2 = 1;
            
            if (i == 0)
            {
                mg(sGf1, 320 + (irandom_range(-4, 4) * 4), -100, [0, j], irandom_range(0, 2));
                mg(sGf1, 320 - (130 * i2), -180, [0, j], irandom_range(0, 2));
                mg(sGf1, 320 + (130 * i2) + (irandom_range(-4, 4) * 4), -220, [0, j], irandom_range(0, 2));
                ma(["star1", "graze2"], undefined, undefined, 320 - (65 * i2), -140, undefined, undefined, undefined, j, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5 * k2, 5]);
                ma(["star2", "uf"], undefined, undefined, 320 - (130 * i2), -212, undefined, undefined, undefined, j, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -5 * k2, 7]);
            }
            
            if (i == 1)
            {
                mg(sGf1, (320 + (irandom_range(-2, 2) * 4)) - (65 * i2), -140, [0, j], irandom_range(0, 2));
                mg(sGf1, 320 + (65 * i2), -220, [0, j], irandom_range(0, 2));
                ma(["star1", "graze2"], undefined, undefined, 320, -170, undefined, undefined, undefined, j, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5 * k2, 5]);
                ma(["star2", "uf"], undefined, undefined, 320 - (130 * i2), -212, undefined, undefined, undefined, j, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -5 * k2, 8]);
            }
            
            if (i == 2)
            {
                k1 = irandom_range(-2, 2) * 4;
                mg(sGf1, (320 + k1) - (100 * i2), -100, [0, j], irandom_range(0, 2));
                mg(sGf1, 320 + (irandom_range(-2, 2) * 4) + (100 * i2), -220, [0, j], irandom_range(0, 2));
                mg(sGf1, (320 + (irandom_range(-2, 2) * 4)) - (100 * i2), -220, [0, j], irandom_range(0, 2));
                ma(["star1", "graze2"], undefined, undefined, 320, -170, undefined, undefined, undefined, j, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5 * k2, 5]);
                ma(["star2", "uf"], undefined, undefined, (320 + k1) - (100 * i2), -132, undefined, undefined, undefined, j, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -5 * k2, 7]);
            }
            
            k2 *= -1;
        }
        
        if (op.challengeMode)
        {
            if (!(ty % 75))
                ma(["handLazer", "keep", 0], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(517, 108, oSoul.x, oSoul.y));
        }
    }
    
    if (pattern == "linearMoving")
    {
        if (ty == 1)
        {
            ss = 7;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            res_k();
            i1 = 0;
            i2 = -4;
            i3 = 1;
            i4 = [];
            k1 = irandom_range(0, 2);
            i = 3;
            mg(sG3, 170, 140, [0, 2]);
            
            if (op.challengeMode)
                ma(["star1", "followerStar", "keep", "depth2"], undefined, undefined, 320, -50, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.08, 1, 6, 2.2, 5, 3]);
        }
        
        if (i1 > 0)
            i1--;
        
        if (i1 < 0)
            i1 = 0;
        
        if (i1 == 0)
        {
            i3 *= -1;
            i3 = 1;
            
            if (array_length(i4) == 0)
            {
                array_push(i4, k1);
                array_push(i4, 3);
                k1++;
                
                if (k1 > 2)
                    k1 = 0;
            }
            
            i = i4[0];
            array_delete(i4, 0, 1);
            
            if (i == 0)
            {
                i1 = 57;
                res_j();
                j = irandom_range(-2, 0) * 10;
                mg(sG1, 704, 290, [i2, 0]);
                ma(["keep", "depth2"], sHand1, undefined, 798, (250 + j) - 20, 2, 2, i2, undefined, undefined, undefined, 90);
                ma(["keep"], sHand1, undefined, 798, 200 + j, 2, 2, i2, undefined, undefined, undefined, -90);
                
                if (i3 == 1)
                    ma(["star2", "uf"], undefined, undefined, 860, 180 + j, undefined, undefined, i2, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -5, 3]);
            }
            
            if (i == 1)
            {
                i1 = 77;
                mg(sG1, 704, 290, [i2, 0]);
                ma(["keep", "depth2"], sHand1, undefined, 798, 230, 2, 2, i2, undefined, undefined, undefined, 90);
                ma(["keep"], sHand1, undefined, 798, 200, 2, 2, i2, undefined, undefined, undefined, -90);
                ma(["keep", "depth2"], sHand1, undefined, 918, 180, 2, 2, i2, undefined, undefined, undefined, 90);
                ma(["keep"], sHand1, undefined, 918, 150, 2, 2, i2, undefined, undefined, undefined, -90);
                
                if (i3 == 1)
                    ma(["star2", "uf"], undefined, undefined, 968, 220, undefined, undefined, i2, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 3]);
            }
            
            if (i == 2)
            {
                i1 = 77;
                mg(sG1, 704, 290, [i2, 0]);
                ma(["keep", "depth2"], sHand1, undefined, 798, 230, 2, 2, i2, undefined, undefined, undefined, 90);
                ma(["keep"], sHand1, undefined, 798, 200, 2, 2, i2, undefined, undefined, undefined, -90);
                ma(["keep", "depth2"], sHand1, undefined, 918, 230, 2, 2, i2, undefined, undefined, undefined, 90);
                ma(["keep"], sHand1, undefined, 918, 200, 2, 2, i2, undefined, undefined, undefined, -90);
                
                if (i3 == 1)
                    ma(["star2", "uf"], undefined, undefined, 858, 270, undefined, undefined, i2, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 4]);
            }
            
            if (i == 3)
            {
                i1 = 112;
                mg(sG1, 704, 290, [i2, 0], 2);
                mg(sG1, 744, 195, [i2, 0], 1);
                mg(sG1, 784, 100, [i2, 0], 0);
                mg(sG3, 958, 290, [i2, 0], 0);
                res_j();
                j1 = -5;
                
                repeat (5)
                {
                    ma(["star1", "depth2"], undefined, undefined, 880, 76 + (j * 54), undefined, undefined, i2, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2, j1, 10]);
                    ma(["nd", "NotDraw", "grazeAnyway"], sAttack1, undefined, 880, 103 + (j * 54), 2.2, 2.2, i2);
                    j++;
                    j1 *= -1;
                }
                
                ma(["keep"], sHand1, undefined, 980, 230, 2, 2, i2, undefined, undefined, undefined, -90);
                
                if (i3 == 1)
                    ma(["star2", "uf"], undefined, undefined, 720, 60, undefined, undefined, i2, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5, 4]);
                
                if (k3 == 0 || k3 > 2)
                    ma(["star2", "uf"], undefined, undefined, 938, 250, undefined, undefined, i2, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 5, 5, 4]);
                
                k3++;
                make_wow(877, 70, 6, 300, i2);
            }
        }
    }
    
    if (pattern == "boomerang")
    {
        if (ty == 1)
        {
            ss = 7;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            i = [-1, -1, -1];
            i1 = -1;
            i2 = [0, 1, 2];
            oBUI.soulFloorBounce = 13;
            res_k();
            
            if (!oBUI.loop)
            {
                k = 60;
                mg(sG3, 220, 220, undefined, undefined, ["cmMOVE"]);
            }
            else
            {
                k = 55;
                mg(sG5, 220, 220, undefined, undefined, ["cmMOVE"]);
            }
        }
        
        if (!((ty - 1) % k))
        {
            i3 = irandom_range(0, array_length(i2) - 1);
            i1 = i2[i3];
            array_delete(i2, i3, 1);
            
            if (array_length(i2) == 0)
            {
                if (i1 != 0)
                    array_push(i2, 0);
                
                if (i1 != 1)
                    array_push(i2, 1);
                
                if (i1 != 2)
                    array_push(i2, 2);
            }
            
            i[i1] *= -1;
            
            if (i1 == 0)
            {
                ma(["star1"], undefined, undefined, 680, 192, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.5, -5, 10]);
                
                if (i[i1] == 1)
                    ma(["star1"], undefined, undefined, 800, 192, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.5, -5, 10]);
                
                ma(["star1"], undefined, undefined, 680, 102, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.5, 5, 10]);
                ma(["star1", "graze10"], undefined, undefined, 680, 42, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.5, -5, 10]);
                
                if (i[i1] == 1)
                    ma(["star2", "uf"], undefined, undefined, 740, 192, undefined, undefined, -6);
                else
                    ma(["star2", "uf"], undefined, undefined, 770, 102, undefined, undefined, -6);
                
                make_wow(674, 42, 10, 50, -6);
                make_wow(700, 232, 80, 80, -6);
            }
            
            if (i1 == 1)
            {
                res_j();
                j = 0;
                
                if (i[i1] == -1)
                    j += 60;
                
                ma(["star1"], undefined, undefined, 680, 192 + j, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -5, 10]);
                ma(["star1"], undefined, undefined, 800, 192 + j, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -5, 10]);
                ma(["star2", "uf"], undefined, undefined, 740, 192 + j, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 6]);
                
                if (j != 60)
                    make_wow(670, 222, 20, 50, -6);
            }
            
            if (i1 == 2)
            {
                ma(["star1"], undefined, undefined, 744, 162, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -5, 10]);
                ma(["star1"], undefined, undefined, 800, 142, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 10]);
                ma(["star1"], undefined, undefined, 856, 122, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -5, 10]);
                ma(["star1"], undefined, undefined, 688, 182, undefined, undefined, -6, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 10]);
                
                if (i[i1] == 1)
                    ma(["star2", "uf"], undefined, undefined, 810, 82, undefined, undefined, -6);
                else
                    ma(["star2", "uf"], undefined, undefined, 754, 102, undefined, undefined, -6);
                
                make_wow(816, 122, 20, 20, -6);
                make_wow(760, 142, 20, 20, -6);
            }
        }
    }
    
    if (pattern == "movingPlatforms")
    {
        if (ty == 1)
        {
            ss = 4;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            res_j();
            res_k();
            i = sG1;
            j = 2;
            j1 = [];
            j2 = ["star1"];
            j3 = 2;
            j4 = 0;
            
            if (oBUI.loop)
                ss = 6;
            
            mg(sG2, 320, 260, [0, 1]);
            k1 = ["star1", "fall1", "fall1", "star1", "star1"];
            
            if (op.challengeMode)
            {
                ss--;
                ma(["star1", "followerStar", "keep", "depth2"], undefined, undefined, 320, -50, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.08, 1, 6, 2.2, 5, 3]);
            }
        }
        
        if (!op.challengeMode)
        {
            if (!((ty - 1) % 30))
                ma(["star1", "depth1"], undefined, undefined, 740, 195, undefined, undefined, -8, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1, 2.2, -8, 0]);
        }
        
        if (!((ty - 1) % 60))
        {
            mg(i, -100 + (op.challengeMode * 840), 280, [4 + (op.challengeMode * -8), 0]);
            mg(i, 740 + (op.challengeMode * -840), 170, [-4 + (op.challengeMode * 8), 0]);
            
            if (i == sG1)
                i = sG3;
            else
                i = sG1;
            
            j--;
            
            if (j <= 0)
            {
                if (j3 != 0)
                    j3--;
                
                if (array_length(j1) == 0)
                    j1 = array_shuffle(["star1", "fall1"]);
                
                if (j3 == 0)
                {
                    j3 = 0;
                    j2[0] = j1[0];
                }
                
                j4 = j1[0];
                j1[0] = k1[0];
                array_delete(k1, 0, 1);
                
                if (array_length(k1) == 0)
                    k1 = ["fall1", "fall1", "star1", "star1"];
                
                j2[0] = j1[0];
                
                if (j1[0] == "star1")
                {
                    if (j3 == 0 && j2[0] == j1[0])
                    {
                        j3 = 2;
                        
                        if (j2[0] == "star1")
                            j2[0] = "fall1";
                        else
                            j2[0] = "star1";
                        
                        k = 1;
                        
                        if (i == sG3)
                            k = -1;
                        
                        ma(["star2", "uf", "depth2"], undefined, undefined, -218 + (10 * k), 290, undefined, undefined, 4, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 3.2, 5, 10 - (oBUI.loop * 5)]);
                        ma(["handUp"], sHand1, undefined, 22 - (10 * k), 350, undefined, undefined, 4, undefined, undefined, undefined, 90, 90);
                        ma(["handUp"], sHand1, undefined, -16 - (10 * k), 374, undefined, undefined, 4, undefined, undefined, undefined, 95, 95);
                        ma(["handUp"], sHand1, undefined, 60 - (10 * k), 374, undefined, undefined, 4, undefined, undefined, undefined, 85, 85);
                        ma(["star2", "uf", "depth2"], undefined, undefined, 860 - (10 * k), 140, undefined, undefined, -4, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 3.2, -5, 10 - (oBUI.loop * 4)]);
                        ma(["handDown"], sHand1, undefined, 620 + (10 * k), 20, undefined, undefined, -4, undefined, undefined, undefined, -90, -90);
                        ma(["handDown"], sHand1, undefined, 582 + (10 * k), -4, undefined, undefined, -4, undefined, undefined, undefined, -95, -95);
                        ma(["handDown"], sHand1, undefined, 658 + (10 * k), -4, undefined, undefined, -4, undefined, undefined, undefined, -85, -85);
                        make_wow(-160, 290, 120, 80, 4);
                    }
                    else
                    {
                        ma(["star1", "depth1"], undefined, undefined, -100, 250, undefined, undefined, 4, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.5, 8, 0]);
                        ma(["star1", "depth1"], undefined, undefined, 740, 140, undefined, undefined, -4, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.5, -8, 0]);
                    }
                    
                    j = 2;
                }
                
                if (j1[0] == "fall1")
                {
                    if (j3 == 0 && j2[0] == j1[0])
                    {
                        j3 = 2;
                        
                        if (j2[0] == "star1")
                            j2[0] = "fall1";
                        else
                            j2[0] = "star1";
                        
                        ma(["star2", "uf", "depth2"], undefined, undefined, 550, -70, undefined, undefined, -3, 4.5, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 3.2, 5, 10 - (oBUI.loop * 5)]);
                        ma(["star2", "uf", "depth2"], undefined, undefined, 410, -70, undefined, undefined, -3, 4.5, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 3.2, 5, 10 - (oBUI.loop * 4)]);
                    }
                    
                    k = -1;
                    
                    repeat (3)
                    {
                        ma(["star1", "depth1"], undefined, undefined, 640 + (k * 320), -50, undefined, undefined, -3, 4.5, undefined, undefined, undefined, undefined, undefined, [0.1, 1, 0, 5, -8, 0]);
                        ma(["star1", "depth1"], undefined, undefined, 480 + (k * 320), -50, undefined, undefined, -3, 4.5, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 3, -8, 0]);
                        k++;
                    }
                    
                    j = 1;
                }
                
                array_delete(j1, 0, 1);
            }
        }
    }
    
    if (pattern == "handToss")
    {
        if (ty == 1)
        {
            ss = 10;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            mg(sG1, 240, 280);
            mg(sG3, 170, 184);
            squashHand(1, undefined, undefined, [sHand_LaughLoop, sHand_LaughLoopM], undefined, snd_grab);
            i1 = -1;
            i2 = 2;
            shots = 0;
            interval = 50;
            
            if (oBUI.loop)
                interval = 45;
        }
        
        oEnemie.eX += (50 - oEnemie.eX) / 10;
        
        if (!((ty + 10) % interval) && ty > 10 && !op.superMode)
            squashHand(1, 10, 0.005, [sHand_LaughLoop, sHand_LaughLoopM], undefined, snd_wing);
        
        if (!(ty % interval) && !op.superMode)
        {
            startAngle = 230;
            addAngle = 15;
            stars = [0, 0, 0, 0, 0];
            
            if (shots % 2)
            {
                startAngle -= (addAngle / 2);
                stars = [0, 0, 0, 0];
            }
            
            while (i1 == i2)
                i2 = irandom_range(1, array_length(stars) - 1);
            
            i1 = i2;
            stars[i2] = 1;
            i = 0;
            res_j();
            
            repeat (array_length(stars))
            {
                seed = ["walkDer", "fadeIn"];
                size = 1;
                spriteSize = 0;
                
                if (stars[i] == 0)
                {
                    array_push(seed, "star1");
                    array_push(seed, "canRandom");
                    size = 2;
                    spriteSize = 1;
                }
                
                if (stars[i] == 1)
                {
                    array_push(seed, "star2");
                    array_push(seed, "uf");
                    array_push(seed, "depth2");
                    size = 3.5;
                    spriteSize = 0;
                }
                
                ma(seed, undefined, undefined, 500, 120, undefined, undefined, undefined, undefined, undefined, undefined, startAngle, undefined, 5 + j1, [0.05, 1, spriteSize, size, 8 + ((i % 2) * -16), 5]);
                
                if (shots % 2 && i == 1)
                {
                    if (!op.superMode)
                        ma(["walkDer", "fadeIn", "star2", "uf", "depth1"], undefined, undefined, 500, 120, undefined, undefined, undefined, undefined, undefined, undefined, startAngle - (addAngle / 2), undefined, 3.5, [0.05, 1, 0, 3.25, 8 + (!(i % 2) * -16), 4]);
                }
                
                startAngle -= addAngle;
                i++;
            }
            
            ma(["star1", "walkDer", "fadeIn", "depth2"], undefined, undefined, 500, 120, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(500, 120, oSoul.x, oSoul.y), undefined, 6.5, [0.05, 1, 1, 2.2, 5, 5]);
            
            if (oBUI.loop || op.challengeMode)
            {
                ma(["star1", "walkDer", "fadeIn", "depth2"], undefined, undefined, 500, 120, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(500, 120, oSoul.x, oSoul.y) - 30, undefined, 6.5, [0.05, 1, 1, 2.2, 5, 5]);
                ma(["star1", "walkDer", "fadeIn", "depth2"], undefined, undefined, 500, 120, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(500, 120, oSoul.x, oSoul.y) + 30, undefined, 6.5, [0.05, 1, 1, 2.2, 5, 5]);
            }
            
            shots++;
        }
        
        if (op.challengeMode)
        {
            if (!(ty % 120))
                ma(["hand1", "keep", "graze2", "depth1", "bigStarsWooo"], sHand1, undefined, 100, -25, 2, 2);
        }
        
        if (op.superMode)
        {
            if (ty == 1)
            {
                ss = 8;
                res_i();
                res_j();
                res_k();
                i1 = -1;
                i2 = -1;
                i = -45;
            }
            
            i++;
            
            if (i == -10)
                squashHand(1, 10, 0.005, [sHand_LaughLoop, sHand_LaughLoopM], undefined, snd_wing);
            
            if (i == 1)
            {
                while (i1 == i2)
                    i1 = irandom_range(0, 1);
                
                i2 = i1;
                res_j();
                j5 = 1;
                
                if (i1 == 0)
                    j1 = [irandom_range(1, 4), irandom_range(6, 9)];
                
                if (i1 == 1)
                    j1 = [irandom_range(1, 3)];
            }
            
            if (i1 == 0 && i > 0)
            {
                if (!((i - 1) % 7))
                {
                    j4 = -0.5;
                    j3 = ["star1", "walkDer", "fadeIn", "depth2"];
                    
                    if (array_contains(j1, j2))
                    {
                        j3 = ["star2", "uf", "walkDer", "fadeIn", "depth2"];
                        j4 = 0.5;
                    }
                    
                    ma(j3, undefined, undefined, 500, 120, undefined, undefined, undefined, undefined, undefined, undefined, 195 + (dsin(i * 6) * 20), undefined, 6, [0.05, 1, 1, 2.2 + j4, 5 * j5, 5]);
                    j2++;
                    j5 *= -1;
                }
                
                if (j2 == 11)
                    i = -30;
            }
            
            if (i1 == 1 && i > 0)
            {
                j = 4;
                
                repeat (5)
                {
                    j4 = -0.5;
                    j3 = ["star1", "walkDer", "fadeIn", "depth2"];
                    
                    if (array_contains(j1, j2))
                    {
                        j3 = ["star2", "uf", "walkDer", "fadeIn", "depth2"];
                        j4 = 0.5;
                    }
                    
                    ma(j3, undefined, undefined, 500, 120, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(500, 120, oSoul.x, oSoul.y), undefined, j, [0.05, 1, 1, 2.2 + j4, 5 * j5, 5]);
                    j++;
                    j2++;
                    j5 *= -1;
                }
                
                i = -50;
            }
        }
    }
    
    if (pattern == "handSmash")
    {
        if (ty == 1)
        {
            ss = 4;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            mg(sG3, 120, 280, undefined, undefined, [0]);
            mg(sG3, 220, 260, undefined, undefined, [1]);
            mg(sG3, 320, 280, undefined, undefined, [2]);
            mg(sG3, 420, 260, undefined, undefined, [3]);
            mg(sG3, 520, 280, undefined, undefined, [4]);
            squashHand(0, 20, undefined, [sNothing, sNothing]);
            squashHand(1, undefined, undefined, [sHand_Aim, sHand_AimM], undefined, snd_wing);
            handAimX = 420;
            handAimY = 0;
            handTime = 0;
            platforms = [0, 0, 0, 0, 0];
            picked = -1;
            soulIsAt = -1;
            slams = 0;
            i = 0;
        }
        
        oEnemie.eX += ((-500 + handAimX) - oEnemie.eX) / 5;
        oEnemie.eY += (handAimY - oEnemie.eY) / 5;
        i = 0;
        
        repeat (array_length(platforms))
        {
            if (platforms[i] > 0)
                platforms[i]--;
            
            i++;
        }
        
        handTime++;
        
        if (handTime == 1)
        {
            if (picked == -1)
            {
                picked = 3;
            }
            else
            {
                picked = clamp(soulIsAt + irandom_range(-1, 1), 0, 4);
                
                if (platforms[picked] > 0)
                {
                    if (platforms[clamp(picked - 1, 0, 4)] == 0)
                        picked = clamp(picked - 1, 0, 4);
                    else if (platforms[clamp(picked + 1, 0, 4)] == 0)
                        picked = clamp(picked + 1, 0, 4);
                }
                
                while (platforms[picked] > 0)
                    picked = irandom_range(0, 4);
            }
            
            handAimX = 320 + ((-2 + picked) * 100);
        }
        
        if (handTime == (30 - (oBUI.loop * 10)))
        {
            setHand(undefined, [sHand_Smash, sHand_SmashM], undefined, function()
            {
                oEnemie.armScaleType[1] = 2;
                oEnemie.armExtraScale[1] = -1;
                oEnemie.shake = 10;
                screenShake(5, 5);
                snd(snd_grab);
                
                with (oPattern)
                    oPattern.handAimY = 50;
            });
        }
        
        if (handTime == (42 - (oBUI.loop * 10)))
        {
            platforms[picked] = 130 - (oBUI.loop * 15);
            ma(["slamBox", "noGraze", "NotDraw"], sPixel, undefined, handAimX - 40, 155, 80, 200);
            ma(["star1", "graze2", "depth1", "bounce"], undefined, undefined, handAimX, 285, undefined, undefined, -3.5 + op.challengeMode, -12, undefined, 0.5, undefined, undefined, undefined, [0.05, 1, 0, 2.5, 15, 10]);
            ma(["star1", "graze2", "depth1", "bounce"], undefined, undefined, handAimX, 285, undefined, undefined, 3.5 - op.challengeMode, -12, undefined, 0.5, undefined, undefined, undefined, [0.05, 1, 0, 2.5, -15, 10]);
        }
        
        if (handTime == (65 - (oBUI.loop * 10)))
        {
            with (oPattern)
                handAimY = 0;
            
            setHand(undefined, [sHand_Lift, sHand_LiftM], undefined, function()
            {
                oEnemie.armScaleType[1] = 2;
                oEnemie.armExtraScale[1] = 0.5;
                snd(snd_wing);
                setHand(undefined, [sHand_Aim, sHand_AimM]);
                
                with (oPattern)
                    handTime = 0;
            });
            ma(["star2", "uf"], undefined, undefined, handAimX, 360, undefined, undefined, undefined, -3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 3.5, -5, 10]);
            
            if (slams % 2 || op.challengeMode)
            {
                ma(["star1", "graze2", "depth1"], undefined, undefined, handAimX, 285 + (op.challengeMode * 20), undefined, undefined, undefined, -3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, op.challengeMode, 2.5, 5, 10]);
                ma(["star1", "graze2", "depth1"], undefined, undefined, handAimX, 435 - (op.challengeMode * 20), undefined, undefined, undefined, -3, undefined, undefined, undefined, undefined, undefined, [0.05, 1, op.challengeMode, 2.5, 5, 10]);
            }
            
            slams++;
        }
        
        with (oGround)
        {
            if (other.platforms[seed[0]] > 0)
            {
                move[1] = 12;
                
                if (y >= 380)
                {
                    y = 380;
                    move[1] = 0;
                }
            }
            else
            {
                move[1] = -4;
                
                if (y <= startY)
                {
                    y = startY;
                    move[1] = 0;
                }
            }
            
            if (oSoul.x > (x - 50) && oSoul.x < (x + 50))
                other.soulIsAt = seed[0];
        }
    }
    
    if (pattern == "lazer1")
    {
        if (ty == 1)
        {
            oBUI.damageTimes = 0.75;
            ss = 5;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            oBUI.soulFloorBounce = 13;
            mg(sG1, 220, 200, [0, 2]);
            res_i();
            i = 0;
            i1 = [];
            i2 = -1;
            res_j();
            j = 2;
            res_k();
            k = 5;
            squashHand(0, 20, undefined, [sNothing, sNothing]);
            squashHand(undefined, undefined, undefined, [sHand_Lazer, sHand_LazerM], undefined, snd_grab);
            ma(["drawLazer"], undefined, undefined, 0, 0, 0, 0);
        }
        
        if (i > 0)
            i--;
        
        if (i <= 0)
        {
            if (array_length(i1) == 0)
            {
                i1 = [0, 1, 2];
                
                if (i2 != -1)
                    array_delete(i1, i3, 1);
            }
            
            i2 = irandom_range(0, array_length(i1) - 1);
            i3 = i1[i2];
            k1 = 325;
            k1 -= (irandom_range(0, 3) * 10);
            j--;
            
            if (i3 == 0)
            {
                mg(sG1, 704, k1 - 25, [-k, 0]);
                
                if (j == 0)
                    ma(["star2", "uf", "starExplode"], undefined, undefined, 704, k1 - 150, undefined, undefined, -k, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5, 10], [[510, 105]]);
                
                i = 69 / (k / 2);
                i += (irandom_range(0, 3) * 10);
            }
            
            if (i3 == 1)
            {
                mg(sG2, 736, k1 - 75, [-k, 0]);
                i = 101 / (k / 2);
                
                if (j == 0)
                {
                    i += 30;
                    ma(["star2", "uf", "starExplode"], undefined, undefined, 890, k1 - 50, undefined, undefined, -k, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5, 10], [[510, 105]]);
                }
                else
                {
                    i += (irandom_range(0, 3) * 10);
                }
            }
            
            if (i3 == 2)
            {
                mg(sG5, 660, k1 - 50, [-k, 0]);
                mg(sG5, 690, k1 - 125, [-k, 0]);
                i = 40 / (k / 2);
                
                if (j == 0)
                {
                    i += 20;
                    ma(["star2", "uf", "starExplode"], undefined, undefined, 750, k1 - 100, undefined, undefined, -k, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5, 10], [[510, 105]]);
                }
                else
                {
                    i += (irandom_range(0, 3) * 10);
                }
            }
            
            array_delete(i1, i2, 1);
            
            if (j == 0)
                j = 2;
        }
        
        if (!(ty % 75))
        {
            ma(["handLazer", "keep", 0], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(520, 104, oSoul.x, oSoul.y));
            
            if (op.challengeMode)
            {
                ma(["handLazer", "keep", 1], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(520, 104, oSoul.x, oSoul.y) - 10);
                ma(["handLazer", "keep", 1], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(520, 104, oSoul.x, oSoul.y) + 10);
            }
        }
        
        if (op.challengeMode)
        {
            if (!(ty % 50))
                ma(["star1", "depth1", "graze2", "bounce"], undefined, undefined, 690, -25, undefined, undefined, -3, 0, undefined, 0.5, undefined, undefined, undefined, [0.05, 1, 0, 2.2, -8, 0]);
        }
    }
    
    if (pattern == "lazer2")
    {
        if (ty == 1)
        {
            oBUI.damageTimes = 0.75;
            ss = 4;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            oBUI.soulFloorBounce = 13;
            mg(sG1, 420, 200, [0, 2]);
            res_i();
            i = 0;
            i1 = [];
            i2 = -1;
            res_j();
            j = 2;
            res_k();
            k = 4;
            
            if (op.challengeMode)
                k = 5;
            
            squashHand(0, 20, undefined, [sNothing, sNothing]);
            squashHand(undefined, undefined, undefined, [sHand_Lazer, sHand_LazerM], undefined, snd_grab);
            ma(["drawLazer"], undefined, undefined, 0, 0, 0, 0);
        }
        
        if (op.challengeMode)
        {
            if (!(ty % 80))
            {
                ma(["hh1", "keep"], sHand1, undefined, -100, 130, undefined, undefined, 5, undefined, undefined, undefined, -90, -90);
                ma(["hh1", "keep", "depth2"], sHand1, undefined, -100, 190, undefined, undefined, 5, undefined, undefined, undefined, 90, 90);
            }
        }
        
        if (i > 0)
            i--;
        
        if (i <= 0)
        {
            if (array_length(i1) == 0)
            {
                i1 = [0, 1, 2];
                
                if (i2 != -1)
                    array_delete(i1, i3, 1);
            }
            
            i2 = irandom_range(0, array_length(i1) - 1);
            i3 = i1[i2];
            k1 = 325;
            k1 -= (irandom_range(0, 3) * 10);
            j--;
            
            if (i3 == 0)
            {
                mg(sG1, -64, k1 - 55, [k, 0]);
                i = 69 / (k / 2);
                i += (irandom_range(0, 3) * 10);
                
                if (j == 0)
                    ma(["star2", "uf", "starExplode"], undefined, undefined, -64, k1 - 150, undefined, undefined, k, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5, 13], [[510, 105]]);
            }
            
            if (i3 == 1)
            {
                mg(sG1, -126, k1 - 95, [k, 0]);
                mg(sG1, -66, k1 - 45, [k, 0]);
                i = 101 / (k / 2);
                
                if (j == 0)
                {
                    i += 30;
                    ma(["star2", "uf", "starExplode"], undefined, undefined, -250, k1 - 50, undefined, undefined, k, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5, 12], [[510, 105]]);
                }
                else
                {
                    i += (irandom_range(0, 3) * 10);
                }
            }
            
            if (i3 == 2)
            {
                mg(sG5, -20, k1 - 40, [k, 0]);
                mg(sG5, -70, k1 - 115, [k, 0]);
                i = 60 / (k / 2);
                
                if (j == 0)
                {
                    i += 20;
                    ma(["star2", "uf", "starExplode"], undefined, undefined, -110, k1 - 200, undefined, undefined, k, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5, 12], [[510, 105]]);
                }
                else
                {
                    i += (irandom_range(0, 3) * 10);
                }
            }
            
            array_delete(i1, i2, 1);
            
            if (j == 0)
                j = 2;
        }
        
        if (!(ty % 75))
        {
            j1 = point_direction(520, 104, oSoul.x, oSoul.y);
            j2 = j1;
            ma(["handLazer", "keep", 0], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, j1);
        }
        
        if (!((ty - 10) % 75) && ty > 10)
        {
            while (j2 > (j1 - 10) && j2 < (j1 + 10))
                j2 = 180 + (irandom_range(0, 6) * 10);
            
            ma(["handLazer", "keep"], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, j2);
        }
    }
    
    if (pattern == "lazer3")
    {
        if (ty == 1)
        {
            ss = 8;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            oBUI.soulFloorBounce = 13;
            res_i();
            i1 = 245;
            i2 = 150;
            mg(sGf1, i1, i2 - 115, undefined, undefined, ["spin", "1"]);
            mg(sGf1, i1 + 115, i2, undefined, undefined, ["spin", "2"]);
            mg(sGf1, i1, i2 + 115, undefined, undefined, ["spin", "3"]);
            mg(sGf1, i1 - 115, i2, undefined, undefined, ["spin", "4"]);
            ma(["star2", "starExplode"], undefined, undefined, i1, i2, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5, 10], [[i1 + 115, i2], [i1, i2 - 115], [i1 - 115, i2], [i1, i2 + 115], [i1 + 115, i2], [i1, i2 - 115], [i1, i2], [510, 105]]);
            res_i();
            i1 = -1;
            i4 = -1;
            squashHand(0, 20, undefined, [sNothing, sNothing]);
            squashHand(undefined, undefined, undefined, [sHand_Lazer, sHand_LazerM], undefined, snd_grab);
            ma(["drawLazer"], undefined, undefined, 0, 0, 0, 0);
            
            if (op.challengeMode)
                ma(["star1", "followerStar", "keep", "depth2"], undefined, undefined, 320, -50, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.08, 1, 6, 2.2, 5, 3]);
        }
        
        i3++;
        
        if (!(ty % 60))
        {
            i2 = 0;
            i3 = 0;
            
            if (i4 != -1)
                i1 = irandom_range(0, 2);
            else
                i1 = 0;
            
            while (i1 == i4 && i1 != 0)
                i1 = irandom_range(0, 2);
            
            i4 = i1;
        }
        
        if (i1 == 0)
        {
            i1 = -1;
            ma(["handLazer", "keep", 0], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(520, 104, oSoul.x, oSoul.y));
            ma(["handLazer", "keep"], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(520, 104, oSoul.x, oSoul.y) + 30);
            ma(["handLazer", "keep"], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(520, 104, oSoul.x, oSoul.y) - 30);
        }
        
        if (i1 == 1)
        {
            i2++;
            
            if (i2 % 2)
                ma(["handLazer", "keep", "late", i3], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 164 + (i2 * 2.5));
            
            if (i2 == 10)
                i1 = -1;
        }
        
        if (i1 == 2)
        {
            i2++;
            
            if (i2 % 2)
                ma(["handLazer", "keep", "late", i3], undefined, undefined, 520, 104, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 220 - (i2 * 2.5));
            
            if (i2 == 10)
                i1 = -1;
        }
    }
    
    if (pattern == "breather")
    {
        if (ty == 1)
        {
            oBUI.damageTimes = 0.5;
            ss = 10;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            oSoul.move = false;
            mg(sG5, 210, 90);
            mg(sG5, 160, 190);
            mg(sG5, 110, 290);
            mg(sG3, 320, 290);
            res_i();
            i1 = 10;
            i2 = 1;
            i3 = 0;
            res_k();
            
            if (op.challengeMode)
            {
                oSoul.move = true;
                k1 = 20;
                k = 0;
                
                repeat (20)
                {
                    ma(["star1", "followerStar", "keep", "depth2"], undefined, undefined, 320 + (dcos((k / k1) * 360) * 500), 150 - (dsin((k / k1) * 360) * 300), undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.08, 1, 6, 2.2, 5, 0]);
                    k++;
                }
            }
            
            res_k();
        }
        
        if ((!((ty + 10) % 50) && ty > 50) && op.soulX < 280)
            squashHand(1, 10, 0.005, [sHand_LaughLoop, sHand_LaughLoopM], undefined, snd_wing);
        
        if ((!(ty % 50) && ty > 50) && op.soulX < 280)
            ma(["star1", "canRandom", "walkDer", "fadeIn", "depth1"], undefined, undefined, 460, 120, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(500, 120, op.soulX, op.soulY), undefined, 5, [0.05, 1, 0, 1, 8, 5]);
        
        i++;
        
        if (i == i1 && i1 != 0)
        {
            ma(["star2", "starExplode", "noJumpScale"], undefined, undefined, 320 + (i2 * 0), 255 - (i3 * 20), undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 0, 4, 5 * i2, 5], [[525 + irandom_range(-50, 50), 190 + irandom_range(-75, 50)]]);
            i = 0;
            i2 *= -1;
            i3++;
            i1--;
        }
        
        if (ty == 45)
            oSoul.move = true;
        
        if (ss == 0)
        {
            k++;
            
            if (k == 10)
            {
                if (op.endingGet != "f" && (99 - oEnemie.inf_spareP) != 0)
                    spareEne(0, 99 - oEnemie.inf_spareP);
                
                snd(snd_birdtweet);
                oEnemie.starsOn = true;
            }
        }
    }
    
    if (pattern == "final")
    {
        if (ty == 1)
        {
            ss = 20;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            oSoul.move = false;
            oSoul.drawL = 0;
            oSoul.x = oSoul.goX;
            oSoul.y = oSoul.goY;
            oBUI.soulFloorCap = 400;
            oBUI.soulFloorBounce = 18;
            res_i();
            i2 = -1;
            i5 = 50;
            res_j();
            mg(sGf1, 320, 248, undefined, undefined, ["instaVis"]);
            ma(["drawLazer"], undefined, undefined, 0, 0, 0, 0);
            prevSS = ss;
            ssTime = 0;
            oEnemie.starsOn = false;
        }
        
        if (oBUI.move_TP2 > -300)
            oBUI.move_TP2 -= 10;
        
        if (ty > 0)
            oBUI.move_UI = clamp(oBUI.move_UI + 10, 0, 200);
        
        if (ty == 30)
        {
            squashHand(0, 20, undefined, [sNothing, sNothing]);
            squashHand(1, undefined, -0.01, [sHand_EyeClose, sHand_EyeCloseM], function()
            {
                oEnemie.starsOn = false;
            }, snd_wing);
        }
        
        if (ty == 60)
        {
            squashHand(1, undefined, 0.01, [sHand_laughExtend, sHand_laughExtendM], function()
            {
                oEnemie.shakeWhole = true;
                oEnemie.drawL = 2;
                snd(snd_handScream);
            }, snd_grab);
        }
        
        if (ty == 70)
        {
            with (instance_create_depth(0, 0, -9999, oCC))
            {
                res_i();
                i1 = [];
                surf = -1;
                
                funcDrawGUI = function()
                {
                    if (!surface_exists(surf))
                        surf = surface_create(320, 240);
                    
                    i++;
                    
                    if (!((i + 14) % 15))
                    {
                        if (array_length(i1) < 6)
                            array_push(i1, 0);
                    }
                    
                    surface_set_target(surf);
                    draw_clear_alpha(c_white, 0);
                    i2 = 0;
                    
                    repeat (array_length(i1))
                    {
                        i1[i2] += 5;
                        draw_circle(210, 80, i1[i2], true);
                        i2++;
                    }
                    
                    surface_reset_target();
                    draw_surface_ext(surf, 0, 0, 2, 2, 0, c_white, 1);
                    
                    if (i > 130)
                        des();
                };
            }
        }
        
        if (ty == 120)
            snd(snd_undynedis);
        
        if (ty > 120)
        {
            i += 0.5;
            oEnemie.circle += i;
        }
        
        if (ty == 180)
        {
            squashHand(1, undefined, 0.01, [sHand_SpecialRise, sHand_SpecialRiseM], function()
            {
                oEnemie.shakeWhole = false;
                oEnemie.shakeX = 0;
                oEnemie.shakeY = 0;
                oEnemie.armExtraScale[1] = 0;
                oEnemie.eY = -10;
            }, snd_wing);
        }
        
        if (ty == 210)
        {
            oBUI.drawUI = false;
            op.camMode = "soul";
            oSoul.move = true;
            oSoul.drawL = 1;
            ma(["star2", "edgeSafe", "depth1"], undefined, undefined, 320, 170, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.075, 1, 0, 3.75, 5, 5], [[320, -30], [320, -230], [320, -130], [320, -400], [220, -400], [420, -400], [480, -480], [520, -580], [320, -730], [160, -790], [120, -890], [320, -1000], [420, -1090], [220, -1190], [270, -1290], [370, -1390], [300, -1490], [340, -1590], [320, -2270]]);
            mg(sGf2, 320, 150);
            mg(sGf1, 220, 50);
            mg(sGf1, 370, -50);
            mg(sGf1, 420, -150);
            mg(sGf1, 220, -150);
            mg(sGf1, 320, -250);
            mg(sGf2, 320, -350);
            mg(sGf1, 480, -450);
            mg(sGf1, 520, -550);
            mg(sGf2, 420, -630);
            mg(sGf2, 220, -660);
            mg(sGf1, 160, -760);
            mg(sGf1, 120, -860);
            mg(sGf1, 320, -960);
            mg(sGf1, 420, -1060);
            mg(sGf1, 220, -1160);
            mg(sGf1, 270, -1260);
            mg(sGf1, 370, -1360);
            mg(sGf1, 300, -1460);
            mg(sGf1, 340, -1560);
            mg(sGf1, 220, -1660);
            mg(sGf1, 420, -1760);
            mg(sGf1, 270, -1860);
            mg(sGf1, 370, -1960);
            mg(sGf1, 300, -2060);
            mg(sGf1, 320, -2160);
            i3 = [[0.075, 1, 0, 3.5, -10, 1], [0.05, 1, 0, 2.2, -10, 1], -1, -1];
            instance_create_depth(0, 480, -15000, oArmChase);
            side = -370;
        }
        
        if (ty > 210)
        {
            oBUI.soulFloorCap = clamp(oBUI.soulFloorCap, -1996, 480);
            oBUI.soulFloorCap -= 1;
            
            if ((oSoul.y - oArmChase.y) > 250)
                oBUI.soulFloorCap += 0.5;
            
            if ((oSoul.y - oArmChase.y) < 150)
                oBUI.soulFloorCap -= 1;
            
            if ((oSoul.y - oArmChase.y) < 50)
                oBUI.soulFloorCap -= 1;
            
            if ((oSoul.y - oArmChase.y) < 0)
                oBUI.soulFloorCap -= 1;
            
            oArmChase.y += (oBUI.soulFloorCap - 400 - oArmChase.y) / 10;
            
            if (op.challengeMode && ss > 0)
            {
                if (!(ty % 120))
                {
                    ma(["star1", "followerStar", "keep", "edgeSafe", "screenGone", "depth2"], undefined, undefined, 320 + side, oSoul.y - 280, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [0.08, 1, 6, 2.2, 5, 0]);
                    side *= -1;
                }
            }
        }
        
        if (ty == 240)
        {
            oEnemie.forceSpace = true;
            oEnemie.drawL = 0;
            oEnemie.eX = -170;
            oEnemie.eY = -2550;
            setHand(1, [sHand_Aim2, sHand_AimM]);
        }
        
        if (i2 == -1 && ss < 20)
            i2 = 0;
        
        if (i2 == 0 && ss < 17)
            i2 = 1;
        
        if (i2 == 1 && ss < 14)
        {
            i2 = 2;
            i4 = 30;
        }
        
        if (i2 == 2 && ss < 8)
        {
            i2 = 3;
            i4 = 30;
        }
        
        if (ss == 7 && ss != prevSS)
            i5 -= 2;
        
        if (ss == 6 && ss != prevSS)
            i5 -= 1;
        
        if (ss == 5 && ss != prevSS)
            i5 -= 2;
        
        if (ss == 4 && ss != prevSS)
            i5 -= 1;
        
        if (ss == 3 && ss != prevSS)
            i5 -= 2;
        
        if (ss == 2 && ss != prevSS)
            i5 -= 1;
        
        if (ss == 1 && ss != prevSS)
            i5 -= 2;
        
        if (ss > 0)
        {
            if (i2 >= 0)
            {
                if (oEnemie.starAlpha[0] < 1)
                    oEnemie.starAlpha[0] += 1/30;
            }
            
            if (i2 >= 1)
            {
                if (oEnemie.starAlpha[1] < 1)
                    oEnemie.starAlpha[1] += 1/30;
            }
            
            if (i2 >= 2)
            {
                if (oEnemie.starAlpha[2] < 1)
                    oEnemie.starAlpha[2] += 1/30;
            }
            
            if (i2 >= 3)
            {
                if (oEnemie.starAlpha[3] < 1)
                    oEnemie.starAlpha[3] += 1/30;
            }
        }
        
        prevSS = ss;
        
        if (i4 > 0)
            i4--;
        
        if (i4 == 0 && ss > 0)
        {
            if ((i2 == 0 && !(ty % 50)) || (i2 == 2 && !(ty % 80)) || (i2 == 3 && !(ty % 100) && oSoul.y > -1900))
            {
                i3[2] = i3[0];
                i3[3] = i3[1];
                i3[0] = i3[3];
                i3[1] = i3[2];
                ma(["star1", "screenGone", "depth2"], undefined, undefined, -50, (-50 + oSoul.y) - 240, undefined, undefined, 5, 5, undefined, undefined, undefined, undefined, undefined, i3[0]);
                ma(["star1", "screenGone", "depth2"], undefined, undefined, 0, (-150 + oSoul.y) - 240 - 150, undefined, undefined, 5, 5, undefined, undefined, undefined, undefined, undefined, i3[1]);
                ma(["star1", "screenGone", "depth2"], undefined, undefined, -300, ((-150 + oSoul.y) - 240) + 150, undefined, undefined, 5, 5, undefined, undefined, undefined, undefined, undefined, i3[1]);
                ma(["star1", "screenGone", "depth2"], undefined, undefined, 250, (-50 + oSoul.y) - 240 - 300, undefined, undefined, 5, 5, undefined, undefined, undefined, undefined, undefined, i3[0]);
                ma(["star1", "screenGone", "depth2"], undefined, undefined, -350, ((-50 + oSoul.y) - 240) + 300, undefined, undefined, 5, 5, undefined, undefined, undefined, undefined, undefined, i3[0]);
            }
            
            if ((i2 == 1 && !(ty % 50)) || (i2 == 2 && !((ty - 40) % 80)) || (i2 == 3 && !((ty - 50) % 100) && oSoul.y > -1900))
            {
                i3[2] = i3[0];
                i3[3] = i3[1];
                i3[0] = i3[3];
                i3[1] = i3[2];
                ma(["star1", "screenGone", "depth2"], undefined, undefined, 690, (-50 + oSoul.y) - 240, undefined, undefined, -5, 5, undefined, undefined, undefined, undefined, undefined, i3[0]);
                ma(["star1", "screenGone", "depth2"], undefined, undefined, 940, ((-150 + oSoul.y) - 240) + 150, undefined, undefined, -5, 5, undefined, undefined, undefined, undefined, undefined, i3[1]);
                ma(["star1", "screenGone", "depth2"], undefined, undefined, 640, (-150 + oSoul.y) - 240 - 150, undefined, undefined, -5, 5, undefined, undefined, undefined, undefined, undefined, i3[1]);
                ma(["star1", "screenGone", "depth2"], undefined, undefined, 990, ((-50 + oSoul.y) - 240) + 300, undefined, undefined, -5, 5, undefined, undefined, undefined, undefined, undefined, i3[0]);
                ma(["star1", "screenGone", "depth2"], undefined, undefined, 390, (-50 + oSoul.y) - 240 - 300, undefined, undefined, -5, 5, undefined, undefined, undefined, undefined, undefined, i3[0]);
            }
            
            j++;
            
            if (i2 == 3 && j >= i5)
            {
                j = 0;
                ma(["handLazer", "keep", 0], undefined, undefined, 320, -2270, undefined, undefined, undefined, undefined, undefined, undefined, undefined, point_direction(320, -2270, oSoul.x, oSoul.y));
            }
        }
        
        if (ss == 0)
        {
            with (oAttack)
            {
                if (!as("star1") && !as("star2"))
                    des();
            }
            
            op.camMode = "finalEnd";
            ssTime++;
        }
        
        if (ssTime == 1)
        {
            if (!op.customMode)
            {
                if (op.challengeMode)
                    array_push(op.save, "challengeMode");
                
                if (op.noHitWin)
                {
                    array_push(op.save, "winNoHit");
                    
                    if (op.challengeMode)
                        array_push(op.save, "challengeMode_NH");
                }
            }
            else
            {
                if (op.superMode)
                {
                    array_push(op.save, "challengeMode");
                    array_push(op.save, "superMode");
                    
                    if (op.noHitWin)
                    {
                        array_push(op.save, "winNoHit");
                        array_push(op.save, "challengeMode_NH");
                        array_push(op.save, "superMode_NH");
                    }
                }
                
                room_goto(rCustomMode);
            }
        }
        
        if (ssTime == 60)
        {
            oEnemie.drawL = 2;
            oEnemie.shake = 10;
            
            if (!op.challengeMode)
                audio_play_sound(op.music_battleEnd[op.musicStyle], -9999, false);
            
            with (instance_create_depth(0, 0, -9999, oCC))
            {
                res_i();
                i2 = [0, 0, 0, 0];
                i1 = 0;
                
                funcDrawGUI = function()
                {
                    gpu_set_blendmode(bm_add);
                    
                    if (oPattern.ssTime > 342)
                    {
                        i2[0] += 1/30;
                        
                        if (oEnemie.starAlpha[0] > 0)
                            oEnemie.starAlpha[0] -= 1/30;
                        
                        ext(sConstellations, 0, 150, 100, 2, 2, undefined, undefined, i2[0]);
                    }
                    
                    if (oPattern.ssTime > 414)
                    {
                        i2[1] += 1/30;
                        
                        if (oEnemie.starAlpha[1] > 0)
                            oEnemie.starAlpha[1] -= 1/30;
                        
                        ext(sConstellations, 2, 134, 280, 2, 2, undefined, undefined, i2[1]);
                    }
                    
                    if (oPattern.ssTime > 483)
                    {
                        i2[2] += 1/30;
                        
                        if (oEnemie.starAlpha[2] > 0)
                            oEnemie.starAlpha[2] -= 1/30;
                        
                        ext(sConstellations, 3, 506, 280, 2, 2, undefined, undefined, i2[2]);
                    }
                    
                    if (oPattern.ssTime > 555)
                    {
                        i2[3] += 1/30;
                        
                        if (oEnemie.starAlpha[3] > 0)
                            oEnemie.starAlpha[3] -= 1/30;
                        
                        ext(sConstellations, 1, 490, 100, 2, 2, undefined, undefined, i2[3]);
                    }
                    
                    if (oPattern.ssTime > 780)
                    {
                        i++;
                        
                        if (i1 < 1)
                            i1 += 0.016666666666666666;
                    }
                    
                    gpu_set_blendmode(bm_subtract);
                    ext(sPixel, 0, -100, -100, 999, 999, 0, make_color_rgb(clamp(255 * i1, 0, 255), clamp(255 * i1, 0, 255), clamp(255 * i1, 0, 255)), 1);
                    gpu_set_blendmode(bm_normal);
                    
                    if (i == 120)
                    {
                        if (op.noHitWin)
                            room_goto(rEndingNoHit);
                        else
                            room_goto(rEnding);
                    }
                };
            }
        }
        
        if (ssTime == 50)
        {
        }
        
        if (ssTime == 130)
            oEnemie.shake = 5;
        
        if (ssTime == 191)
            squashHand(1, undefined, undefined, [sHand_EyeClose, sHand_EyeCloseM]);
        
        if (ssTime == 332)
            squashHand(1, undefined, undefined, [sHand_Idle2, sHand_IdleM2]);
        
        if (ssTime == 470)
            squashHand(1, undefined, undefined, [sHand_Sad, sHand_SadM]);
        
        if (ssTime >= 668 && ssTime < 698)
            oEnemie.glow += 1/30;
        
        if (ssTime == 698)
        {
            ma(["star1", "screenGone", "depth2"], undefined, undefined, 320, -2250, undefined, undefined, 0, 0, 0.25, undefined, undefined, undefined, undefined, [0.05, 1, 0, 2.2, 5, 5]);
            ma(["star1", "screenGone", "depth2"], undefined, undefined, 290, -2300, undefined, undefined, 1, 0, 0.25, undefined, undefined, undefined, undefined, [0.05, 1, 1, 4, -4, 5]);
            ma(["star1", "screenGone", "depth2"], undefined, undefined, 350, -2280, undefined, undefined, 0, 0, 0.25, undefined, undefined, undefined, undefined, [0.025, 1, 0, 4, -4, 5]);
            ma(["star1", "screenGone", "depth2"], undefined, undefined, 340, -2190, undefined, undefined, 1.5, 0, 0.25, undefined, undefined, undefined, undefined, [0.025, 1, 0, 2.2, 5, 5]);
            ma(["star1", "screenGone", "depth2"], undefined, undefined, 340, -2330, undefined, undefined, 0.5, 0, 0.25, undefined, undefined, undefined, undefined, [0.075, 1, 1, 2.2, 5, 5]);
        }
        
        if (ssTime > 698)
        {
            if (oEnemie.drawAlpha > 0)
                oEnemie.drawAlpha -= 1/30;
        }
    }
    
    if (pattern == "thinPlatforms")
    {
        if (ty == 1)
        {
            ss = 6;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
            mg(sG5, 320, 240, undefined, 0);
            
            if (!oBUI.loop)
                mg(sG5, 220, 160, undefined, 1);
            
            mg(sG5, 120, 240, undefined, 2);
            
            if (!oBUI.loop)
                mg(sG5, 420, 160, undefined, 2);
            
            mg(sG5, 520, 240, undefined, 1);
            ma(["hh1", "keep"], sHand1, undefined, 370, 110, undefined, undefined, undefined, undefined, undefined, undefined, -90, -90);
            ma(["hh1", "keep", "depth2"], sHand1, undefined, 370, 210, undefined, undefined, undefined, undefined, undefined, undefined, 90, 90);
            ma(["hh1", "keep", "1"], sHand1, undefined, 170, 110, undefined, undefined, undefined, undefined, undefined, undefined, -90, -90);
            ma(["hh1", "keep", "1", "depth2"], sHand1, undefined, 170, 210, undefined, undefined, undefined, undefined, undefined, undefined, 90, 90);
            
            if (!oBUI.loop)
                ma(["star2"], undefined, undefined, 520, 200, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [[420, 120], [320, 50], [320, 200], [220, 120], [120, 200]]);
            
            if (oBUI.loop)
            {
                ss = 5;
                ma(["star2"], undefined, undefined, 520, 200, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [[420, 200], [320, 200], [220, 200], [120, 200]]);
            }
            
            make_wow(390, 266, 12, 100);
            make_wow(130, 6, 20, 20);
            make_wow(70, 280, 20, 20);
        }
        
        if (!((ty - 1) % 40))
        {
            ma(["star1", "canRandom"], undefined, undefined, 270, -50, undefined, undefined, undefined, 3);
            ma(["star1", "canRandom"], undefined, undefined, 470, 375, undefined, undefined, undefined, -3);
        }
    }
    
    if (pattern == "fallingPlatforms2")
    {
        if (ty == 1)
        {
            ss = 6;
            oBUI.extraTP = 0;
            oSoul.mode = "b";
            res_i();
        }
        
        if (!((ty - 1) % 30))
            mg(sGf3, 320, -50, [0, 3]);
    }
    
    if (op.challengeMode)
    {
        if (ty == 1)
            oBUI.damageTimes += round(oBUI.damageTimes / 2);
    }
    
    if (op.alexMode || op.challengeMode)
    {
        if (ty == 1)
        {
            if (op.alexMode)
                oBUI.damageTimes += oBUI.damageTimes;
            
            if (op.challengeMode)
                oBUI.damageTimes += oBUI.damageTimes * 0.75;
            
            alex_timer = oBUI.alexTimerTrack;
            
            if (pattern == "final")
                alex_timer = 70;
        }
        
        alex_timer -= (1 / irandom_range(27, 33));
        oBUI.alexTimeShow = alex_timer;
        
        if (alex_timer < 0 && !(ty % 30) && ss > 0 && op.custom_dt)
        {
            ma(sPixel, undefined, undefined, 0, 0, 9999, 9999);
            spareEne(0, -2);
        }
    }
}
