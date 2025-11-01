for (var i = 0; i < 4; i++)
{
    hp_scale[i] = use_curve(acurv_elastic_less, hp_percent[i], undefined, 0.8, 1);
    hp_percent[i] = approach(hp_percent[i], 1, 0.065);
}

if (global.beat)
{
    hp_percent[hp_beat] = 0;
    hp_percent[hp_beat] = 1;
    hp_beat++;
    
    if (hp_beat > 3)
        hp_beat = 0;
}
