if (!active)
{
    sprite_index = spr_onoffblock_canny;
    active = true;
    time = time_max * 60;
    instance_create(0, 0, obj_dancenote_sndhandler);
    
    with (obj_dancenote)
    {
        if (trigger == other.trigger)
            active = true;
    }
}
