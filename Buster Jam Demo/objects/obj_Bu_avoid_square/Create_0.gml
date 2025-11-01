hspd = 0;
vspd = 0;
timer[0] = 20;

timer_func[0] = function()
{
    var _order = choose(0, 1);
    var _spdmin = 5.5;
    var _spdmax = 7;
    
    if (_order == 0)
    {
        hspd = choose(_spdmin, -_spdmin);
        vspd = choose(_spdmax, -_spdmax);
    }
    else
    {
        hspd = choose(-_spdmax, _spdmax);
        vspd = choose(-_spdmin, _spdmin);
    }
};

for (var i = 0; i < 2; i++)
{
    move[0] = 0;
    move[1] = 0;
    move_sub[0] = 0;
    move_sub[1] = 0;
}

anim_init();
