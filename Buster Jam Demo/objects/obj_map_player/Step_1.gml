testvariablenothing = false;

if (scr_map_exit_freeze())
    exit;

jumping = false;
move[0] = 0;
move[1] = 0;
move[2] = 0;
zprevious = z;

if (instance_place_3d(x, y, z, obj_map_bridget_jump) && grounded)
    record_this_jump = true;

if (grounded && !instance_place_3d(x, y, z, obj_map_bridget_jump))
    record_this_jump = false;

if (cutscene_move)
{
    if (cutscene_move_xto != undefined)
        x = approach(x, cutscene_move_xto, movespd);
    
    if (cutscene_move_yto != undefined)
        y = approach(y, cutscene_move_yto, movespd);
    
    if (x == cutscene_move_xto && y == cutscene_move_yto)
    {
        cutscene_move = false;
        cutscene_move_xto = undefined;
        cutscene_move_yto = undefined;
    }
}
