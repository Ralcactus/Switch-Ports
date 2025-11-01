if (go == "R")
{
    var _trans = room_goto_triangles(rm_results);
    
    _trans.func_roomend = function()
    {
        audio_stop_all();
    };
    
    audio_sound_gain(bgm, 0, 800);
    exit;
}

global.stage = go;
global.act = 1;
global.next_room = asset_get_index(string("rm_{0}_s{1}a{2}", world_to_name(global.world), global.stage, global.act));
room_goto(global.next_room);
audio_stop_all();
