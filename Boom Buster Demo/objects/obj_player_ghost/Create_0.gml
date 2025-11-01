recording_frame = 1;
var _data = load_json(ghost_file);
recording_follow = _data.recording;
record_xstart = _data.xstart;
record_ystart = _data.ystart;
record_facing = _data.facing;

set_values = function()
{
    if (struct_exists(recording_follow[recording_frame], "spr"))
        sprite_index = asset_get_index(recording_follow[recording_frame].spr);
    
    if (struct_exists(recording_follow[recording_frame], "ind"))
        image_index = recording_follow[recording_frame].ind;
    
    if (struct_exists(recording_follow[recording_frame], "facing"))
        image_xscale = recording_follow[recording_frame].facing;
    
    if (struct_exists(recording_follow[recording_frame], "x"))
        x = recording_follow[recording_frame].x;
    
    if (struct_exists(recording_follow[recording_frame], "y"))
        y = recording_follow[recording_frame].y;
};

set_values();
image_alpha = 0.55;
image_speed = 0;
ID = 0;
out = false;
ready = true;
