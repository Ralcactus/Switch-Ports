/// @description Initialize Discord.

#macro DISCORD_APP_ID "1302380959915839549"

ready = false;
details = "Get ready for....";
alarm[0] = room_speed * 5;

if (!np_initdiscord(DISCORD_APP_ID, true, "0"))
    instance_destroy();
