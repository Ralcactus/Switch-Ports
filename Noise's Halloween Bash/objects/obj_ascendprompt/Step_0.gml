if (game_paused())
    exit;

if (fadein)
{
    if (input_check_pressed("jump"))
    {
        input_verb_consume(["jump", "attack", "down"]);
        fadein = false;
        obj_endplatplayer.dothing = true;
        obj_endplatplayer.alarm[0] = 60;
        obj_drawcontroller.camForward = 0;
        obj_drawcontroller.camUp = 0;
        event_stop(global.music.event, false);
    }
    
    if (input_check_pressed("attack"))
    {
        input_verb_consume(["jump", "attack", "down"]);
        fadein = false;
        obj_player.state = states.normal;
        instance_destroy(obj_ascendingplayer);
    }
}

alpha = approach(alpha, fadein, 0.05);

if (!fadein && alpha <= 0)
    instance_destroy();
