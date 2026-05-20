time++;
use_keys();

if (page == "dia")
    res_keys();

if (TapZ || (TapX && page != 0))
    des(oText);

if (TapZ)
    faceTime = 0;

if (page == 0)
{
    faceImage = 0;
    faceImage2 = 0;
    handImage = 2;
    handImage2 = 0;
    
    if (TapUP)
    {
        cur--;
        
        if (cur < 0)
            cur = 3;
    }
    
    if (TapDOWN)
    {
        cur++;
        
        if (cur > 3)
            cur = 0;
    }
    
    if (TapZ && cur == 0)
    {
        TapZ = false;
        TapX = false;
        page = "buy";
        cur = 0;
        do_text([430], [266], g_t("9_6"), ["mono", "bc", "keysOff", "shopSide2"], [sFontSock], undefined, [snd_txtMonster]);
    }
    
    if (TapZ && cur == 1)
    {
        TapZ = false;
        TapX = false;
        page = "dia";
        do_text(undefined, undefined, g_t("9_1"), ["ow", "shop"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, undefined, [function()
        {
            oShop.faceImage = 3;
            oShop.targetX = 0;
            oShop.targetY = 0;
            oShop.targetXhand = 0;
            oShop.targetYhand = 0;
            oShop.targetSpeed = 1;
        }, function()
        {
            oShop.faceImage = 0;
            oShop.targetX = 0;
            oShop.targetY = 0;
            oShop.targetXhand = 0;
            oShop.targetYhand = 0;
            oShop.targetSpeed = 1;
        }, function()
        {
            oShop.faceImage = 1;
            oShop.targetX = 0;
            oShop.targetY = -10;
            oShop.targetXhand = 0;
            oShop.targetYhand = 0;
            oShop.targetSpeed = 1;
        }], function()
        {
            oShop.page = 0;
            oShop.textMainTrig = true;
            oShop.faceImage = 0;
            oShop.targetX = 0;
            oShop.targetY = 0;
            oShop.targetXhand = 0;
            oShop.targetYhand = 0;
            oShop.targetSpeed = 1;
        });
    }
    
    if (TapZ && cur == 2)
    {
        TapZ = false;
        TapX = false;
        page = "talk";
        cur = 0;
        do_text([430], [266], g_t("9_10"), ["mono", "bc", "keysOff", "shopSide2"], [sFontSock], undefined, [snd_txtMonster]);
    }
    
    if (TapZ && cur == 3)
    {
        TapZ = false;
        TapX = false;
        page = "dia";
        do_text(undefined, undefined, g_t("9_2"), ["mono", "bc", "ow", "shop"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, undefined, undefined, function()
        {
            with (instance_create_depth(oPlayer.x - 10, oPlayer.y - 10, 0, oDoor))
            {
                image_alpha = 0;
                _room = rSockHouse;
                _x = 320;
                _y = 280;
            }
        });
    }
}

if (page == "buy")
{
    if (TapUP)
    {
        cur--;
        
        if (cur < 0)
            cur = 4;
    }
    
    if (TapDOWN)
    {
        cur++;
        
        if (cur > 4)
            cur = 0;
    }
    
    if (TapX || (TapZ && cur == 4))
    {
        TapZ = false;
        TapX = false;
        page = 0;
        cur = 0;
        textMainTrig = true;
        faceImage = 0;
        faceImage2 = 0;
        handImage = 2;
        handImage2 = 0;
    }
    
    if (TapZ && cur != 4)
    {
        if (soldOut[cur][1] == 0)
        {
            TapZ = false;
            TapX = false;
            curSave = cur;
            page = "buy2";
            cur = 0;
        }
        else
        {
            do_text([430], [266], g_t("9_9"), ["mono", "bc", "keysOff", "shopSide2"], [sFontSock], undefined, [snd_txtMonster]);
        }
    }
}

if (page == "buy2")
{
    if (TapUP || TapDOWN)
    {
        if (cur == 0)
            cur = 1;
        else
            cur = 0;
    }
    
    if (TapZ && cur == 0)
    {
        if (op.gold >= costs[curSave])
        {
            snd(snd_locker);
            faceImage = 1;
            faceImage2 = 0;
            handImage = 15;
            handImage2 = 0;
            
            if (soldOut[curSave][0] != 0)
                soldOut[curSave][1] = 1;
            
            if (curSave == 0)
                array_push(op.item, "yolkPudd");
            
            if (curSave == 1)
                array_push(op.item, "sockRoll");
            
            if (curSave == 2)
                array_push(op.item, "starfruit");
            
            if (curSave == 3)
                array_push(op.progress, "ticket");
            
            op.gold -= costs[curSave];
            do_text([430], [266], g_t("9_3"), ["mono", "bc", "keysOff", "shopSide2"], [sFontSock], undefined, [snd_txtMonster]);
        }
        else
        {
            faceImage = 0;
            faceImage2 = 0;
            handImage = 2;
            handImage2 = 0;
            do_text([430], [266], g_t("9_8"), ["mono", "bc", "keysOff", "shopSide2"], [sFontSock], undefined, [snd_txtMonster]);
        }
    }
    
    if (TapX || TapZ)
    {
        if (cur == 1 || TapX)
        {
            faceImage = 0;
            faceImage2 = 0;
            handImage = 2;
            handImage2 = 0;
            do_text([430], [266], g_t("9_7"), ["mono", "bc", "keysOff", "shopSide2"], [sFontSock], undefined, [snd_txtMonster]);
        }
        
        TapZ = false;
        TapX = false;
        page = "buy";
        cur = curSave;
        oShop.targetX = 0;
        oShop.targetY = 0;
    }
}

if (page == "talk")
{
    if (TapUP)
    {
        cur--;
        
        if (cur < 0)
            cur = 4;
    }
    
    if (TapDOWN)
    {
        cur++;
        
        if (cur > 4)
            cur = 0;
    }
    
    res_i();
    i1 = [];
    i2 = [];
    i3 = [snd_txtSock];
    i4 = [sFontSock];
    
    i5 = function()
    {
        oShop.page = "talk";
        oShop.textTalkTrig = true;
        oShop.handTalk = false;
        oShop.faceImage = 0;
        oShop.faceImage2 = 0;
        oShop.handImage = 2;
        oShop.handImage2 = 0;
        oShop.targetX = 0;
        oShop.targetY = 0;
        oShop.targetXhand = 0;
        oShop.targetYhand = 0;
        oShop.targetSpeed = 5;
        instance_destroy(oPuppet);
    };
    
    if (TapZ && cur == 0)
    {
        i1 = g_t("8_1");
        i2 = [function()
        {
            shop_face(3);
        }, function()
        {
            shop_face(14, 17, undefined, undefined, 4, undefined, 130);
        }, function()
        {
            shop_face(11, 2, undefined, undefined, 20, undefined, 0);
        }, function()
        {
            shop_face(1, undefined, 50, undefined, 0.5);
        }, function()
        {
            shop_face(0, undefined, 0, undefined, 2);
        }, function()
        {
            shop_face(4, undefined, -40, 20, 5, undefined, 40);
        }];
    }
    
    if (TapZ && cur == 1)
    {
        i1 = g_t("8_2");
        i2 = [function()
        {
            shop_face(7, undefined, -10, 0, 1);
        }, function()
        {
            shop_face(1, undefined, 30, 0, 0.5);
        }, function()
        {
        }, function()
        {
            shop_face(5, undefined, undefined, 30, 3);
        }];
    }
    
    if (TapZ && cur == 2)
    {
        i1 = g_t("8_3");
        i2 = [function()
        {
            shop_face(10, 16);
            handShake = true;
        }, function()
        {
        }, function()
        {
        }, function()
        {
            shop_face(11);
            handShake = false;
        }, function()
        {
            shop_face(undefined, 2, undefined, undefined, 2, true, 0);
        }];
        i3 = [snd_txtSock, snd_txtSock, snd_txtSock, snd_txtSock, snd_txtMonster, snd_txtSock];
        i4 = [sFontSock, sFontSock, sFontSock, sFontSock, sFont1];
    }
    
    if (TapZ && cur == 3)
    {
        i1 = g_t("8_4");
        i2 = [-1];
        i2 = [function()
        {
            array_push(op.progress, "talkP1");
            shop_face(3);
        }, function()
        {
            shop_face(13);
        }, function()
        {
            shop_face(12, 16);
            handShake = true;
        }, function()
        {
            shop_face(4, 15);
            handShake = false;
        }, function()
        {
            shop_face(3, undefined, -20, undefined, 1, undefined, -20);
        }, function()
        {
            shop_face(4, 16);
        }, function()
        {
            shop_face(14, 17, 0, 0, 6, undefined, 130, 0);
        }, function()
        {
            handShake = true;
        }, function()
        {
            shop_face(3, 15, 0, 0, 6, undefined, 76);
            handShake = false;
        }, function()
        {
            shop_face(undefined, 17, undefined, undefined, 4, undefined, 100);
        }, function()
        {
            shop_face(13, 2, undefined, undefined, 4, undefined, 50);
        }, function()
        {
            shop_face(4, 2, 0, 0, 6, undefined, 0, 0);
        }, function()
        {
            shop_face(11);
        }];
        
        if (talkProgress[3][1] == 1)
        {
            if (!array_contains(op.progress, "ticket"))
            {
                i1 = g_t("8_5");
                i2 = [function()
                {
                    shop_face(1, undefined, 50, undefined, 4);
                }, function()
                {
                    shop_face(undefined, 15);
                }];
            }
            else
            {
                i1 = g_t("8_6");
                i2 = [function()
                {
                    shop_face(4);
                }, function()
                {
                    shop_face(3);
                }, function()
                {
                    shop_face(11, undefined, undefined, undefined, 4, undefined, undefined, 100);
                }];
                
                i5 = function()
                {
                    oShop.sockLock = true;
                    oShop.targetX = 0;
                    oShop.targetY = 200;
                    oShop.targetSpeed = 5;
                    oShop.curtain(380);
                    oShop.pupStart = 0;
                    instance_create_depth(0, 0, 0, oPuppetShadow);
                    oShop.time = 0;
                    
                    oShop.run = function()
                    {
                        if (oShop.time == 60)
                        {
                            oPuppetShadow.lightMode = 0;
                            oPuppetShadow.lightTime = 0;
                            snd(snd_noise);
                        }
                    };
                    
                    audio_sound_gain(mus_Socks_world_8bit, 0, 250);
                };
            }
        }
    }
    
    if (TapZ && cur != 4)
    {
        TapZ = false;
        TapX = false;
        page = "dia";
        
        if (talkProgress[cur][1] < talkProgress[cur][0])
            talkProgress[cur][1]++;
        
        do_text(undefined, undefined, i1, ["ow", "shop"], i4, undefined, i3, undefined, undefined, undefined, i2, i5);
    }
    
    if (TapX || (TapZ && cur == 4))
    {
        TapZ = false;
        TapX = false;
        page = 0;
        cur = 2;
        textMainTrig = true;
    }
}

if (textMainTrig)
{
    textMainTrig = false;
    do_text([34], [266], g_t("9_5"), ["mono", "bc", "keysOff", "shopSide1"], [sFontSock], undefined, [snd_txtMonster]);
}

if (textTalkTrig)
{
    textTalkTrig = false;
    do_text([430], [266], g_t("9_11"), ["mono", "bc", "keysOff", "shopSide2"], [sFontSock], undefined, [snd_txtMonster]);
}

if (pupStart != -1)
    pupStart++;

if (pupStart == 100)
{
    des(oText);
    page = "dia";
    do_text(undefined, undefined, g_t("8_7"), ["ow", "shop", "noSkip", "privilegeCskipA"], [sFontSock], undefined, [snd_txtSock], undefined, undefined, undefined, [function()
    {
        oShop.run = -1;
        snd(snd_drumroll);
        audio_stop_sound(mus_Socks_World);
        audio_stop_sound(mus_Socks_world_8bit);
    }, function()
    {
        oPuppetShadow.lightMode = 1;
        snd(snd_wing);
        ow_music(mus_puppetshow_1);
        op.twait = 15;
        oShop.curtain(70);
        oShop.bcON = true;
        pup("tree1", 120, 460, -900, sPlay1, 0, ["gray"]);
        pup_an("tree1", 2, undefined, 160, undefined, undefined, ["ex"]);
        pup("tree2", 320, 560, -1000, sPlay1, 0, ["gray"]);
        pup_an("tree2", 2, undefined, 160, undefined, undefined, ["ex"]);
        pup("tree3", 520, 510, -900, sPlay1, 0, ["gray"]);
        pup_an("tree3", 2, undefined, 160, undefined, undefined, ["ex"]);
        pup("house", 320, 622, -1100, sPlay1, 1);
        pup_an("house", 0, undefined, 122, undefined, undefined, ["ex"]);
        pup("sock1", -100, 220, -1200, sSockFolk, 0, ["wobY"]);
        pup_an("sock1", 3, 220);
        pup("sock2", -100, 220, -1200, sSockFolk, 2, ["wobY"]);
        pup_an("sock2", 2, 100);
        pup("sock3", 740, 220, -1200, sSockFolk, 0, ["wobY", "flip"]);
        pup_an("sock3", 3, 420);
        pup("sock4", 740, 220, -1200, sSockFolk, 2, ["wobY", "flip"]);
        pup_an("sock4", 2, 540);
    }, function()
    {
        var i = 0;
        
        repeat (4)
        {
            i++;
            pup_an("sock" + string(i), undefined, undefined, undefined, undefined, function()
            {
                with (other)
                {
                    slick = 10;
                    wob = x;
                }
            }, ["forceWobY"]);
        }
    }, function()
    {
        var i = 0;
        var i1 = 0;
        
        repeat (4)
        {
            i++;
            i1 = "b";
            
            if (i == 1 || i == 4)
                i1 = "a";
            
            pup_an("sock" + string(i), undefined, undefined, undefined, undefined, function()
            {
                with (other)
                {
                    slick = 10;
                    wob = x;
                }
            }, ["imageFlip", i1]);
        }
        
        pup("stars", 320, -108, -9999, sPlay2, 0);
        pup_an("stars", 2, undefined, 0);
    }, function()
    {
        pup_an("sock1", 3, 170);
        pup_an("sock2", 2, 70);
        pup_an("sock3", 3, 470);
        pup_an("sock4", 2, 570);
        pup("sock", 320, 400, -1300, sSockFolk, 2, ["wobY"]);
        pup_an("sock", 3, 320, 220, undefined, undefined, ["ex"]);
    }, function()
    {
        pup_an("sock", undefined, undefined, undefined, undefined, function()
        {
            other.image_xscale = -2;
        });
    }, function()
    {
        pup_an("sock", undefined, undefined, undefined, undefined, function()
        {
            other.image_xscale = 2;
        });
    }, function()
    {
        op.twait = 150;
        pup("fountain", 320, 690, -1150, sPlay1, 3);
        pup_an("fountain", 6, 320, 100, undefined, function()
        {
            with (other)
            {
                ty = 0;
                
                run = function()
                {
                    if (ty == 20)
                    {
                        ow_music_stop();
                        snd(snd_impact);
                        snd(snd_deathnoise);
                        pup_an("sock", undefined, undefined, undefined, undefined, function()
                        {
                            with (other)
                            {
                                image_index = 3;
                                res_i();
                                i1 = [-3, -15, 30];
                                
                                run = function()
                                {
                                    x += i1[0];
                                    y += i1[1];
                                    image_angle += i1[2];
                                    i1[1]++;
                                };
                            }
                        }, ["gui"], ["ex"]);
                        pup_an("house", undefined, undefined, undefined, undefined, function()
                        {
                            with (other)
                            {
                                res_i();
                                i1 = [6, -5, -10];
                                
                                run = function()
                                {
                                    x += i1[0];
                                    y += i1[1];
                                    image_angle += i1[2];
                                    i1[1]++;
                                };
                            }
                        }, ["ex", "gray"]);
                        pup_an("tree2", 1, undefined, 480);
                        pup_an("tree1", 3, 94, undefined, undefined, undefined, ["glide"]);
                        pup_an("tree3", 3, 546, undefined, undefined, undefined, ["glide"]);
                        pup_an("sock2", 5, -100);
                        pup_an("sock4", 5, 740);
                        pup_an("sock1", undefined, 130, 228, undefined, function()
                        {
                            other.image_index = 1;
                        }, ["scared"], ["imageFlip"]);
                        pup_an("sock3", undefined, 510, 228, undefined, function()
                        {
                            other.image_index = 1;
                        }, ["scared"], ["imageFlip"]);
                        pup_an("stars", 2, undefined, -27);
                    }
                    
                    if (ty == 75)
                    {
                        oPuppetShadow.lightMode = 2;
                        oPuppetShadow.lightTime = 0;
                    }
                    
                    if (ty == 90)
                    {
                        pup("pedestal", 320, 0, -1400, sPlay1, 2);
                        pup_an("pedestal", 0, undefined, 240, undefined, undefined, ["ex2"]);
                        pup("egg", 320, -70, -1500, sPupEgg, 0);
                        pup_an("egg", 0, undefined, 170, undefined, undefined, ["ex2"]);
                        pup_exists("egg").sound = snd_noise;
                    }
                    
                    if (ty == 112)
                    {
                        ow_music(mus_puppetshow_2);
                        audio_sound_gain(mus_puppetshow_2, 1, 1);
                    }
                };
            }
        }, ["ex2"]);
    }, -1, function()
    {
        oPuppetShadow.lightMode = 3;
        pup_an("egg", undefined, undefined, undefined, undefined, undefined, ["imageFlip", "speed2"]);
    }, function()
    {
        pup_an("egg", undefined, undefined, undefined, undefined, function()
        {
            other.image_index = 0;
        }, undefined, ["imageFlip", "speed2"]);
        pup("build1", 160, 470, -1100, sPlay1, 6, ["gray"]);
        pup_an("build1", 0, undefined, 180, undefined, undefined, ["ex2"]);
        pup("build3", 480, 470, -1100, sPlay1, 6, ["gray"]);
        pup_an("build3", 0, undefined, 180, undefined, undefined, ["ex2"]);
        pup_exists("build1").sound = snd_impact;
        pup_an("tree1", 1, -200, undefined, undefined, undefined, undefined, ["glide"]);
        pup_an("tree3", 1, 840, undefined, undefined, undefined, undefined, ["glide"]);
        pup_an("stars", 3, undefined, -200);
    }, function()
    {
        pup("build2", 40, 470, -1100, sPlay1, 6, ["gray"]);
        pup_an("build2", 0, undefined, 180, undefined, undefined, ["ex2"]);
        pup("build4", 600, 470, -1100, sPlay1, 6, ["gray"]);
        pup_an("build4", 0, undefined, 180, undefined, undefined, ["ex2"]);
        pup_exists("build2").sound = snd_impact;
        pup_an("fountain", undefined, undefined, undefined, undefined, undefined, ["gray"]);
        pup("smoke", 0, -72, -1100, sPlaySmoke, 0, ["gray"]);
        pup_an("smoke", 2, undefined, -6);
    }, function()
    {
        pup_an("sock1", 3, undefined, 480);
        pup_an("sock3", 3, undefined, 480);
        pup_an("egg", undefined, undefined, undefined, undefined, function()
        {
            other.image_xscale = -2;
        });
    }, function()
    {
        pup_an("egg", undefined, undefined, undefined, undefined, undefined, ["imageFlip", "speed2"]);
        pup("spawner", 0, -9999, 0, sPlaySmoke, 0);
        pup_an("spawner", undefined, undefined, undefined, undefined, function()
        {
            with (other)
            {
                run = function()
                {
                    if (!((ty - 1) % 40))
                    {
                        pup("sol" + string(ty), -50, 180, -2000, sPlay1, 7, ["wobY"]);
                        pup_an("sol" + string(ty), 3, 840, undefined, undefined, function()
                        {
                            with (other)
                            {
                                run = function()
                                {
                                    if (x > 690)
                                        instance_destroy();
                                };
                            }
                        });
                        pup("sol" + string(ty + 1), -110, 190, -1900, sPlay1, 7, ["wobY", "gray"]);
                        pup_an("sol" + string(ty + 1), 3, 840, undefined, undefined, function()
                        {
                            with (other)
                            {
                                wob = 36;
                                
                                run = function()
                                {
                                    if (x > 690)
                                        instance_destroy();
                                };
                            }
                        });
                    }
                };
            }
        });
    }, -1, function()
    {
        op.twait = 100;
        oShop.time = 0;
        
        oShop.run = function()
        {
            if (time == 1)
                audio_sound_gain(op.musicOW, 0, 1000);
            
            if (time == 30)
            {
                snd(snd_slidewhistle);
                pup("SW", 740, 220, -1000, sScokSW, 1);
                pup_an("pedestal", 3, undefined, 640);
                pup_des("spawner");
                pup_des("sock2");
                pup_an("egg", 3, 840, 186, undefined, function()
                {
                    with (other)
                    {
                        slick = 10;
                        wob = x;
                    }
                }, ["wobY"], ["ex2"]);
                pup_an("fountain", 3, 840, undefined, undefined, function()
                {
                    with (other)
                    {
                        slick = 10;
                        wob = x * 2;
                    }
                }, ["wobY"], ["ex2"]);
                res_i();
                
                repeat (4)
                {
                    i++;
                    pup_an("build" + string(i), 3, 840, undefined, undefined, function()
                    {
                        with (other)
                        {
                            slick = 10;
                            wob = x;
                        }
                    }, ["wobY"], ["ex2"]);
                }
            }
            
            if (time > 30)
            {
                with (oPuppet)
                {
                    if (numb != "SW" && numb != "smoke")
                        x += ((oShop.time - 30) * 0.5);
                }
            }
            
            if (time == 100)
            {
                ow_music(mus_puppetshow_3);
                
                with (oPuppet)
                {
                    if (numb != "SW" && numb != "smoke")
                        des();
                }
                
                pup_an("SW", 8, 320, undefined, undefined, function()
                {
                    other.image_xscale = -2;
                }, ["wobY"]);
            }
            
            if (time == 160)
            {
                pup_an("SW", undefined, undefined, undefined, undefined, function()
                {
                    other.image_index = 0;
                }, undefined, ["wobY"]);
                oShop.time = 0;
                
                oShop.run = function()
                {
                    if (!(oShop.time % 20))
                    {
                        pup_an("SW", undefined, undefined, undefined, undefined, function()
                        {
                            other.image_xscale *= -1;
                        });
                    }
                };
            }
        };
    }, function()
    {
        oShop.time = 0;
        oShop.run = -1;
        pup_an("SW", 1, 350, undefined, undefined, function()
        {
            other.image_xscale = 2;
        });
    }, function()
    {
        oPuppetShadow.lightMode = 4;
        pup_an("SW", undefined, undefined, undefined, undefined, function()
        {
            other.image_index = 2;
        });
    }, function()
    {
        oPuppetShadow.lightMode = 5;
        pup_an("SW", undefined, undefined, undefined, undefined, function()
        {
            other.image_index = 3;
        }, ["scared"]);
    }, function()
    {
        op.twait = 30;
    }, function()
    {
        oPuppetShadow.lightMode = 6;
        pup("strange", -160, 190, -1000, sPlay1, 8);
        pup_an("SW", 2, 480, undefined, undefined, undefined, undefined, ["wobY"]);
        pup_an("strange", 4, 160);
    }, function()
    {
        pup_an("SW", undefined, undefined, undefined, undefined, function()
        {
            other.image_index = 0;
        }, undefined, ["scared"]);
    }, function()
    {
        pup_an("SW", undefined, undefined, undefined, undefined, function()
        {
            other.image_xscale *= -1;
        });
    }, function()
    {
        pup_an("strange", undefined, undefined, undefined, undefined, function()
        {
            other.image_index = 9;
        });
    }, function()
    {
        oPuppetShadow.lightMode = 7;
        pup_an("strange", 0.25, 180);
        pup_an("SW", 2, 320, undefined, undefined, undefined, ["wobY"]);
    }, function()
    {
        snd(snd_noise);
        ow_music_stop();
        op.twait = 90;
        oShop.black = 1;
        oShop.pupSheck = -1;
    }, function()
    {
        snd(mus_puppetshow_4);
        oPuppetShadow.lightMode = 8;
        pup_des("strange");
        pup("city", 0, 50, 0, sCityscape, 0);
        pup_an("smoke", undefined, undefined, undefined, undefined, function()
        {
            other.y -= 10;
        }, undefined, ["gray"]);
        pup_an("SW", undefined, undefined, undefined, undefined, function()
        {
            other.image_index = 4;
            other.x = 320;
            other.y = 215;
        });
        oShop.time = 0;
        
        oShop.run = function()
        {
            if (oShop.black > 0 && oShop.time > 0)
                oShop.black -= 0.05;
            
            if (time == 60)
            {
                pup_an("SW", 1, pup_exists("SW").x, pup_exists("SW").y, undefined, function()
                {
                    other.image_index = 5;
                    other.y = 220;
                }, ["ex2"], ["wobY"]);
            }
            
            if (time == 75)
            {
                pup_an("SW", undefined, undefined, undefined, undefined, function()
                {
                    other.image_xscale *= -1;
                });
            }
            
            if (pup_exists("city").x == -292 && oShop.pupSheck == -1)
            {
                oShop.pupSheck = 0;
                pup_an("SW", 2, undefined, 218, undefined, function()
                {
                    other.eAngle = 0;
                    other.image_angle = 0;
                }, undefined, ["forceWobY"]);
            }
        };
    }, function()
    {
        pup_an("SW", undefined, undefined, undefined, undefined, undefined, ["forceWobY"], ["ex2"]);
        pup_an("city", 2, -292);
    }, -1, function()
    {
        pup_an("SW", 2, undefined, 218, undefined, function()
        {
            other.image_index = 6;
        });
    }, function()
    {
        pup_an("SW", 2, undefined, 218, undefined, function()
        {
            other.image_index = 3;
            other.image_xscale *= -1;
        }, ["scared"]);
    }, function()
    {
        pup_an("SW", 2, undefined, 218, undefined, function()
        {
            other.image_index = 6;
            other.image_xscale *= -1;
        }, undefined, ["scared"]);
    }, -1, -1, -1], function()
    {
        oPuppetShadow.lightMode = 9;
        oShop.time = 0;
        
        oShop.run = function()
        {
            if (oShop.time == 60)
            {
                snd(snd_mercyadd);
                
                repeat (5)
                    spawnEEF(508 + irandom_range(-10, 4), 68 + irandom_range(-10, 4), sEEF_star1, irandom_range(0, 2), "healStar,draw,randomScale");
            }
            
            if (oShop.time == 90)
            {
                oPuppetShadow.lightMode = 10;
                oShop.curtain(380);
            }
            
            if (oShop.time == 150)
            {
                oPuppetShadow.targetAlpha = 0;
                array_push(op.progress, "puppet1done");
            }
            
            if (oShop.time >= 150)
            {
                if (oShop.shopAlpha > 0)
                    oShop.shopAlpha -= 0.05;
            }
            
            if (oShop.time == 240)
                room_goto(rSockHouse);
        };
    });
}

if (run != -1)
    run();
