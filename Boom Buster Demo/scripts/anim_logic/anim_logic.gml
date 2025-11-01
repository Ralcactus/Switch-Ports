function anim_logic()
{
    anim_index += (anim_speed * (sprite_get_speed(anim_sprite) / 60));
    
    if (anim_index >= sprite_get_number(anim_sprite))
    {
        anim_index -= anim_index;
        event_animend();
    }
    
    if (anim_index < 0)
    {
        anim_index -= anim_index;
        event_animend();
    }
}
