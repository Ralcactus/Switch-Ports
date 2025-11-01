testvariablenothing = false;
percent_move = approach(percent_move, 1, 0.16666666666666666);
x = use_curve(acurv_linear, percent_move, undefined, xstart, xto);
y = use_curve(acurv_linear, percent_move, undefined, ystart, yto);

if (percent_move == 1)
{
    if (ID == 0)
    {
        with (obj_cutscene_blackknives)
        {
            event_actor_visible(1, true);
            event_actor_snap(0, 3375, 2364, 0);
            event_actor_snap(1, 3545, 2358, 0);
            event_actor_sprite(0, spr_map_buster_subway_omg);
            event_actor_sprite(1, spr_map_bridget_subway_omg);
            event_actor_shake(0);
            event_actor_shake(1);
        }
    }
    
    audio_stop_play(snd_Bu_skate_land, 0, 0);
    var _inst = instance_create_layer(x, y, "Instances_Behind", obj_blackknives_ninjastar_wall);
    _inst.image_index = ID;
    instance_destroy();
}
