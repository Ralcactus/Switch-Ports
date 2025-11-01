amount = 1.25;
vspd = -5;
fadeOut = false;
ignoreFreeze = false;
sparkle_alpha = 1.2;
timer[0] = 95;

timer_func[0] = function()
{
    fadeOut = true;
};

timer[1] = 2;

timer_func[1] = function()
{
    var _x = x + irandom_range(-60, 60);
    var _y = y + irandom_range(-22, 22);
    var _part;
    
    if (drawfont == obj_persistent.font_coins)
        _part = global.particles.sparkleTinyYellow;
    else
        _part = global.particles.sparkleGreen;
    
    part_particles_create(global.part_over, _x, _y, _part, 1);
    timer[1] = irandom_range(4, 10);
};

set = false;
shakeXoff = 0;
shakeYoff = 0;
scalew = 1;
scaleh = 1;
