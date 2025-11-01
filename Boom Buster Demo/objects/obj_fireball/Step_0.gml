event_inherited();

if (hspd != 0)
    image_xscale = sign(hspd);

if (exit_freeze())
    exit;

if ((hspd < 0 && x < -32) || (hspd > 0 && x > (room_width + 32)))
{
    instance_destroy();
    exit;
}

anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;

for (var i = 0; i < choose(1, 2); i++)
    part_particles_create(global.part_over, x - (32 * sign(hspd)), y + irandom_range(-30, 30), global.particles.ember, 1);

hey_scale = approach(hey_scale, 0, 0.1);

if (hey_scale == 0)
    hey_scale = 1.5;
