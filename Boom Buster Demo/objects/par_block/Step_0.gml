if (exit_freeze())
    exit;

anim_logic();
scale = sin(scale_percent * pi) * 0.5;

if (hit)
{
    scale_percent = approach(scale_percent, 1, 0.068);
    
    if (scale_percent == 1)
    {
        scale_percent = 0;
        hit = false;
    }
}
