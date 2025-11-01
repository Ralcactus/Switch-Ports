for (var i = 0; i < array_length(pfp); i++)
{
    for (var j = 0; j < array_length(pfp[i]); j++)
    {
        if (sprite_exists(pfp[i][j]))
            sprite_delete(pfp[i][j]);
    }
}
