if (surface_exists(surf))
    surface_free(surf);

for (var i = 0; i < 3; i++)
{
    for (var ii = 0; ii < array_length(pfps_loaded[i]); ii++)
    {
        if (sprite_exists(pfps_loaded[i][ii]))
            sprite_delete(pfps_loaded[i][ii]);
    }
}
