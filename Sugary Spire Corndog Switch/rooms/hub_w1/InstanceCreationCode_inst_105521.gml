flags.do_once = false;
flags.do_save = false;

condition = function()
{
    return true;
};

output = function()
{
    with (105517)
    {
        if (instance_exists(inst_41B79147) && inst_41B79147.sprite_index == spr_onoffswitch_blue)
            text = "Oh.";
        
        if (!instance_exists(inst_41B79147))
            text = "That was the only gadget he left behind...";
    }
};
