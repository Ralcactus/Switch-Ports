if (room != rank_room)
{
    instance_destroy(obj_fadeout)
    with (obj_player1)
    {
        targetDoor = "A"
        room_goto(timesuproom)
        state = (66 << 0)
        sprite_index = spr_Timesup
        image_index = 0
        audio_stop_sound(global.music)
    }
    instance_create(0, 0, obj_timesupwar)
    instance_destroy()
}
