testvariablenothing = false;

timer_func[0] = function()
{
    shot++;
    
    if (shot == 2 || shot == 4)
        move_bars = 1;
    else
        move_bars = 0;
    
    if (shot > (array_length(text_shot) - 1))
    {
        instance_destroy();
        exit;
    }
    
    timer[0] = text_shot[shot][1];
};

text_shot[0] = ["Standing on top of subway", 180];
text_shot[1] = ["Snake Eyes", 60];
text_shot[2] = ["Snake Eyes Squint", 75];
text_shot[3] = ["Buster Eyes", 60];
text_shot[4] = ["Buster Eyes Squint", 75];
shot = 0;
timer[0] = text_shot[shot][1];
bars_in = 0;
move_bars = 0;
