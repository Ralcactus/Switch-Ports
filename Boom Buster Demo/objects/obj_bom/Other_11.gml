if (collected)
    exit;

collected = true;
physics_simple = true;
event_inherited();
obj_controller.boms_left--;
timer[0] = -1;
anim_play(asset_get_index(string("spr_bom_{0}", col_to_str(col))));
