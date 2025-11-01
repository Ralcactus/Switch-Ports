if (exit_freeze())
    exit;

var _player = instance_place(x, y - 1, obj_player);

if (_player)
{
    with (_player)
        event_user(0);
}

image_index = approach(image_index, (swap * 2) + 1, 0.12);
