if (state != 1)
{
    draw_sprite(spr_static_tech, staticdex, 0, 0);
}
else
{
    draw_sprite(spr_technicaldifficulty, 0, 0, 0);
    draw_player_sprite_ext(spr_technicaldifficulty_pizzy, chardex, 0, 0, 1, 1, 0, 16777215, 1);
}
