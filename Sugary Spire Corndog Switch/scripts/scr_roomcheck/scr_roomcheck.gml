function scr_roomcheck()
{
    var special_rooms = [scootercutsceneidk, rm_devroom, rm_levelSelect, rm_introVideo, palroom, rank_room, timesuproom, realtitlescreen, rm_credits, rm_painterarena, rm_titlecard, rm_disclaimer];
    return !array_contains(special_rooms, room);
}

function is_hub()
{
    var hub_rooms = [hub_w1, hub_w2, hub_basement, hub_hallway];
    return array_contains(hub_rooms, room);
}
