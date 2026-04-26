playhpindex += 0.35;

if (playhpindex > sprite_get_number(playhpspr))
    playhpindex = frac(playhpindex);

bosshpindex += 0.35;

if (bosshpindex > sprite_get_number(bosshpspr))
    bosshpindex = frac(bosshpindex);

switch (state)
{
    case UnknownEnum.Value_23:
        scr_bosscontroller_intro();
        break;
    
    case UnknownEnum.Value_1:
        scr_bosscontroller_normal();
        break;
    
    case UnknownEnum.Value_56:
        break;
}
