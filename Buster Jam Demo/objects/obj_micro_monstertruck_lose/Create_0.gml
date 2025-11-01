event_inherited();
alpha = 0;
timer[0] = 8;

timer_func[0] = function()
{
    get_cams(1);
    var _inst = instance_create_micro(random_range(camx + 50, (camx + camw) - 50), random_range(camy + 50, (camy + camh) - 50), "Over2", obj_micro_fx);
    
    with (_inst)
        anim_play(spr_micro_monstertruck_explosion);
    
    timer[0] = 8;
};
