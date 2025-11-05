fade = approach(fade, !fadeOut, 0.1);

if (fadeOut && fade == 0)
    instance_destroy();

if (fadeOut || instance_exists(obj_soundtest) || instance_exists(obj_conceptart) || instance_exists(obj_devvideos))
    exit;

var _dir = input_check_opposing_pressed("left", "right");
var _prevselected = selected;
selected += _dir;
selected = wrap(selected, 0, 2);

if (selected != _prevselected)
{
    changeflash = 1;
    event_play_oneshot("event:/sfx/pausemenu/move");
}

if (input_check_pressed("attack"))
{
    input_verb_consume(["jump", "attack", "inv"]);
    fadeOut = true;
}

if (input_check_pressed("jump"))
{
    fade = 1;
    
    switch (selected)
    {
        case 0:
            instance_create_depth(0, 0, depth - 100, obj_soundtest);
            break;
        
        case 1:
            instance_create_depth(0, 0, depth - 100, obj_conceptart);
            break;
        
        case 2:
            instance_create_depth(0, 0, depth - 100, obj_devvideos);
            break;
    }
}
