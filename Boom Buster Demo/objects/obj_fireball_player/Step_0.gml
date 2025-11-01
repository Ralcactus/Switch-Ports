if (exit_freeze())
    exit;

physics_apply();
anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;
