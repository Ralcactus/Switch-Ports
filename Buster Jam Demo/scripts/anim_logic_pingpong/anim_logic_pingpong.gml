function anim_logic_pingpong()
{
    anim_index += (global.delta_game_factor * (anim_speed * (sprite_get_speed(anim_sprite) / 60)) * anim_dir);
    
    if (anim_index >= sprite_get_number(anim_sprite) && anim_dir == 1)
    {
        anim_index = sprite_get_number(anim_sprite);
        anim_dir = -1;
    }
    
    if (anim_index <= 0 && anim_dir == -1)
    {
        anim_index = 0;
        anim_dir = 1;
    }
}
