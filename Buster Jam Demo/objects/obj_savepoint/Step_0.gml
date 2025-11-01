testvariablenothing = false;
save_text_flash = approach(save_text_flash, 0, 0.1);

if (!saved)
{
    save_out = easy_smooth(save_out, 0, 5);
}
else
{
    save_out_hspd += 0.012;
    save_out += save_out_hspd;
}

if (saved && save_out >= 1)
{
    with (obj_map_player)
        deac = false;
    
    instance_destroy();
}

timer_logic(0);
timer_logic(1);
timer_logic(2);
