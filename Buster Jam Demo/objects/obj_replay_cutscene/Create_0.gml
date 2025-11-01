testvariablenothing = false;
menu = 0;
options[0] = ["REPLAY", "SKIP"];
time = 0;

for (var i = 0; i < 12; i++)
{
    menu_scale[i] = 1;
    menu_alpha[i] = 1;
}

selected = 0;

var _replay = function()
{
    ready = false;
    room_goto_fade(global.room_cutscene);
};

var _skip = function()
{
    ready = false;
    room_goto_fade(global.room_skip_cutscene);
};

options_func[0] = [_replay, _skip];
ready = true;
