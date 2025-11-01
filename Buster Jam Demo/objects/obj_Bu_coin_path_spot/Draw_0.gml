draw_sprite(sprite_index, 0, x, y);
draw_sprite(sprite_index, image_index + 1, x, y);

if (coin_spot)
{
    shader_set(sha_flash);
    draw_sprite_ext(sprite_index, image_index + 1, x, y, 1, 1, 0, c_white, obj_Bu_coin_player.flash_alpha);
    shader_reset();
}
