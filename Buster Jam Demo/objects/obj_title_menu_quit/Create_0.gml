testvariablenothing = false;
deac = false;
new_game = false;
options[0] = ["QUIT GAME", "NEVERMIND"];

var _quit = function()
{
    game_end();
};

var _nevermind = function()
{
    go_sound = snd_menu_back;
    input_verb_consume("cancel");
    input_verb_consume("menu_confirm");
    
    if (instance_exists(obj_title_menu))
    {
        obj_title_menu.ready = true;
        obj_title_menu.quit = false;
    }
    
    if (instance_exists(obj_pause_frenzy))
        obj_pause_frenzy.deac = false;
    
    instance_destroy();
};

options_func[0] = [_quit, _nevermind];
menu = 0;
time = 0;

for (var i = 0; i < 12; i++)
{
    menu_scale[i] = 1;
    menu_alpha[i] = 1;
}

selected = 1;
ready = true;
