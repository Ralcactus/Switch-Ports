function part_type_sprite_simple(arg0, arg1)
{
    part_type_sprite(arg0, arg1, true, true, false);
    var _life = 60 * (sprite_get_number(arg1) / sprite_get_speed(arg1));
    part_type_life(arg0, _life, _life);
}
