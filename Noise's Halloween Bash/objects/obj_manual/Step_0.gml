var _prevpage = page;
page += input_check_opposing_pressed("left", "right");
page = clamp(page, 0, maxpage);

if (_prevpage != page)
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/manualpageflip", x, y);

if (input_check_pressed("attack") || input_check_pressed("pause"))
    instance_destroy();
