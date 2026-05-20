step = function()
{
    if (oPlayer.dodgeAlpha > 0)
    {
        if (!(op.ty % 20))
        {
            spawn_da(100, 440, undefined, undefined, undefined, [2, 0]);
            spawn_da(120, 440, undefined, undefined, undefined, [2, 1]);
        }
    }
};
