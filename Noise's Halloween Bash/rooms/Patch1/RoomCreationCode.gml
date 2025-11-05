save_open();

if (bool(ini_read_real("ObtuseAndFranklyUnnecessary", "enterTheBoneZone", 0)))
    instance_destroy(par_switchsolid);

save_close();
