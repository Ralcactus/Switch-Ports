if (exit_freeze())
    exit;

anim_logic();
len += 4.5;
effect_alpha -= 0.035;
angle -= 4.5;

if (effect_alpha <= 0)
    instance_destroy();

scale = approach(scale, 1, 0.03);
