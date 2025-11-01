shake_strength = 1;
shake_dec = 0.12;
part_particles_create(global.part_over_nostun, x, y - 48, global.particles.explosion, 1);
alarm[4] = 19;
audio_play_sound(snd_explosion, 0, 0);
audio_stop_sound(fuse);
screen_shake(20, 20, 0.27);

with (obj_controller)
{
    goodnight = true;
    flash_overlay = 1.16;
}

alarm[2] = 30;
alarm[3] = 132;
audio_play_sound(choose(voice_buster_scream, voice_buster_scream2, voice_buster_what), 0, 0);

with (obj_player_aframe)
    instance_destroy();

with (obj_fx_combo)
    instance_destroy();

with (obj_fx_combo_bar)
    instance_destroy();

with (obj_lightsout)
    instance_destroy();
