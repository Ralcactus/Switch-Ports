ty++;

if (ty == 1 && wall)
{
    with (instance_create_depth(x, y, 9999, oWall))
    {
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
    }
}

if (draw != -1)
{
    if (!drawSelf)
    {
        image_alpha = 0;
        depth = -(y + ey);
    }
    
    draw();
}
else
{
    draw_self();
}

if (drawSelf)
    draw_self();
