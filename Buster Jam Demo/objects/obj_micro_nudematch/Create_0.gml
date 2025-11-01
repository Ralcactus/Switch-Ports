global.game_music = "bgm_micro_weshop";
alarm[0] = 1;
ready = false;
state = 0;
timer[0] = -1;

timer_func[0] = function()
{
    state = 2;
    char = obj_micro_nudematch_head_reference.image_index;
    eyes = obj_micro_nudematch_head.index[0];
    mouth = obj_micro_nudematch_head.index[2];
    nose = obj_micro_nudematch_head.index[1];
    micro_instance_destroy_all(par_micro_nudematch_head);
    micro_instance_destroy_all(obj_micro_nudematch_bg);
};

win_ind = 0;
flash = 0;
timer[1] = -1;

timer_func[1] = function()
{
    state = 1;
};
