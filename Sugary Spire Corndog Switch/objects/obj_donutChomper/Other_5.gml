if (ds_list_find_index(global.SaveRoom, id) != -1)
{
    if (!givenPoints)
    {
        event_play_multiple("event:/SFX/general/collect", x, y);
        global.Collect += 50;
        create_small_number(x, y, "50");
        givenPoints = true;
    }
}
