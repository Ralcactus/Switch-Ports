tickles = 0;
tickles_needed = 10;
anim_init();
timer[0] = -1;

timer_func[0] = function()
{
    anim_play(spr_Bu_ape_hands);
};

done = false;
