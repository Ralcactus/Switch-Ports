testvariablenothing = false;
texture_prefetch("tg_results");
scr_unload_ag_boss();
timer[0] = 210;

timer_func[0] = function()
{
    room_goto(rm_win_screen);
};
