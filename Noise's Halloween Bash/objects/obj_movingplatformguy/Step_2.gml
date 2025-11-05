event_inherited();
sprite_index = spr_movingplatformguy;

with (obj_player)
{
    if (movingplatID == other.id)
        other.sprite_index = spr_movingplatformguyweighted;
}
