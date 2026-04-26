if (image_xscale > 0.5)
{
    with (other)
        DestroyedBy = other;
    
    instance_destroy(other);
}
