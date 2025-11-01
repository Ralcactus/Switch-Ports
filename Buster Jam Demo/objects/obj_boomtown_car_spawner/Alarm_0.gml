if (image_xscale == 1)
    dir = 2;
else
    dir = 3;

auto_move = true;
auto_time = 0;

for (var i = 0; i < 4; i++)
    timer_func[0]();

auto_move = false;
timer_func[0]();
