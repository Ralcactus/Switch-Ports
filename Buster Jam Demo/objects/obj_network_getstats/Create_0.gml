alarm[0] = 20;
done = false;
left_room = false;
tries = 0;
failed = false;
myhighscore_request_id = undefined;
upload_ID = undefined;
get_pfp = undefined;
deac = false;
need_upload = true;
global.network_available = false;
global.steam_username = "";
global.steam_pfp = undefined;
surf = -4;
zoom = 0;
percent_zoom = 0;
loading_angle = 0;
nextroom = rm_splash_epilepsy;

event_success = function()
{
    room_goto_fade(nextroom);
};

event_fail = function()
{
    room_goto_fade(nextroom);
};
