function scrDice(arg0, arg1, arg2)
{
    if (other.Dice == arg0)
    {
        with (instance_create_depth(324 - (string_length(arg1) * 8), 382, -9999, oTextEngine))
        {
            JustText = true;
            
            if (other.QQ == 1)
            {
                Text[0] = "                            ";
                Text[1] = "_cr" + arg1;
            }
            else
            {
                Text[0] = "_cr" + arg1;
            }
        }
        
        with (instance_create_depth(30, 382, -9999, oTextEngine))
        {
            JustText = true;
            
            if (other.QQ == 1)
            {
                Text[0] = "* Asriel rolled some dice...";
                Text[1] = "£" + arg2;
            }
            else
            {
                Text[0] = "£" + arg2;
            }
        }
    }
}

function DiceAllText()
{
    scrDice(2, "Snake Eyes Two", "* Asriel rolled two ones!£* Scampton's attack rose!");
    scrDice(3, "Power of Three", "* Asriel rolled a three!£* Everyone felt better!");
    scrDice(4, "Power of Four", "* Asriel rolled a four!£* Someone was hurt!");
    scrDice(5, "Power of Five", "* Asriel rolled a five!£* You hurt slowly!");
    
    if (oMakeUI.Dice6 > 1)
    {
        if (oMakeUI.Dice6 == 2)
            scrDice(6, "Power of Six", "* Asriel rolled a six!£* What have you done...");
        
        if (oMakeUI.Dice6 == 3)
            scrDice(6, "Power of Six", "* Asriel rolled a six!£* Stop...");
        
        if (oMakeUI.Dice6 > 3)
            scrDice(6, "Power of Six", "* Asriel rolled a six!£* Succumb to the Junkilpede...");
    }
    else
    {
        scrDice(6, "Power of Six", "* Asriel rolled a six!£* Nothing happened...");
    }
    
    scrDice(7, "Power of Seven", "* Asriel rolled a seven!£* Plus 2 percent!");
    scrDice(8, "Power of Eight", "* Asriel rolled an eight!£* Nothing happened...");
    scrDice(9, "Power of Nine", "* Asriel rolled a nine!£* You hurt rapidly!");
    scrDice(10, "Power of Ten", "* Asriel rolled a ten!£* Someone felt better!");
    scrDice(11, "Power of Eleven", "* Asriel rolled an eleven!£* The whole team was hurt!");
    scrDice(12, "BoxCar Twelve", "* Asriel rolled two sixes!£* Plus 5 percent!");
}

function beefText(arg0)
{
    oMakeUI.DiceText++;
    
    if (oMakeUI.DiceText >= 4)
        oMakeUI.DiceText = 1;
    
    with (instance_create_depth(420, 120, -9999, oTextEngine))
    {
        Seed = "TBub";
        Font = sFont_Sma;
        image_xscale = 1;
        image_yscale = 1;
        RGB = make_color_rgb(0, 0, 0);
        BC = false;
        Voice = snd_scampton_voice;
        Bubble_Arrow[0] = 3;
        Spez = "TheDiceText" + string(arg0);
        
        if (oMakeUI.DiceText == 1)
        {
            Text[0] = "It's somebody's@lucky day!";
            Bubble_Xscale[0] = 7.5;
            Bubble_Yscale[0] = 2;
        }
        
        if (oMakeUI.DiceText == 2)
        {
            Text[0] = "Lives on the line!";
            Bubble_Xscale[0] = 9;
            Bubble_Yscale[0] = 1;
        }
        
        if (oMakeUI.DiceText == 3)
        {
            Text[0] = "[GAMBLE] [GAMBLE]";
            Bubble_Xscale[0] = 8.5;
            Bubble_Yscale[0] = 1;
        }
    }
}
