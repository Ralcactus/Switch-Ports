anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;
image_xscale = facing;
audio_play_sound(snd_jump, 0, 0);
part_particles_create(global.part_over, x, y, global.particles.jumpdust, 1);
