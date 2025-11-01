function audio_queue(arg0, arg1, arg2 = false, arg3 = false)
{
    var _audio = 
    {
        audio: arg0,
        time: arg1,
        ignore_freeze: arg2,
        stop_play: arg3
    };
    ds_list_add(global.audio_queues, _audio);
}
