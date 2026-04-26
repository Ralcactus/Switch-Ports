if (other.state == UnknownEnum.Value_78 || other.state == UnknownEnum.Value_79 || other.state == UnknownEnum.Value_81)
{
    event_play_multiple("event:/SFX/general/collect", x, y);
    create_small_number((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), "10");
    global.Collect += 10;
    global.PizzaMeter += 1;
    global.ComboFreeze = clamp(global.ComboFreeze + 5, 0, 30);
    global.ComboTime += 15;
    scr_ghostcollectible(false);
    create_collect_effect(x, y, sprite_index, 10);
    instance_destroy();
}
