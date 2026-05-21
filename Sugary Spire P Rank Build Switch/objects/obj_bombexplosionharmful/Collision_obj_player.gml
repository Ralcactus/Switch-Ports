if (image_index > 9)
    exit;

if (other.state != states.bombpep)
{
    scr_hurtplayer(other);
    other.state = states.bombpep;
    other.bombpeptimer = 0;
    other.sprite_index = spr_bombpep_end;
    other.image_index = 0;
}
