function scr_taunt_storeVariables()
{
    tauntStored = 
    {
        state: state,
        hsp: hsp,
        prevHsp: prevHsp,
        vsp: vsp,
        prevVsp: prevVsp,
        movespeed: movespeed,
        verticalMovespeed: verticalMovespeed,
        conveyorHsp: conveyorHsp,
        sprite_index: sprite_index,
        image_index: image_index
    };
}

function scr_taunt_setVariables()
{
    state = tauntStored.state;
    hsp = tauntStored.hsp;
    prevHsp = tauntStored.prevHsp;
    vsp = tauntStored.vsp;
    prevVsp = tauntStored.prevVsp;
    movespeed = tauntStored.movespeed;
    verticalMovespeed = tauntStored.verticalMovespeed;
    conveyorHsp = tauntStored.conveyorHsp;
    sprite_index = tauntStored.sprite_index;
    image_index = tauntStored.image_index;
}

function do_taunt()
{
    static superTauntEffect = 0;
    
    if (superTauntCharged && room != rank_room)
    {
        superTauntEffect--;
        
        if (superTauntEffect <= 0)
        {
            instance_create(x + irandom_range(-25, 25), y + irandom_range(-10, 35), obj_superTauntEffect);
            superTauntEffect = 4;
        }
    }
    
    if (key_taunt2)
    {
        tauntTimer = 20;
        scr_taunt_storeVariables();
        state = UnknownEnum.Value_42;
        
        if (superTauntCharged && key_up)
        {
            event_play_oneshot("event:/SFX/player/supertaunt", x, y);
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3);
            image_index = 0;
        }
        else if (instance_exists(obj_dogMount) && distance_to_object(obj_dogMount) <= 50)
        {
            sprite_index = spr_petdog;
            image_index = 0;
            
            with (obj_dogMount)
                visible = false;
        }
        else
        {
            if (place_meeting(x, y, obj_exitgate) && global.ExitGateTaunt < 10 && get_panic())
            {
                var val = 25;
                global.Collect += val;
                global.ExitGateTaunt++;
                create_small_number(x, y, string(val));
                create_collect_effect(x, y, spr_taunteffect, val);
                event_play_multiple("event:/SFX/general/collect", x, y);
            }
            
            sprite_index = spr_taunt;
            event_play_oneshot("event:/SFX/player/taunt", x, y);
            image_index = irandom_range(0, sprite_get_number(spr_taunt));
        }
        
        instance_create(x, y, obj_taunteffect);
        
        with (obj_parent_baddie)
        {
            if (point_in_rectangle(x, y, obj_parent_player.x - 480, obj_parent_player.y - 270, obj_parent_player.x + 480, obj_parent_player.y + 270))
                tauntBuffer = true;
        }
        
        return true;
    }
    
    return false;
}

function do_grab()
{
    if (inputBufferSlap > 0 && !key_down && !suplexMove)
    {
        inputBufferSlap = 0;
        
        if (key_up || key_up2)
        {
            do_uppercut();
        }
        else if (global.rocketLauncher || global.tempRocketLauncher)
        {
            state = UnknownEnum.Value_131;
            image_index = 0;
            global.tempRocketLauncher = false;
            
            with (instance_create(x, y, obj_rocket))
            {
                image_xscale = other.xscale;
                frog = true;
            }
        }
        else if (character == UnknownEnum.Value_3)
        {
            instance_create(x, y, obj_slaphitbox);
            instance_create(x, y, obj_jumpdust);
            image_index = 0;
            sprite_index = spr_player_GB_bounce_mach2;
            move = key_left + key_right;
            
            if (move != 0)
                xscale = move;
            
            movespeed = 12;
            gumbobDashTimer = 25;
            gumbobHitWall = false;
            state = UnknownEnum.Value_121;
        }
        else if (character == UnknownEnum.Value_0)
        {
            instance_create(x, y, obj_slaphitbox);
            suplexMove = true;
            vsp = 0;
            instance_create(x, y, obj_jumpdust);
            image_index = 0;
            sprite_index = spr_suplexdash;
            
            if (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_55)
                movespeed = 8;
            else
                movespeed = max(movespeed, 5);
            
            state = UnknownEnum.Value_16;
            fmod_event_play(sndSuplex);
        }
        else if (character == UnknownEnum.Value_1)
        {
            fmod_event_play(sndKungFu);
            move = key_left + key_right;
            
            if (move != xscale && move != 0 && !upsideDownJump)
            {
                xscale = move;
                movespeed = 9;
                hsp = movespeed * xscale;
            }
            
            movespeed = max(movespeed, 9);
            kungTime = 30;
            state = UnknownEnum.Value_105;
            flash = true;
            
            if (grounded)
            {
                sprite_index = choose(spr_player_PN_kungfu_1, spr_player_PN_kungfu_2, spr_player_PN_kungfu_3, spr_player_PN_kungfu_4, spr_player_PN_kungfu_5);
            }
            else
            {
                sprite_index = choose(spr_player_PN_kungfuAir_1_intro, spr_player_PN_kungfuAir_2_intro, spr_player_PN_kungfuAir_3_intro);
                
                if (key_down)
                    vsp = 3;
            }
            
            instance_create(x, y, obj_crazyRunHoopEffect);
            
            if (!instance_exists(obj_superdashcloud) && grounded)
            {
                instance_create(x, y, obj_superdashcloud, 
                {
                    playerID: id
                });
            }
            
            p1Vibration(30, 5);
            image_index = 0;
        }
        
        return true;
    }
    
    return false;
}

function do_uppercut()
{
    if (character != UnknownEnum.Value_3)
    {
        movespeed = hsp;
        vsp = grounded ? -14 : -12;
        state = UnknownEnum.Value_88;
        suplexMove = true;
        sprite_index = spr_uppercutbegin;
        image_index = 0;
        event_play_oneshot("event:/SFX/player/uppercut", x, y);
        
        with (instance_create(x, y, obj_puffEffect))
            sprite_index = spr_tornadocloud;
    }
    else
    {
    }
}

function do_clubswing()
{
    state = UnknownEnum.Value_30;
    sprite_index = spr_suplexdash;
    image_index = 0;
    
    with (instance_create(x, y, obj_swinghitbox, 
    {
        playerID: id
    }))
        image_xscale = other.xscale;
}

function get_nearestPlayer(arg0 = x, arg1 = y)
{
    return global.coopGame ? instance_nearest(arg0, arg1, obj_parent_player) : obj_player1;
}
