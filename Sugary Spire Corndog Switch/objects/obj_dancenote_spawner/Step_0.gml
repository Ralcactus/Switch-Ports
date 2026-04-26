if (active)
{
    time--;
    
    if (time <= -1)
    {
        with (obj_dancenote)
            active = false;
        
        instance_destroy();
    }
}
