percent_move = approach(percent_move, 1, 0.05);
percent_squish = approach(percent_squish, 1, 0.07142857142857142);

if (in)
{
    x = use_curve(acurv_linear, percent_move, "out", -1920, 0);
}
else
{
    x = use_curve(acurv_linear, percent_move, "in", 0, 1920);
    
    if (x >= 1920)
        instance_destroy();
}

xscale = use_curve(acurv_elastic_less, percent_squish, undefined, 1.12, 1);
yscale = use_curve(acurv_elastic_less, percent_squish, undefined, 0.88, 1);
