draw_sprite_ext(sprite_index, oSoul.GrazeIndex, oSoul.x, oSoul.y, 1, 1, oSoul.ROT, c_white, oSoul.GrazeAlpha);

if (oSoul.GrazeAlpha > 0)
    oSoul.GrazeAlpha -= 0.1;

if ((round(oAlways.Tyme / 3) * 3) == oAlways.Tyme)
    oSoul.GrazeIndex += 1;
