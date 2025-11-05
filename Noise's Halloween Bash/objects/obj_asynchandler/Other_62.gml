if (async_load[? "id"] == ASYNCID_version)
{
    var _status = async_load[? "status"];
    
    if (_status == 0)
    {
        var _md = async_load[? "result"];
        global.changelogs = string_split(_md, "#", true);
        
        for (var i = 0; i < array_length(global.changelogs); i++)
        {
            global.changelogs[i] = string_replace_all(global.changelogs[i], "\r\n", "\n");
            global.changelogs[i] = string_replace_all(global.changelogs[i], "\r", "");
            global.changelogs[i] = string_delete(global.changelogs[i], 1, 1);
        }
        
        var _newlinepos = string_pos("\n", global.changelogs[0]);
        global.latestver = string_copy(global.changelogs[0], 1, _newlinepos - 1);
        global.latestver = string_replace_all(global.latestver, " ", "");
        global.latestver = string_replace_all(global.latestver, "\n", "");
    }
    else if (_status < 0)
    {
        trace(string("Async HTTP Error {0}: Failed to get game markdown file.", _status));
        global.changelogrequestfailed = true;
    }
}

if (async_load[? "id"] == ASYNCID_itchname)
{
    var _status = async_load[? "status"];
    
    if (_status == 0)
        global.itchname = async_load[? "result"];
    else if (_status < 0)
        trace(string("Async HTTP Error {0}: Failed to get itch.io account name, defaulting to \"ptpteam-jr\".", _status));
}
