with (other)
{
    if (!other.wasCollected && (state == UnknownEnum.Value_45 || state == UnknownEnum.Value_46))
    {
        other.wasCollected = true;
        other.alarm[0] = 200;
        sprite_index = spr_player_PZ_ufo_speedUp;
        image_index = 0;
        state = UnknownEnum.Value_46;
        ufoTimer = min(ufoTimer + 150, 750);
    }
}
