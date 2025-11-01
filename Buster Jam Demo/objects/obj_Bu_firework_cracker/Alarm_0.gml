if (global.multiplayer)
    char = player;
else if (controller.fun != undefined)
    char = controller.fun;

if (editor)
{
    with (controller)
        event_set_time(999999);
}

event_user(char);
