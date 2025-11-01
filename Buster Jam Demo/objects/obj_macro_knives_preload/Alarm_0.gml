testvariablenothing = false;

if (!audio_group_is_loaded(bgm_endless_jingleA))
{
    alarm[0] = 1;
    print("not loaded");
    exit;
}
else
{
    print("loaded");
}

instance_create_layer(0, 0, layer, obj_macro_knives_intro);
instance_destroy();
