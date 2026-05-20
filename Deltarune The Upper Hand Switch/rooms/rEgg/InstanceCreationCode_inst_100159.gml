draw = function()
{
    if (array_contains(op.save, "egg"))
        des();
};

func = function()
{
    do_text(undefined, undefined, g_t("egg_1"), ["ow"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
    {
        make_prompt(undefined, [function()
        {
            array_push(op.save, "egg");
            do_text(undefined, undefined, g_t("egg_2"), ["ow"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, function()
            {
                oPlayer.move = true;
            });
        }, function()
        {
            oPlayer.move = true;
        }]);
    });
};
