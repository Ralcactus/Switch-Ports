playhpindex += 0.35;

if (playhpindex > sprite_get_number(playhpspr))
    playhpindex = frac(playhpindex);

bosshpindex += 0.35;

if (bosshpindex > sprite_get_number(bosshpspr))
    bosshpindex = frac(bosshpindex);

switch (state)
{
    case baddiestate.intro:
        scr_bosscontroller_intro();
        break;
    
    case states.normal:
        scr_bosscontroller_normal();
        break;
    
    case states.victory:
        break;
}
