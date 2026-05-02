if (instance_number(obj_music) > 1)
{
    var first = instance_find(obj_music, 0);
    
    if (id != first)
    {
        instance_destroy();
        exit;
    }
}

addRoomMusic = function(arg0, arg1, arg2, arg3)
{
    var temp_struct = {};
    
    with (temp_struct)
    {
        eventName = arg1;
        secretEventName = arg2;
        musicInst = undefined;
        secretMusicInst = undefined;
        musicFunc = undefined;
        
        if (!is_undefined(eventName) && is_string(eventName))
            musicInst = fmod_createEventInstance(eventName);
        
        if (!is_undefined(secretEventName) && is_string(secretEventName))
            secretMusicInst = fmod_createEventInstance(secretEventName);
        
        if (!is_undefined(arg3) && is_callable(arg3))
            musicFunc = method(self, arg3);
    }
    
    ds_map_set(global.RoomMusicMap, arg0, temp_struct);
};

global.RoomMusicMap = ds_map_create();
global.EscapeMusicInst = fmod_createEventInstance("event:/music/escape");
global.RankMusicInst = fmod_createEventInstance("event:/music/rank");
global.HarryMusicInst = fmod_createEventInstance("event:/music/pillar");
global.RoomMusic = undefined;
global.RoomIsSecret = false;
panicStart = false;
currentSecretStatus = false;
addRoomMusic(realtitlescreen, "event:/music/titlescreen", undefined, undefined);
addRoomMusic(palroom, "event:/music/options", undefined, undefined);
addRoomMusic(rm_devroom, "event:/music/devroom", undefined, undefined);
addRoomMusic(hub_hallway, "event:/music/hub", undefined, function(arg0, arg1, arg2)
{
    var event_state = undefined;
    
    switch (arg0)
    {
        case hub_w1:
		case hub_hallway:
        default:
            event_state = 0;
            break;
        
        case hub_w2:
            event_state = 1;
            break;    
			
        case hub_w3:
            event_state = 2;
            break;		
			
        case hub_w4:
            event_state = 3;
            break;
    }
    
    if (!is_undefined(event_state))
        fmod_event_setParameter(arg1, "state", event_state, false);
});
addRoomMusic(hub_w1, "event:/music/hub", undefined, function(arg0, arg1, arg2)
{
    var event_state = undefined;
    
    switch (arg0)
    {
        case hub_w1:
		case hub_hallway:
        default:
            event_state = 0;
            break;
        
        case hub_w2:
            event_state = 1;
            break;    
			
        case hub_w3:
            event_state = 2;
            break;		
			
        case hub_w4:
            event_state = 3;
            break;
    }
    
    if (!is_undefined(event_state))
        fmod_event_setParameter(arg1, "state", event_state, false);
});
addRoomMusic(entryway_1, "event:/music/w1/entryway", "event:/music/w1/entryway_secret", undefined);
addRoomMusic(steamy_1, "event:/music/w1/cottontown", "event:/music/w1/cottontown_secret", function(arg0, arg1, arg2)
{
    var event_state = undefined;
    
    switch (arg0)
    {
        case steamy_1:
        case steamy_7:
            event_state = 0;
            break;
        
        case steamy_8:
            event_state = 1;
            break;
    }
    
    if (!is_undefined(event_state))
        fmod_event_setParameter(arg1, "state", event_state, false);
});
addRoomMusic(molasses_1, "event:/music/w1/molasses", "event:/music/w1/molasses_secret", function(arg0, arg1, arg2)
{
    var event_state = undefined;
    
    switch (arg0)
    {
        case molasses_1:
        case molasses_6:
            event_state = 0;
            break;
        
        case molasses_6b:
            event_state = 1;
            break;
    }
    
    if (!is_undefined(event_state))
        fmod_event_setParameter(arg1, "state", event_state, false);
});
addRoomMusic(mineshaft_1, "event:/music/w1/mines", "event:/music/w1/mines_secret", function(arg0, arg1, arg2)
{
    var event_state = global.MinesFlags[UnknownEnum.Value_2];
    
    if (!is_undefined(event_state))
        fmod_event_setParameter(arg1, "state", event_state, false);
});
addRoomMusic(mountain_intro, "event:/music/w2/mountain", "event:/music/w2/mountain_secret", function(arg0, arg1, arg2)
{
    var event_state = undefined;
    
    switch (arg0)
    {
        case mountain_intro:
        case mountain_1:
        case mountain_5:
            event_state = 0;
            break;
        
        case mountain_6:
            event_state = 1;
            break;
    }
    
    if (!is_undefined(event_state))
        fmod_event_setParameter(arg1, "state", event_state, false);
});
addRoomMusic(dance_1, "event:/music/w2/danceoff", "event:/music/w2/danceoff_secret", function(arg0, arg1, arg2)
{
    var event_state = undefined;
    
    switch (arg0)
    {
        case dance_1:
        case dance_5:
            event_state = 0;
            break;
        
        case dance_9:
            event_state = 1;
            break;
    }
    
    if (!is_undefined(event_state))
        fmod_event_setParameter(arg1, "state", event_state, false);
});
addRoomMusic(cafe_1, "event:/music/w2/cafe", "event:/music/w2/cafe_secret", undefined);
addRoomMusic(bee_1, "event:/music/w2/bee", "event:/music/w2/bee_secret", undefined);
addRoomMusic(souractive_1, "event:/music/w3/souractive", "event:/music/w3/sucrose_secret", function(arg0, arg1, arg2)
{
    var event_state = undefined;
    
    switch (arg0)
    {
        case souractive_tutorial:
            event_state = 3;
            break;
        
        default:
            event_state = global.SouractiveProgression;
            
            if (fmod_event_getParameter(arg1, "state") == 2 && global.SouractiveProgression == 1)
            {
                global.SouractiveProgression = 2;
                event_state = 2;
            }
            
            break;
    }
    
    if (!is_undefined(event_state))
        fmod_event_setParameter(arg1, "state", event_state, false);
});
addRoomMusic(licorice_1, "event:/music/w3/licorice", "event:/music/w3/sucrose_secret", undefined);
addRoomMusic(casino_1, "event:/music/w3/casino", "event:/music/w3/sucrose_secret", undefined);
addRoomMusic(sucrose_1, "event:/music/w3/sucrose", "event:/music/w3/sucrose_secret", undefined);
