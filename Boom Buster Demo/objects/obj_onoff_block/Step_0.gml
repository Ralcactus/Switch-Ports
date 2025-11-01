event_inherited();
pal_ind = 1 + global.onoff;

if (global.onoff == 0)
    screen_spr = spr_on;
else if (global.onoff == 1)
    screen_spr = spr_off;
else if (global.onoff == 2)
    screen_spr = spr_cat;
