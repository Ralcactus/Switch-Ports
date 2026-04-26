if (!instance_exists(obj_pizzano_dance))
    instance_create(x, y, obj_pizzano_dance);

if (instance_exists(obj_pizzanotrap_botspawn))
    scr_controlprompt("Defeat all the bots!");

instance_destroy();
instance_destroy(obj_pizzano_spawner);
