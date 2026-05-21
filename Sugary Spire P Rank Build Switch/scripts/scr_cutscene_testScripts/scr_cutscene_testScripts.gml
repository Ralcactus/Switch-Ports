function cutscene_shake_actor(_actor, mag)
{
    var _dump = cutscene_get_actor(_actor);
    
    with (_dump)
    {
        shake_magx = mag;
        shake_dir = 1;
        shake_timer = 0;
    }
    
    cutscene_event_end();
}
