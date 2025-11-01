testvariablenothing = false;

if (done && !left_room)
{
    event_success();
    instance_destroy();
    left_room = true;
}

if (failed && !deac)
{
    if (input_check_pressed("menu_confirm"))
    {
        input_verb_consume("menu_confirm");
        event_fail();
        deac = true;
        instance_destroy();
    }
}
