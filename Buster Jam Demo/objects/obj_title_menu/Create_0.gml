text_confirm = "<glyph gp_cross> Confirm";
scr_dialogue_reset(text_confirm, true);
type_index = string_length(text_confirm);
menu = ["STORY", "ENDLESS", "OPTIONS", "SUPPORT", "CREDITS", "QUIT"];
selected = 0;
selected_xoff = 0;
percent_xoff = 1;

for (var i = 0; i < array_length(menu); i++)
{
    menu_scale[i] = 1;
    menu_alpha[i] = 1;
}

time = 0;
bar_y = 0;
pattern_bar_x = 0;
pattern_bar_x_behind = 0;
desc_x = 1970;
desc_x_start = desc_x;
desc_sep = 600;
desc[0] = "The Wizard has come out of retirement to rule the land once again. It's up to Buster and Bridget to show him who's boss!";
desc[1] = "Compete globally, locally, or with friends in endless mini-game action. Can you beat your high-score?";
desc[2] = "Configure game, video, and audio settings.                 ";
desc[3] = "Support TALLGLASS and their creative ventures!              ";
desc[4] = "Umm... Who's driving this crazy thing!? Hahahaha.           ";
desc[5] = "...Wow. So, you're just gonna leave? Without saying goodbye? Whatever...";
desc_loop = false;
bars_out = 1;
desc_xscale = 0.89;
graphic_scale = 1;
yoff = 0;
ready = false;
draw_me = false;
timer[0] = -1;

timer_func[0] = function()
{
    menu_alpha[selected] = !menu_alpha[selected];
    timer[0] = 7;
};

timer[1] = -1;

timer_func[1] = function()
{
    ready = true;
    
    if (room_to == -4)
    {
        timer[0] = -1;
        
        for (var i = 0; i < array_length(menu); i++)
            menu_alpha[i] = 1;
    }
    
    if (options)
    {
        instance_create_layer(0, 0, "Options", obj_options);
        options = false;
        ready = false;
    }
    
    if (credits)
    {
        instance_create_layer(0, 0, layer, obj_credits);
        credits = true;
        ready = false;
    }
    
    if (url != "")
    {
        url_open(url);
        url = "";
    }
    
    if (quit)
    {
        ready = false;
        instance_create_layer(0, 0, layer, obj_title_menu_quit);
    }
    
    if (newgame)
    {
        instance_create_layer(0, 0, layer, obj_title_menu_newgame);
        ready = false;
    }
    
    if (room_to != -4)
    {
        ready = false;
        room_goto_fade(room_to, 60, global.bgm_play);
    }
};

quit = false;
room_to = -4;
url = "";
options = false;
credits = false;
newgame = false;
timer[2] = -1;

timer_func[2] = function()
{
    desc_loop = true;
};

timer[3] = -1;

timer_func[3] = function()
{
    move_bars_in = true;
    timer[2] = 240;
    desc_loop = false;
};

timer[4] = -1;

timer_func[4] = function()
{
    move_bars_in = false;
    percent_bars = 0;
};

move_bars_in = false;
percent_bars = 1;
