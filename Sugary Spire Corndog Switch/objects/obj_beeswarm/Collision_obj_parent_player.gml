if (player.state != UnknownEnum.Value_65)
{
    if (invisFrames <= 0)
        scr_hurtplayer(other);
}
else if (invisFrames <= 0)
{
    instance_destroy();
}
