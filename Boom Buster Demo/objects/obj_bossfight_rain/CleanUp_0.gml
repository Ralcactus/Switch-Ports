if (created_rain)
{
    part_system_automatic_update(rain_system, true);
    part_type_destroy(part_rain);
    part_emitter_destroy(rain_system, emitter);
}
