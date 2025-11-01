testvariablenothing = false;
event_inherited();
anim_init();

event_spun = function()
{
    var _inst = instance_create_layer(x, y, "FX", obj_macro_knives_bom_launch);
    _inst.side = side;
    
    with (obj_macro_knives_controller)
        event_shake(1.2, 0.058823529411764705);
    
    if (obj_macro_knives_controller.hits == 2)
    {
        with (obj_macro_knives_player)
            deac = true;
    }
    
    audio_play_sound(snd_ouch, 0, 0);
    instance_destroy();
};

event_fail = function()
{
    var _fx = instance_create_layer(x, y - 40, "FX", obj_universal_fx);
    
    with (_fx)
    {
        anim_sprite = spr_fx_explosion;
        anim_index = 0;
        die_after_anim = true;
    }
    
    audio_play_sound(snd_explosion, 0, 0);
    
    with (obj_macro_knives_player)
        event_user(0);
    
    instance_destroy();
};

glyph = false;
