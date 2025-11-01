part_system_automatic_update(rain_system, !exit_freeze());

if (exit_freeze())
    exit;

if (obj_controller.bridget_timer >= 5220 && !created_rain)
{
    emitter = part_emitter_create(rain_system);
    part_emitter_region(rain_system, emitter, -750, 1750, -465, -465, 3, 0);
    part_emitter_stream(rain_system, emitter, part_rain, 1);
    part_system_position(rain_system, room_width / 2, room_height / 2);
    created_rain = true;
}
