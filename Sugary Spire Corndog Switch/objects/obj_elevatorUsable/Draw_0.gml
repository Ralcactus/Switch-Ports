if (sprite_index == spr_minesElevatorClosing)
{
    var player = obj_parent_player;
    draw_sprite(spr_minesElevatorBackpiece, 0, x, y);
    draw_sprite(player.sprite_index, player.image_index, player.x, player.y);
}

draw_self();
