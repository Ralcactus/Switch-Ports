testvariablenothing = false;
boss = false;
nice_one_col = 26623;
ready = false;
alarm[1] = 2;
zoom = 0.3;
time = 0;
done = false;
glyph_alpha = 0;

if (is_string(global.frenzy_name))
{
    if (!array_contains(global.save_data.frenzies_beaten, global.frenzy_name))
        array_push(global.save_data.frenzies_beaten, global.frenzy_name);
}
else
{
}

var _room = undefined;

switch (global.frenzy_name)
{
    case "boss_knives":
        _room = rm_boomtown_stairs;
        break;
}

if (_room)
{
    global.save_data.save_block = room_get_name(_room);
    scr_save_game();
}

sprite_prefetch(spr_map_coin);
sprite_prefetch(spr_fx_sparkle);
timer[6] = -1;

timer_func[6] = function()
{
    with (par_results_character)
        ready = true;
    
    ready = true;
};
