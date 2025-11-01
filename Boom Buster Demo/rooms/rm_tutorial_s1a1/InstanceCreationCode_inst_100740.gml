type = type_ground;

event_trigger = function()
{
    with (obj_controls)
    {
        if (ID == 2)
            event_user(0);
        else
            out = true;
    }
};
