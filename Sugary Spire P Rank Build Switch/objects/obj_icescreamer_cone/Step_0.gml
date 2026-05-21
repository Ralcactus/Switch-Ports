hsp = 5 * image_xscale;
vsp = 5 * image_yscale;

if (place_meeting_collision(x, y + image_yscale, Exclude.PLATFORMS))
{
    if (!oncev)
    {
        image_yscale *= -1;
        bounce--;
        oncev = true;
        
        if (bounce <= 0)
            instance_destroy();
    }
}
else
    oncev = false;

if (place_meeting_collision(x + image_xscale, y, Exclude.PLATFORMS))
{
    if (!onceh)
    {
        image_xscale *= -1;
        bounce--;
        onceh = true;
        
        if (bounce <= 0)
            instance_destroy();
    }
}
else
    onceh = false;

x += hsp;
y += vsp;
