x = xstart;
y = ystart;
TrueY = ystart;
rising = false;
risingBuffer = risingBufferMax;
vsp = 0;

repeat (1 + floor(sprite_width / 128))
    instance_create(x + ((sprite_width / 2) * random_range(-1, 1)), y + irandom_range(5, -10), obj_poofeffect);
