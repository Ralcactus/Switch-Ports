if (secretActivated && !place_meeting(x, y, obj_secretPortalexit))
{
    if (other.state != UnknownEnum.Value_110 && sprite_index == spr_secretPortal && ds_list_find_index(global.SaveRoom, id) == -1)
    {
        var _cutscene = cutscene_create([cutscene_secretPortal_start, cutscene_secretPortal_middle, cutscene_secretPortal_preend, cutscene_secretPortal_end]);
        cutscene_declare_actor(id, "SECRETPORTAL");
        
        if (is_undefined(storedState))
            storedState = functionState();
        
        with (_cutscene)
            storedState = other.storedState;
        
        image_index = 0;
        sprite_index = spr_secretPortal_tele;
        event_play_oneshot("event:/SFX/general/secretenter", x, y);
        ds_list_add(global.SaveRoom, id);
    }
}
