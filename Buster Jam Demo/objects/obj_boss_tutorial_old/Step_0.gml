timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);
timer_logic(4);
timer_logic(5);
var _bgm = music_play;

if (audio_is_playing(_bgm) && bpm != -4)
{
    var _pos = audio_sound_get_track_position(_bgm);
    var _beat = false;
    
    while (((beats - 1) * time_bpm_to_seconds(bpm)) >= _pos)
    {
        beats--;
        
        if (((beats - 1) * time_bpm_to_seconds(bpm)) < _pos)
            beats--;
    }
    
    while (_pos >= (time_bpm_to_seconds(bpm) * beats))
    {
        beats++;
        _beat = true;
    }
    
    if (_beat)
    {
        global.beat = true;
        
        if (((beats - 1) % 2) == 1)
            event_music_beat_double();
        else
            event_music_beat();
    }
}

buster_ind += ((sprite_get_speed(buster_sprite) / 60) * global.delta_game_factor);

if (buster_ind >= sprite_get_number(buster_sprite))
{
    if (buster_sprite == spr_tutorial_trans_buster_idle)
    {
        buster_ind = 3;
    }
    else if (buster_sprite == spr_tutorial_trans_buster_pull)
    {
        buster_ind = 0;
        buster_sprite = spr_tutorial_trans_buster_idle;
    }
}

if (bomb_sorted)
{
    bomb_vspd += (bomb_grav * global.delta_game_factor);
    bomb_scale -= (0.009 * global.delta_game_factor);
    bomb_rot += (0.425 * global.delta_game_factor);
    
    if (bomb_vspd >= 14)
        bomb_layer = 1;
    
    if (bomb_vspd >= 26.5)
    {
        bomb_pile_xscale = 1.05;
        bomb_pile_yscale = 0.95;
        bomb_sorted = false;
        bomb_done = true;
    }
}

bomb_pile_xscale = approach(bomb_pile_xscale, 1, 0.007);
bomb_pile_yscale = approach(bomb_pile_yscale, 1, 0.007);

if (belt_animate)
    belt_ind += ((sprite_get_speed(spr_tutorial_trans_belt) / 60) * global.delta_game_factor);

if (belt_go)
{
    bomb_fresh_y = approach(bomb_fresh_y, 800, 20);
    bomb_fresh_scale = approach(bomb_fresh_scale, 1, 0.025);
    bomb_fresh_alpha = approach(bomb_fresh_alpha, 1, 0.18);
    
    if (bomb_fresh_scale == 1)
    {
        belt_go = false;
        belt_animate = false;
    }
}

machine_xscale = approach(machine_xscale, 1, 0.0035);
machine_yscale = approach(machine_yscale, 1, 0.0035);
buster_xscale = approach(buster_xscale, 1, 0.02);
buster_yscale = approach(buster_yscale, 1, 0.02);
