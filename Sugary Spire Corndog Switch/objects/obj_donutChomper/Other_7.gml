if (sprite_index == spr_donutShitterEating)
{
    if (!givenPoints)
    {
        event_play_multiple("event:/SFX/general/collect", x, y);
        global.Collect += 50;
        create_small_number(x, y, "50");
        givenPoints = true;
    }
    
    sprite_index = spr_donutShitterShitting;
}

if (sprite_index == spr_donutShitterShitting)
{
    vspeed = -4;
    sprite_index = spr_donutShitter;
}
