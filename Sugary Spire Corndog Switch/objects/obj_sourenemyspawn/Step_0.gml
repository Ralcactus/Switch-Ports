if (rising)
{
    if (sprite_index != spr_sourenemyform)
    {
        sprite_index = spr_sourenemyform;
        image_index = 0;
    }
    else if (animation_end())
    {
        instance_destroy();
    }
}
