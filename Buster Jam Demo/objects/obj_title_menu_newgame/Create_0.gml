testvariablenothing = false;

event_go = function()
{
    if (!file_exists("campaign.sav") || new_game)
    {
        room_to = rm_map_opening;
    }
    else
    {
        global.save_data = json_load("campaign.sav");
        room_to = asset_get_index(global.save_data.save_block);
        global.coins = global.save_data.coins;
        global.spawnID = "save_block";
        fixed_ini_close();
    }
    
    room_goto_fade(room_to, 60, global.bgm_play);
    deac = true;
};

deac = false;
new_game = false;
options[0] = ["Continue", "New Game", "Back"];

var _new = function()
{
    new_game = true;
    event_go();
};

var _continue = function()
{
    event_go();
};

var _back = function()
{
    go_sound = snd_menu_back;
    input_verb_consume("cancel");
    input_verb_consume("menu_confirm");
    
    if (instance_exists(obj_title_menu))
    {
        obj_title_menu.ready = true;
        obj_title_menu.newgame = false;
    }
    
    if (instance_exists(obj_pause_frenzy))
        obj_pause_frenzy.deac = false;
    
    instance_destroy();
};

options_func[0] = [_continue, _new, _back];
menu = 0;
time = 0;

for (var i = 0; i < 12; i++)
{
    menu_scale[i] = 1;
    menu_alpha[i] = 1;
}

selected = 0;
ready = true;
