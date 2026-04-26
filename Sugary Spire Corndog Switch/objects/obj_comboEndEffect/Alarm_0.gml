var real_sub = max(subtractBy, 10);

if (comboScore > 0)
{
    comboScore -= real_sub;
    create_collect_effect(x + camera_get_view_x(view_camera[0]), y + camera_get_view_y(view_camera[0]), undefined, real_sub);
    
    if (comboScore <= 0)
    {
        comboScore = 0;
        alarm[1] = 50;
        alarm[0] = -1;
    }
    else
    {
        alarm[0] = 1;
    }
}
else
{
    alarm[1] = 50;
    alarm[0] = -1;
}
