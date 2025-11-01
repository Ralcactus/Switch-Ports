if (exit_freeze())
    exit;

if (ready)
{
    set_values();
    recording_frame++;
    
    if (recording_frame == array_length(recording_follow))
    {
        recording_frame = 0;
        x = record_xstart;
        y = record_ystart;
        image_xscale = record_facing;
    }
}

if (out)
{
    image_alpha = approach(image_alpha, 0, 0.025);
}
else
{
    if (image_alpha == 0.55)
        ready = true;
    
    image_alpha = approach(image_alpha, 0.55, 0.025);
}
