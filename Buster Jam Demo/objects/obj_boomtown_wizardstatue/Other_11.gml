audio_stop_play(snd_explosion, 0, false);
var _num = irandom_range(0, array_length(explosion_positions) - 1);

for (var i = 0; i < 1; i++)
{
    var _x, _y;
    
    if (obj_frenzy.games_done)
    {
        _x = x + explosion_positions[_num][0];
        _y = y + explosion_positions_next[_num][1];
    }
    else
    {
        _x = x + explosion_positions_next[explosion_count][0];
        _y = y + explosion_positions_next[explosion_count][1];
    }
    
    var _inst = instance_create_layer(_x, _y, "FX", obj_map_fx);
    _inst.ignore_render = true;
    _inst.visible = true;
    var _array = [spr_fx_explosion, spr_fx_explosion_turq];
    var _col = (explosion_count + col_offset) % 2;
    _inst.anim_sprite = _array[_col];
}

if (obj_frenzy.games_done)
{
    shake = 1;
    
    if (explosion_count == (explosion_count_max - 1))
    {
        timer[2] = 10;
        obj_map_frenzy_controller.overlay_white = 1.3;
        obj_map_frenzy_controller.overlay_dec = 0.016666666666666666;
        obj_map_frenzy_controller.zoom = 0.96;
        screen_shake(30, 30, 0.4);
        audio_play_sound(snd_wizardstatue_crumble, 0, false);
        
        with (obj_map_frenzy_controller)
            timer[2] = 180;
    }
}
