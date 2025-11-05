global.init_timesource = time_source_create(0, 1, 1, function()
{
    if (!instance_exists(obj_asynchandler))
        instance_create_depth(0, 0, 16000, obj_asynchandler);
}, [], 1);
time_source_start(global.init_timesource);
global.itchname = "ptpteam-jr";
global.changelogrequestfailed = false;
global.gamever = string_copy("1.0.0.0", 1, string_length("1.0.0.0") - 2);
global.latestver = global.gamever;
global.changelogs = array_create(0);

function get_changelogs()
{
    obj_asynchandler.ASYNCID_version = http_get("https://ptpteamjr.com/gamecontent/changelogs/NoisesHalloweenBash.md");
}

function get_itch()
{
    obj_asynchandler.ASYNCID_itchname = http_get("https://ptpteamjr.com/gamecontent/itchname.txt");
}

function is_latest()
{
    var _curver = string_replace(global.gamever, ".", "");
    var _latestver = string_replace(global.latestver, ".", "");
    _curver = real(_curver);
    _latestver = real(_latestver);
    
    if (_curver >= _latestver)
        return _curver >= _latestver;
}
