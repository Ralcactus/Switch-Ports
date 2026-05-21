function draw_background_tiled(arg0, arg1, arg2)
{
	//i feel like a fucking valve programmer writer. my next line will certainly be "this is a stupid fix, but i don't have any ideas on how to do a cleaner fix."
    if (global.panic == 0)
        draw_sprite_tiled(arg0, 0, arg1, arg2);
    if (global.panic == 1) 
		{ }
}
