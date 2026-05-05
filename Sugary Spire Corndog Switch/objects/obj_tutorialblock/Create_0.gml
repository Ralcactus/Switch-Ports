shakealil = 0;
ini_open("saveData.ini");

if (ini_read_string("Misc", "TutorialBlock", "0") != "0")
{
    instance_destroy();
}
else if (ini_read_string("Ranks", "tutorial", "none") != "none")
{
    shakealil = 2;
    alarm[0] = 80;
}

ini_close_os();
depth = 4;
