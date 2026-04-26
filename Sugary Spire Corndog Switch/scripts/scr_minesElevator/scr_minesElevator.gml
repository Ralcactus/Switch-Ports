function cutscene_elevator_prestart()
{
    var elevator = cutscene_get_actor("ELEVATOR");
    var finished = false;
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        state = UnknownEnum.Value_110;
        movespeed = 6;
        hsp = 0;
        vsp = 0;
        image_speed = 0.35;
        
        if (instance_exists(elevator))
        {
            x = lerp(x, elevator.x, 0.5);
            y = lerp(y + (sprite_height / 2), elevator.y + (elevator.sprite_height / 2), 0.5) - (sprite_height / 2);
            
            if (elevator.sprite_index == spr_minesElevator && abs(x - elevator.x) < 3 && abs((y + (sprite_height / 2)) - (elevator.y + (elevator.sprite_height / 2))) < 3 && animation_end())
            {
                elevator.sprite_index = spr_minesElevatorClosing;
                elevator.image_index = 0;
                elevator.depth = depth - 1;
                sprite_index = spr_player_PZ_elevator;
                visible = false;
            }
            else if (elevator.sprite_index == spr_minesElevator)
            {
                sprite_index = spr_entergate;
            }
            
            if (elevator.sprite_index == spr_minesElevatorClosing && elevator.image_index >= (elevator.image_number - 1))
            {
                finished = true;
                elevator.sprite_index = spr_minesElevatorRunning;
                
                with (obj_parent_follower)
                    visible = false;
            }
        }
    }
    
    if (finished)
        cutscene_event_end();
}

function cutscene_elevator_start()
{
    var elevator = cutscene_get_actor("ELEVATOR");
    var finished = false;
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        state = UnknownEnum.Value_110;
        hsp = 0;
        vsp = 0;
        sprite_index = spr_idle;
        visible = false;
        
        if (instance_exists(elevator))
        {
            x = elevator.x;
            y = (elevator.y + (elevator.sprite_height / 2)) - (sprite_height / 2);
            elevator.vsp = lerp(elevator.vsp, 6, 0.125);
            elevator.sprite_index = spr_minesElevatorRunning;
            elevator.image_speed = 0.35;
            
            if (elevator.y > (room_height + 100))
                finished = true;
        }
    }
    
    if (finished)
        cutscene_event_end();
}

function cutscene_elevator_premiddle()
{
    var elevator = cutscene_get_actor("ELEVATOR");
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        state = UnknownEnum.Value_110;
        targetRoom = mineshaft_elevator;
        hsp = 0;
        vsp = 0;
        visible = false;
    }
    
    if (instance_exists(elevator))
    {
        instance_destroy(elevator);
        
        if (!instance_exists(obj_fadeoutTransition))
        {
            event_play_oneshot("event:/SFX/general/door");
            instance_create(0, 0, obj_fadeoutTransition);
        }
    }
    else if (room == mineshaft_elevator)
    {
        cutscene_event_end();
    }
}

function cutscene_elevator_middle()
{
    var finished = false;
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        state = UnknownEnum.Value_110;
        hsp = 0;
        vsp = 0;
        targetRoom = mineshaft_8;
    }
    
    if (room == mineshaft_elevator && instance_exists(obj_minesElevatorCounter))
    {
        finished = obj_minesElevatorCounter.count > 120;
        
        with (obj_parent_player)
        {
            x = room_width / 2;
            y = room_height / 2;
            visible = false;
        }
    }
    
    if (finished && room == mineshaft_elevator)
    {
        if (!instance_exists(obj_fadeoutTransition))
        {
            event_play_oneshot("event:/SFX/general/door");
            instance_create(0, 0, obj_fadeoutTransition);
        }
    }
    else if (room == mineshaft_8)
    {
        with (obj_parent_player)
        {
            x = obj_doorB.x + (obj_doorB.sprite_width / 2);
            y = obj_doorB.y + (obj_doorB.sprite_height / 2);
        }
        
        cutscene_event_end();
    }
}

function cutscene_elevator_preend()
{
    var elevator = obj_elevatorCrashing;
    
    with (obj_parent_player)
    {
        state = UnknownEnum.Value_110;
        hsp = 0;
        vsp = 0;
        x = elevator.x;
        y = (elevator.y + (elevator.sprite_height / 2)) - (sprite_height / 2);
        visible = false;
    }
    
    if (elevator.grounded)
    {
        elevator.sprite_index = spr_minesElevatorCrashed;
        camera_shake_add(8, 20);
        event_play_oneshot("event:/SFX/player/groundpound", elevator.x, elevator.y);
        
        for (var i = 0; i < sprite_get_number(spr_minesElevatorDebris); i++)
        {
            with (instance_create(elevator.x + irandom_range(-40, 40), elevator.y - irandom_range(20, 60), obj_debris))
            {
                sprite_index = spr_minesElevatorDebris;
                image_index = i;
            }
        }
        
        cutscene_event_end();
    }
}

function cutscene_elevator_end()
{
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        image_index = 0;
        image_speed = 0.35;
        sprite_index = spr_player_PZ_slipSlide_intro;
        visible = true;
        state = UnknownEnum.Value_94;
        vsp = -11;
        hsp = 16;
        movsepeed = 16;
        image_xscale = 1;
        xscale = 1;
        grounded = false;
    }
    
    with (obj_parent_follower)
        visible = true;
    
    cutscene_event_end();
}
