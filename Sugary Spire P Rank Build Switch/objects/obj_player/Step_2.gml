if (flash == 1 && alarm[11] <= 0)
    alarm[11] = 5;

image_xscale = xscale;
hspCarry += slideHsp;

if (state != states.titlescreen && state != states.hooks && state != states.noclip && state != states.door && state != states.Sjump && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover && state != states.door)
    scr_collision();
