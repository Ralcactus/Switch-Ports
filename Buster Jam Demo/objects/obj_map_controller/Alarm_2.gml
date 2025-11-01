var _sprite = sprite_create_from_surface(application_surface, 0, 0, _maxW, _maxH, false, false, 0, 0);
sprite_save(_sprite, 0, string("screenshot{0}.png", step));
sprite_delete(_sprite);
step++;

if (step < array_length(steps))
    alarm[1] = 4;
