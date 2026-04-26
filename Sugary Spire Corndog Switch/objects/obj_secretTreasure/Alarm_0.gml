global.collectsound = 0;
scr_queue_tvanim(obj_tv.happytvspr, 200);
global.Collect += 3000;
global.PizzaMeter += 5;
create_small_number(x, y, "3000");
global.ComboFreeze = 30;
global.ComboTime = 60;
global.Treasure = true;

with (playerID)
    scr_taunt_setVariables();

instance_destroy();
