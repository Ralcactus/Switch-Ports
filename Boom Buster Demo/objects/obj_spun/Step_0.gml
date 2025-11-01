if (exit_freeze())
    exit;

anim_logic();
vspd += grav;
x += (deathMult * (hspd * 4));
y += (deathMult * (vspd * 4));

if (y > (room_height + 250))
    instance_destroy();

scale += (deathMult * 0.004);

if (scale >= 1.05)
    depth = layer_get_depth("Particles_Over");

darkness += 0.0035;
image_angle -= (deathMult * (3.5 * facing));
