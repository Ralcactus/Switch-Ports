if (room != rank_room && minutes <= 0 && seconds <= 0 && addseconds <= 0)
{
    with (obj_player1)
    {
        instance_destroy(obj_fadeoutTransition);
        targetDoor = "A";
        global.panic = 0;
        global.greyscalefade = 0;
        room = timesuproom;
        state = UnknownEnum.Value_27;
        sprite_index = spr_Timesup;
        image_index = 0;
		fmod_event_stop_all(true);
        event_play_oneshot("event:/music/timesup");
    }

    instance_destroy();
}