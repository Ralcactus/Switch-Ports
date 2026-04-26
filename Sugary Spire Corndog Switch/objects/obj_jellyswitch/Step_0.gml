if (place_meeting(x, y + 1, obj_parent_player) && obj_parent_player.sprite_index == spr_bodyslamfall)
{
    instance_destroy();
    global.SwitchActivated = true;
}
