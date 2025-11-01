controls_alpha = 0;
ini_open("save.ini");
var _str = string("{0} s{1}", world_to_name(global.world), global.stage);
highscore = ini_read_real(_str, "Highscore", 0);

if (global.dollars > highscore)
    ini_write_real(_str, "Highscore", global.dollars);

for (var i = 0; i < 3; i++)
{
    if (global.food[i])
        ini_write_real(_str, string("Food {0}", i), global.food[i]);
}

fixed_ini_close();
state = 0;
zoom = 1;
x = 960;
y = 540;
percent_slide = 0;
alarm[1] = 2;
alarm[0] = round(136.79999999999998);
controls_alpha = 0;
xoff = 1000;
percent_xoff = 0;
deac = false;
input = global.input[0];

for (var i = 0; i < 3; i++)
    food[i] = -4;

if (global.world == 0 || global.stage == 7)
    has_food = false;
else
    has_food = true;

dollars = 0;
top_dollars = 0;
dollars_flash = 0;
highscore_flash = 0;
highscore_played = false;
tally = 0;
tally_snd = 0;
food_count = 0;
done = false;
results_alpha = 0;
name_scroll = 0;
global.act = 1;
