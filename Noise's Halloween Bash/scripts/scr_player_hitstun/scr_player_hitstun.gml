function scr_player_hitstun()
{
    image_speed = 0;
    hsp = 0;
    vsp = 0;
    hitstuntime--;
    
    if (hitstuntime <= 0)
        player_restore_state();
}
