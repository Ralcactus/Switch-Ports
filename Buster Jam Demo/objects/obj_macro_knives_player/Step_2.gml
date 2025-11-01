testvariablenothing = false;
anim_logic();

if (caught_bridget)
{
    anim_play(spr_macro_buster_holdbridget);
}
else if (action == action_spin)
{
    anim_play(spr_macro_buster_spin);
}
else if (action == action_free)
{
    anim_play(spr_macro_buster_run);
}
else if (action == action_turn)
{
    if (anim_sprite == spr_macro_buster_turn_down || anim_sprite == spr_macro_buster_turn_up)
        anim_index = (flip_yoff / flip_yto) * sprite_get_number(anim_sprite);
}
