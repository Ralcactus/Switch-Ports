ini_open("saveData.ini");
levelrank = ini_read_string("Ranks", string(levelsign), "none");
ini_close_os();
event_perform(ev_step, ev_step_normal);
