function battleManager(arg0, arg1, arg2)
{
    if (arg0 == "test_1")
    {
        if (op.superMode)
            oBUI.loop = true;
        
        var regular = true;
        oEnemie.drawL = 0;
        oAActor.boxes = 0;
        
        if (array_contains(oBUI.battleProgress, "breather"))
        {
            regular = false;
            oBUI.attack = "final";
        }
        
        if (array_contains(oBUI.battleProgress, "L3") && !array_contains(oBUI.battleProgress, "breather"))
        {
            regular = false;
            oBUI.attack = "breather";
            array_push(oBUI.battleProgress, "breather");
        }
        
        if ((oEnemie.inf_spareP >= 29 || oEnemie.inf_hp < 10500) && !array_contains(oBUI.battleProgress, "L1"))
        {
            regular = false;
            oBUI.attackSave = oBUI.attack;
            oBUI.attack = "lazer1";
            array_push(oBUI.battleProgress, "L1");
        }
        
        if ((oEnemie.inf_spareP >= 59 || oEnemie.inf_hp < 6500) && !array_contains(oBUI.battleProgress, "L2"))
        {
            regular = false;
            oBUI.attackSave = oBUI.attack;
            oBUI.attack = "lazer2";
            array_push(oBUI.battleProgress, "L2");
        }
        
        if (oEnemie.inf_spareP >= 89 && !array_contains(oBUI.battleProgress, "L3"))
            op.endingGet = "s";
        
        if (oEnemie.inf_hp < 2500 && !array_contains(oBUI.battleProgress, "L3"))
            op.endingGet = "f";
        
        if ((oEnemie.inf_spareP >= 89 || oEnemie.inf_hp < 2500) && !array_contains(oBUI.battleProgress, "L3"))
        {
            regular = false;
            oBUI.attackSave = oBUI.attack;
            oBUI.attack = "lazer3";
            array_push(oBUI.battleProgress, "L3");
        }
        
        if (regular)
        {
            oBUI.attackCounter++;
            
            if (oBUI.attackCounter > 8)
            {
                oBUI.attackCounter = 1;
                oBUI.loop = true;
            }
            
            oBUI.attack = oBUI.attackCounter;
        }
        
        if (op.attackSel != -1)
            oBUI.attack = op.attackSel;
        
        if (!op.superMode)
        {
            if (oBUI.attack == 0)
                setPattern("tutorial", -200, 0, -1, -1);
            
            if (oBUI.attack == 1)
            {
                if (!oBUI.loop)
                    setPattern("maneuver", -90, 35, -1, -1);
                else
                    setPattern("maneuver", -120, -20, -1, -1);
            }
            
            if (oBUI.attack == 2)
            {
                if (!oBUI.loop)
                    setPattern("handsSide", 0, 70, -1, -1);
                else
                    setPattern("handsSide", -50, -70, -1, -1);
            }
            
            if (oBUI.attack == 3)
            {
                oEnemie.drawL = 1;
                setPattern("handToss", -80, 70, -1, -1);
            }
            
            if (oBUI.attack == 4)
            {
                if (oBUI.loop && false)
                    oEnemie.drawL = 1;
                
                setPattern("fallingPlatforms", 0, 0, -1, -1);
            }
            
            if (oBUI.attack == 5)
                setPattern("linearMoving", -150, -50, -1, -1);
            
            if (oBUI.attack == 6)
            {
                oEnemie.drawL = 1;
                setPattern("handSmash", 0, 0, -1, -1);
            }
            
            if (oBUI.attack == 7)
                setPattern("boomerang", -100, 0, -1, -1);
            
            if (oBUI.attack == 8)
                setPattern("movingPlatforms", 0, 70, -1, -1);
        }
        else
        {
            if (oBUI.attack == 0)
                setPattern("tutorial", -200, 0, -1, -1);
            
            if (oBUI.attack == 1)
            {
                if (!oBUI.loop)
                    setPattern("maneuver", -90, 35, -1, -1);
                else
                    setPattern("maneuver", -120, -20, -1, -1);
            }
            
            if (oBUI.attack == 2)
            {
                if (!oBUI.loop)
                    setPattern("handsSide", 0, 70, -1, -1);
                else
                    setPattern("handsSide", -50, -70, -1, -1);
            }
            
            if (oBUI.attack == 3)
            {
                oEnemie.drawL = 1;
                setPattern("handToss", -80, 70, -1, -1);
            }
            
            if (oBUI.attack == 4)
            {
                oEnemie.drawL = 1;
                setPattern("fallingPlatforms2", 0, 0, -1, -1);
            }
            
            if (oBUI.attack == 5)
                setPattern("linearMoving", -150, -50, -1, -1);
            
            if (oBUI.attack == 6)
            {
                oEnemie.drawL = 1;
                setPattern("handSmash", 0, 0, -1, -1);
            }
            
            if (oBUI.attack == 7)
                setPattern("boomerang", -100, 0, -1, -1);
            
            if (oBUI.attack == 8)
                setPattern("movingPlatforms", 0, 70, -1, -1);
        }
        
        if (oBUI.attack == "lazer1")
        {
            setPattern("lazer1", -100, 0, -1, -1);
            oEnemie.drawL = 1;
        }
        
        if (oBUI.attack == "lazer2")
        {
            setPattern("lazer2", 100, 0, -1, -1);
            oEnemie.drawL = 1;
        }
        
        if (oBUI.attack == "lazer3")
        {
            setPattern("lazer3", -136, 0, -1, -1);
            oEnemie.drawL = 1;
        }
        
        if (oBUI.attack == "breather")
        {
            setPattern("breather", -210, 70, -1, -1);
            oEnemie.drawL = 1;
        }
        
        if (oBUI.attack == "final")
        {
            oBUI.fogFadeOn = false;
            setPattern("final", 0, 0, -1, -1);
        }
        
        if (oBUI.attack == "thinPlatforms")
            setPattern("thinPlatforms", 0, 50, -1, -1);
    }
    
    if (arg0 == "test_2")
    {
        i++;
        setPattern(1, 0, 0, 0, 0);
        
        with (instance_create_depth(0, 0, 0, oText))
        {
            textObj_start("bb");
            
            if (other.i == 1)
            {
                textObj("BB AAA", arg1, arg2, sFont2, 0, snd_txtMike);
                textObj1(1, 1);
                textObj("AAA BB", arg1, arg2, sFont2, 0, snd_txtMike);
                textObj1(1, 1);
            }
        }
    }
    
    if (arg0 == "test_3")
    {
        i++;
        setPattern(1, 0, 0, 0, 0);
        
        with (instance_create_depth(0, 0, 0, oText))
        {
            textObj_start("bb");
            
            if (other.i == 1)
            {
                textObj("AAA", arg1, arg2, sFont2, 0, snd_txtMike);
                textObj1(4, 1);
            }
        }
    }
}
