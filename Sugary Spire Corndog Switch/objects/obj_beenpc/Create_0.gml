sprfly = spr_beenpc1;
sprtaunt = spr_beenpctaunt1;
sprescape = spr_beenpcescape1;
flyspd = 4 + random_range(-1.5, 1.5);

if (chance(0.5))
{
    sprfly = spr_beenpc2;
    sprtaunt = spr_beenpctaunt2;
    sprescape = spr_beenpcescape2;
}

timer = 0 + irandom(10);
