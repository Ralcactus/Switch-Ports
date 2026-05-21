if ((ds_list_find_index(global.baddieroom, id) == -1 && inhaleddestroyvar == false) || (important && inhaleddestroyvar == false))
    instance_create(x, y, obj_snowpoofeffect);

event_inherited();
