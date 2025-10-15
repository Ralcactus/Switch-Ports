if (!active)
{
    active = 1
    sprite_index = spr_checkpoint_activating
    image_index = 0
    with (obj_player1)
    {
        roomstartx = other.x + 6
        roomstarty = other.y - 46
    }
    if visible
        scr_soundeffect(Checkpoint)
}
