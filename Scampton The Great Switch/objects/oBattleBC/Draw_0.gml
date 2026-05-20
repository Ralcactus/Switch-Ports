if (room == rBattle_2)
{
    draw_sprite_ext(sBCM2, 1, 0, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sBCM4, round(oP.Tyme / 2), 0, -100, 2, 2, 0, c_white, 0.75);
    draw_sprite_ext(sBCM4, 40 + round(oP.Tyme / 2), 640, -100, -2, 2, 0, c_white, 0.75);
    draw_sprite_ext(sBCM2, 4, 0, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sBCM5, round(oP.Tyme / 6), 0, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sBCM4, round(oP.Tyme / 2), 0, -100, 2, 2, 0, c_white, 0.75);
    draw_sprite_ext(sBCM4, 40 + round(oP.Tyme / 2), 640, -100, -2, 2, 0, c_white, 0.75);
    draw_sprite_ext(sBCM1, round(oP.Tyme / 6), 0, 164, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sWhite, 2, 0, 0, 50, -50, 0, c_white, 1);
}
else
{
    draw_sprite_ext(sBCM2, 1, 0, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sBCM2, 3, 0, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sBCM5, round(oP.Tyme / 6), 0, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sBCM4, round(oP.Tyme / 2), 0, 0, 2, 2, 0, c_white, 0.75);
    draw_sprite_ext(sBCM4, 40 + round(oP.Tyme / 2), 640, 0, -2, 2, 0, c_white, 0.75);
    draw_sprite_ext(sBCM2, 2, 320, 0, -0.5, 2, 0, c_white, 1);
    draw_sprite_ext(sBCM2, 2, 320, 0, 0.5, 2, 0, c_white, 1);
}
