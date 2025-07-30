if (instance_exists(obj_optionNew))
    exit;

var frame_current = floor(image_index);

with (obj_player)
{
    state = 114;
    x = obj_doorA.x;
    y = obj_doorA.y;
}

switch (state)
{
    case 0:
        var instant = keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(global.player_input_device);
        
        switch (sprite_index)
        {
            case introArr[0]:
                if (image_speed == 0 && instant)
                {
                    image_speed = 0.35;
                    event_play_oneshot("event:/SFX/ui/titlestart");
                    
                    with (obj_music)
                        fmod_event_setParameter(music.music_inst, "state", 1, true);
                }
                else if (frame_current == 23 && introSoundBuffer != frame_current)
                {
                    event_play_oneshot("event:/SFX/bo/groundpound", global.resolutions[0][1][0] / 2, global.resolutions[0][1][1] / 2);
                    introSoundBuffer = frame_current;
                }
                else if (image_index >= (image_number - 1))
                {
                    sprite_index = introArr[1];
                    image_index = 0;
                }
                
                break;
            
            case introArr[1]:
                if (image_index >= (image_number - 1) || instant)
                {
                    state = 1;
                    selected = 1;
                    moveBuffer = 10;
                    sprite_index = saves[selected].spr_hover;
                    image_index = 0;
                }
                else if (introSoundBuffer != frame_current)
                {
                    switch (frame_current)
                    {
                        case 25:
                            event_play_oneshot("event:/SFX/bo/grabcancel", global.resolutions[0][1][0] / 2, global.resolutions[0][1][1] / 2);
                            break;
                        
                        case 73:
                        case 80:
                            event_play_oneshot("event:/SFX/ui/step");
                            break;
                    }
                    
                    introSoundBuffer = frame_current;
                }
                
                break;
        }
        
        break;
    
    case 3:
        saves[selected].step();
        
        if (frame_current != introSoundBuffer)
        {
            if (selected == 1)
            {
                switch (frame_current)
                {
                    case 1:
                        event_play_oneshot("event:/SFX/ui/menuselect1", global.resolutions[0][1][0] / 2, global.resolutions[0][1][1] / 2);
                        break;
                }
            }
            else if (selected == 2)
            {
                switch (frame_current)
                {
                    case 2:
                    case 4:
                    case 6:
                        event_play_oneshot("event:/SFX/ui/step");
                        break;
                    
                    case 8:
                        event_play_oneshot("event:/SFX/ui/menuselect2", global.resolutions[0][1][0] / 2, global.resolutions[0][1][1] / 2);
                        break;
                }
            }
            else if (selected == 3)
            {
                switch (frame_current)
                {
                    case 1:
                    case 11:
                    case 21:
                    case 26:
                    case 32:
                    case 36:
                        event_play_oneshot("event:/SFX/bo/grabcancel", global.resolutions[0][1][0] / 2, global.resolutions[0][1][1] / 2);
                        break;
                    
                    case 38:
                        event_play_oneshot("event:/SFX/ui/menuselect3", global.resolutions[0][1][0] / 2, global.resolutions[0][1][1] / 2);
                        break;
                }
            }
            
            introSoundBuffer = frame_current;
        }
        
        if (frame_current == (image_number - 1))
        {
            image_speed = 0;
            endFadeAlpha += 0.05;
            
            if (endFadeAlpha >= 1)
                event_user(0);
        }
        
        break;
    
    case 2:
        saves[selected].step();
        
        if (!input_check("taunt"))
        {
            state = 1;
            moveBuffer = 10;
            deleteBuffer = deleteTime;
            exit;
        }
        
        deleteBuffer--;
        
        if (deleteBuffer <= 0)
        {
            deleteSave(selected);
            event_play_oneshot("event:/SFX/misc/explosion", global.resolutions[0][1][0] / 2, global.resolutions[0][1][1] / 2);
            state = 1;
            moveBuffer = 10;
            deleteBuffer = deleteTime;
            image_index = 0;
        }
        
        break;
    
    case 1:
        var allow_movement = true;
        var current_save = saves[selected];
        
        for (var i = 1; i < array_length(saves); i++)
            saves[i].step();
        
        if (input_check_pressed("jump"))
        {
            state = 3;
            introSoundBuffer = 0;
            image_index = 0;
            event_play_oneshot("event:/SFX/misc/evilteleport");
            
            with (obj_music)
                fmod_event_stop(music.music_inst, false);
        }
        
        if (input_check_pressed("slap"))
        {
            state = 4;
            select2 = 1;
        }
        
        if (input_check("taunt") && current_save.percentage > 0)
        {
            state = 2;
            allow_movement = false;
        }
        
        if (moveBuffer > 0)
        {
            moveBuffer--;
            allow_movement = false;
        }
        
        if (allow_movement && state == 1)
        {
            var move = input_check_pressed("right") - input_check_pressed("left");
            var selOld = selected;
            selected += move;
            selected = clamp(selected, 1, array_length(saves) - 1);
            
            if (selected != selOld)
            {
                event_play_oneshot("event:/SFX/ui/step");
                moveBuffer = 10;
            }
        }
        
        break;
    
    case 4:
        saves[selected].step();
        var move2 = input_check_pressed("right") - input_check_pressed("left");
        var sel2Old = select2;
        var quitGame = false;
        var goBack = false;
        select2 += move2;
        select2 = clamp(select2, 0, 1);
        
        if (input_check_pressed("jump"))
        {
            if (select2 == 0)
                quitGame = true;
            else
                goBack = true;
        }
        else if (input_check_pressed("slap"))
        {
            goBack = true;
        }
        
        if (goBack)
        {
            state = 1;
            select2 = 1;
        }
        else if (quitGame)
        {
            game_end();
        }
        
        break;
}
