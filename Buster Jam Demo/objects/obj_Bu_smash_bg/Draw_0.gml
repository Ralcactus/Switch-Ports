for (var i = 0; i < 3; i++)
    draw_sprite(spr_Bu_smash_bg, bg_index, (x * 0.4) + (sprite_width * i), y);

for (var i = 0; i < 2; i++)
    draw_sprite(spr_Bu_smash_bg_clouds, 0, (x * 0.35) + (sprite_get_width(spr_Bu_smash_bg_clouds) * i), y);
