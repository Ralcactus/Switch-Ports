if (active)
{
    with (obj_dancenote_sndhandler)
    {
        count++;
        fmod_event_setPitch(snd, 0.5 + ((count - maxcount) / maxcount / 2));
        fmod_event_play(snd);
        
        if (count >= maxcount)
        {
            instance_destroy();
            event_play_oneshot("event:/SFX/general/cheers");
            var val = maxcount * 10;
            create_small_number(obj_parent_player.x, obj_parent_player.y, string(val));
            global.Collect += val;
            global.ComboTime = 60;
            create_collect_effect(x, y, spr_bigcollect1P, val);
        }
    }
    
    instance_destroy();
}
