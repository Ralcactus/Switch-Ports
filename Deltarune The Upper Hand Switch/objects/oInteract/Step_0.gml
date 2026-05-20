if (step != -1)
{
    if (!drawSelf)
    {
        image_alpha = 0;
        depth = -(y + ey) + changeDepth;
    }
    
    step();
}
