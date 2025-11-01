hspd = 0;
vspd = 0;
move[0] = 0;
move[1] = 0;

for (var c = 0; c < 2; c++)
{
    move_sub[c] = 0;
    move_calc[c] = 0;
}

path_init(false);
on_path = true;
stop = false;
has_collision = true;
list_push = ds_list_create();

event_oof = function()
{
};

path_pos_start = 0;
ready = false;
alarm[0] = 1;
editor_pos = 0;
land_id = -4;
facing = 1;
