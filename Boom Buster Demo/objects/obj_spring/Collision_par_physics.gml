if (!other.has_collision)
    exit;

if (other.vspd >= 0)
{
    anim_sprite = spr_spring_bounce;
    anim_index = 0;
    audio_play_sound(snd_spring, 0, 0);
}

with (other)
{
    bounce_blocks = other.bounce_height;
    bounce_blocks_hold = other.bounce_height;
    event_bounce();
}
