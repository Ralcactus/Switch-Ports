if (oAlways.KeyLEFT)
    Step += 1;

if (oAlways.KeyRIGHT)
    Step -= 1;

draw_sprite_ext(sWhite, 0, 320 + Step, 0, 0.1, 100, 0, c_white, 1);
draw_sprite_ext(sWhite, 0, 320 - Step, 0, -0.1, 100, 0, c_white, 1);
