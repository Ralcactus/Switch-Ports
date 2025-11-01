if (exit_freeze())
    exit;

anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;
timer_logic(0);
