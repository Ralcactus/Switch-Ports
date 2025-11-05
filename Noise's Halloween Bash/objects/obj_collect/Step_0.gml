event_inherited();

if (!game_paused())
    sparkletimer = approach(sparkletimer, 0, 0.1);

if (global.combo >= 5)
{
    value = 20;
    combosparkles();
}
else
    value = 10;
