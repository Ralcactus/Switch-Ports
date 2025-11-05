if (input_check_pressed("jump"))
    game_end();

if (input_check_pressed("attack"))
{
    input_verb_consume(["jump", "attack", "down"]);
    instance_destroy();
}
