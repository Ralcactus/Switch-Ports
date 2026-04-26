function state_player_tumble()
{
    mask_index = spr_crouchmask;
    scr_conveyorBeltKinematics();
    hsp = xscale * movespeed;
    
    if (sprite_index == spr_tumblestart)
    {
        movespeed = approach(movespeed, 6 * xscale, 0.25);
        hsp = movespeed;
    }
    else
    {
        movespeed = 12;
    }
    
    if (sprite_index == spr_tumblestart && animation_end())
        sprite_index = spr_tumble;
    
    if (place_meeting_collision(x + xscale, y, UnknownEnum.Value_1) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog_tumble))
    {
        event_play_oneshot("event:/SFX/player/bumpwall", x, y);
        sprite_index = spr_tumbleend;
        state = UnknownEnum.Value_67;
        landAnim = false;
        sprite_index = spr_tumbleend;
        image_index = 0;
        hsp = xscale * -2;
        vsp = -3;
        jumpStop = true;
    }
    
    if (!key_jump2 && !jumpStop && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    if (inputBufferJump > 0 && can_jump && hsp != 0)
        vsp = -11;
    
    image_speed = 0.35;
    
    with (create_afterimage(UnknownEnum.Value_0, xscale))
    {
        gonealpha = 0.85;
        alarm[0] = 1;
        alarm[1] = 60;
    }
}
