time++;
unanimousY = 314;

if (spawnParty)
{
    spawnParty = false;
    pup("bc1", -50, (180 + unanimousY) - 456, -500, sPlayBC2, 0, ["lockShadow"]);
    pup_an("bc1", 1.5, -700);
    pup("k_armL", -9999, -9999, -950, sPupKrisAppendages, 0, ["k_armL"]);
    pup("k_armR", -9999, -9999, -950, sPupKrisAppendages, 1, ["k_armR"]);
    pup("k", 470, unanimousY, -1000, sPupKris, 0, ["forceWobY"]);
    pup_exists("k").wob = 119;
    pup("r", 370, unanimousY, -900, sPupRal, 0, ["forceWobY"]);
    pup_exists("r").wob = 51;
    pup("s", 270, unanimousY, -1000, sPupSus, 0, ["forceWobY"]);
    pup_exists("s").wob = 85;
    pup("sock", 170, unanimousY, -1000, sScokSW, 5, ["forceWobY"]);
    pup_exists("sock").wob = 17;
}

if (time == 125)
{
    pup_an("sock", 4, 130, undefined, undefined, undefined, ["shake"]);
    pup_exists("sock").image_index = 7;
}

if (time == 175)
{
    pup_an("sock", 10, 270);
    pup_exists("sock").image_index = 3;
    pup("guard", 740, unanimousY, -1100, sGuard, 0, ["wobY"]);
    pup_an("guard", 16, 140);
}

if (time == 235 || time == 249 || time == 263 || time == 277)
{
    with (pup_exists("guard"))
    {
        image_xscale = -image_xscale;
        image_index = 1;
    }
}

if (time == 291)
    pup_an("guard", 15, -100);

if (time == 325)
{
    pup_an("sock", 6, 170, undefined, undefined, undefined, undefined, ["shake"]);
    pup_exists("sock").image_index = 5;
    
    with (pup_exists("s"))
    {
        slick = 20;
        eAngle = 11.25;
    }
}

if (time == 326)
    pup_exists("s").eAngle = 22.5;

if (time == 345)
{
    pup("egg", 596, 222, -400, sMinis, 0);
    pup_an("egg", 4, 190, undefined, undefined, undefined, ["destroyWalk"]);
}

if (time == 410)
{
    pup_an("k", 0, 800, undefined, undefined, undefined, ["ex", "wobY"], ["forceWobY"]);
    pup_an("r", 0, 800, undefined, undefined, undefined, ["ex", "wobY"], ["forceWobY"]);
    pup_an("s", 0, 800, undefined, undefined, undefined, ["ex", "wobY"], ["forceWobY"]);
    pup_an("sock", 0, 800, undefined, undefined, undefined, ["ex", "wobY"], ["forceWobY"]);
}

if (time == 455)
{
    pup("egg", 0, unanimousY, -1000, sPupEgg2, 0, ["wobY"]);
    pup_an("egg", 10, 450, undefined, undefined, undefined, ["nextImage"]);
    pup("s_k", 460, 224, -400, sMinis, 1);
    pup_an("s_k", 4, 220, 224, undefined, undefined, ["destroyWalk"]);
    pup("s_r", 510, 232, -400, sMinis, 2);
    pup_an("s_r", 4, 220, 224, undefined, undefined, ["destroyWalk"]);
    pup("s_s", 560, 242, -400, sMinis, 3);
    pup_an("s_s", 4, 220, 224, undefined, undefined, ["destroyWalk"]);
    pup("s_sock", 610, 242, -400, sMinis, 4);
    pup_an("s_sock", 4, 220, 224, undefined, undefined, ["destroyWalk"]);
    pup_an("k", 999, -50, undefined, undefined, undefined, undefined, ["ex"]);
    pup_an("r", 999, -150, undefined, undefined, undefined, undefined, ["ex"]);
    pup_an("s", 999, -250, undefined, undefined, undefined, undefined, ["ex"]);
    pup_an("sock", 999, -50, undefined, undefined, undefined, ["ex"]);
}

if (time == 530)
{
    pup_an("egg", 16, 740, undefined, undefined, function()
    {
        other.image_index = 0;
    }, ["destroyWalk"], ["nextImage"]);
}

if (time == 565)
{
    pup_an("k", 10, 420);
    pup_an("r", 10, 320);
    pup_an("s", 10, 220);
    pup_an("bc1", 0, undefined, 1000, undefined, undefined, ["ex2"]);
}

if (time == 625 || time == 635 || time == 645 || time == 660)
{
    pup_exists("k").image_xscale = -pup_exists("k").image_xscale;
    pup_exists("r").image_xscale = -pup_exists("r").image_xscale;
    pup_exists("s").image_xscale = -pup_exists("s").image_xscale;
}

if (time == 665)
{
    pup("rush", 470, 480, -900, sPupRush, 0, ["ex2", "forceWobY2"]);
    pup_an("rush", 0, undefined, unanimousY - 20);
    pup_an("sock", undefined, undefined, undefined, undefined, undefined, ["scared"]);
}

if (time >= 665 && time < 920)
{
    with (pup_exists("sock"))
    {
        x = pup_exists("rush").x + 46;
        y = pup_exists("rush").y + pup_exists("rush").eY + 12;
        image_index = 7;
        
        if (oPuppetShow2.time < 785)
            image_angle = -60;
    }
}

if (time == 675)
{
    pup_an("k", 14, pup_exists("k").x - 100);
    pup_an("r", 14, pup_exists("r").x - 100);
    pup_an("s", 14, pup_exists("s").x - 100);
}

if (time == 735)
{
    screenShake(60, 5);
    pup_an("k", 2, pup_exists("k").x - 50, undefined, undefined, undefined, undefined, ["wobY"]);
    pup_an("r", 2, pup_exists("r").x - 50, undefined, undefined, undefined, undefined, ["wobY"]);
    pup_an("s", 2, pup_exists("s").x - 50, undefined, undefined, undefined, undefined, ["wobY"]);
    pup_an("rush", undefined, undefined, undefined, undefined, undefined, ["zero"], ["forceWobY2"]);
    pup_exists("rush").eAngle = 0;
}

if (time == 775)
{
    pup_exists("rush").image_xscale = -2;
    
    with (oPuppet)
    {
        if (!(numb == "k" || numb == "r" || numb == "s" || numb == "sock" || numb == "rush" || numb == "k_armL" || numb == "k_armR"))
            des();
    }
    
    with (instance_create_depth(1140, unanimousY + 20, 0, oTornado))
        targetX = 320;
}

if (time == 785)
{
    pup_an("k", undefined, undefined, undefined, undefined, undefined, ["armStuck"]);
    pup_an("sock", undefined, undefined, undefined, undefined, undefined, undefined, ["scared", "wobY"]);
    oTornado.grab = true;
}

if (time == 930)
{
    instance_destroy(oPuppet);
    instance_destroy(oTornado);
    pup("k", 90, -200, -1000, sPupKris, 0, ["ex2"]);
    pup("r", 220, -200, -900, sPupRal, 0, ["ex2"]);
    pup("s", 550, -200, -1000, sPupSus, 0, ["ex2"]);
    pup("so", 376, -200, -1000, sScokSW, 5, ["ex2"]);
    oPuppet.image_angle = 180;
    pup_an("k", 0, undefined, unanimousY - 30, undefined, function()
    {
        other.sound = snd_impact;
    });
}

if (time == 940)
{
    pup_an("r", 0, undefined, unanimousY - 30, undefined, function()
    {
        other.sound = snd_impact;
    });
}

if (time == 950)
{
    pup_an("s", 0, undefined, unanimousY - 30, undefined, function()
    {
        other.sound = snd_impact;
    });
}

if (time == 980)
{
    pup_an("so", 0, undefined, unanimousY, undefined, function()
    {
        other.image_angle = 0;
        other.sound = snd_noise;
        other.sound2 = mus_play_transition2;
    });
}

if (time == 1050)
{
    pup("bc1", -294, 340, -100, sCityscape, 0);
    pup_an("bc1", 3, undefined, ((180 + unanimousY) - 456) + 104, undefined, function()
    {
        other.sound = snd_impact;
    });
    pup_an("k", 0.25, undefined, pup_exists("k").y + 16, undefined, undefined, undefined, ["ex2"]);
    pup_an("r", 0.25, undefined, pup_exists("r").y + 16, undefined, undefined, undefined, ["ex2"]);
    pup_an("s", 0.25, undefined, pup_exists("s").y + 16, undefined, undefined, undefined, ["ex2"]);
    pup_an("so", 0.25, undefined, pup_exists("so").y + 16, undefined, function()
    {
        other.image_index = 6;
    }, undefined, ["ex2"]);
}

if (time == 670)
{
}
