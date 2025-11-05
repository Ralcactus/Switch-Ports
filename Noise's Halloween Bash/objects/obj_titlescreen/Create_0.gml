function Star(_active, _index, arg2) constructor
{
    active = _active;
    other.starexists |= active;
    index = _index;
    description = string_shift(array_get(string_get("special"), arg2), 4299);
}

update_stars = function()
{
    save_open();
    var _candy = ini_read_real("PumpkinPatch", "candyCollected", 0);
    var _pumpkins = ini_read_real("PumpkinPatch", "pumpkinTotal", 0);
    var _crates = ini_read_real("PumpkinPatch", "cratesDestroyed", 0);
    var _gems = ini_read_real("PumpkinPatch", "gemData", 0);
    var _rank = get_rank(_candy, _pumpkins, _crates, _gems);
    starexists = false;
    stars = 
	[
		new Star(_rank <= Rank.Good, 1, 0), 
		new Star(_rank == Rank.Perfect, 2, 1), 
		new Star(has_easteregg("lifeExpectancyVoided"), 3, 2)
	];
    save_close();
};

update_stars();
started = false;
selected = 0;
lookingatstars = false;
starselected = 0;
hoveredstar = -1;
palindicatoralpha = 0;
palindicatoryoff = 0;
housestretch = 0;
depth = 2000;
pumpkins = 
[
	[-44, 506, 89], 
	[194, 496, 217], 
	[155, 537, -103], 
	[389, 511, 286], 
	[-69, 565, -254], 
	[540, 567, -74], 
	[1031, 616, 1558], 
	[1281, 459, 1998], 
	[893, 555, 2254], 
	[1250, 695, 954]
];
selectedpal = 0;

update_pal = function()
{
    availablepal = [1, 2, 3, 4, 5];
    save_open();
    
    if (has_easteregg("freeTheMonkeys"))
        array_push(availablepal, 6);
    
    if (has_easteregg("joyIsEndless"))
        array_push(availablepal, 7);
    
    if (has_easteregg("wasThatTheBiteOf87"))
        array_push(availablepal, 8);
    
    if (has_easteregg("noWay"))
        array_push(availablepal, 9);
    
    if (has_easteregg("itsHim"))
        array_push(availablepal, 10);
    
    if (has_easteregg("educationAndLearning"))
        array_push(availablepal, 11);
    
    if (has_easteregg("gatherTheGemsNotTheCrystals"))
        array_push(availablepal, 12);
    
    save_close();
};

update_pal();

function start_func()
{
    started = true;
}

function options_func()
{
    instance_create_depth(x, y, -13000, obj_optionsmenu);
}

function manual_func()
{
    instance_create_depth(x, y, -13000, obj_manual);
}

function extras_func()
{
    instance_create_depth(x, y, -13000, obj_extrasselect);
}

update_menu = function()
{
    options = array_create(0);
    var _i = 0;
    var _pad = 48;
    options[_i++] = [string_get("menu/title/start"), start_func, 0];
    options[_i++] = [string_get("menu/title/options"), options_func, 0];
    options[_i++] = [string_get("menu/title/manual"), manual_func, 0];
    
    if (starexists)
        options[_i++] = [string_get("menu/title/extras"), extras_func, 0];
    
    optionswidth = 0;
    draw_set_font(global.font);
    
    for (_i = 0; _i < array_length(options); _i++)
    {
        options[_i][2] = string_width(options[_i][0]) + _pad;
        optionswidth += options[_i][2];
    }
};

update_menu();

// obligatory Konami Code
konamicode_keyboard = [vk_up, vk_up, vk_down, vk_down, vk_left, vk_right, vk_left, vk_right, ord("B"), ord("A")];
konamicode_controller = [gp_padu, gp_padu, gp_padd, gp_padd, gp_padl, gp_padr, gp_padl, gp_padr, gp_face1, gp_face2];
konamilen = array_length(konamicode_keyboard);
konamistep = 0;
konamiexplosion = 0;
