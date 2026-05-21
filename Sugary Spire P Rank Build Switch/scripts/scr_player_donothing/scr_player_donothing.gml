function state_player_donothing()
{
	// D3G: this should've been moved to use cutscene functions and the actor state but I'll allow it....
    cutscene = true;
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    pogomovespeed = 0;
    
	//normal
    if (substate == 0)
    {
        sprite_index = spr_idle;
        image_speed = 0.35;
        visible = false;
    }
}
