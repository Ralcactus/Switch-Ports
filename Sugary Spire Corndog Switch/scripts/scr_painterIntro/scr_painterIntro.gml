function cutscene_painter_start()
{
    with (obj_parent_player)
    {
        state = UnknownEnum.Value_110;
        x = 192;
        y = 544;
        grav = 0.5;
        image_speed = 0.35;
        visible = true;
        sprite_index = spr_player_PZ_freeFallSpin;
        vsp = -18;
        hsp = 0;
    }
    
    cutscene_event_end();
}

function scr_paintercut_walk()
{
    var finished = false;
    var target_x = 3872;
    
    with (obj_parent_player)
    {
        image_speed = 0.35;
        
        if (sign(target_x - x) != 0)
            xscale = -sign(x - target_x);
        
        if (movespeed < 7)
            movespeed += 0.5;
        else
            movespeed = min(movespeed, 7);
        
        hsp = lengthdir_x(movespeed, point_direction(x, 0, target_x, 0));
        
        if (hsp != 0)
        {
            if (movespeed < 3 && move != 0)
                image_speed = 0.35;
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45;
            else
                image_speed = 0.6;
            
            sprite_index = spr_move;
        }
        
        if (point_distance(x, 0, target_x, 0) <= 7 && grounded)
        {
            movespeed = 0;
            hsp = 0;
            vsp = 0;
            image_speed = 0.35;
            x = target_x;
            xscale = 1;
            finished = true;
        }
    }
    
    if (finished)
        cutscene_event_end();
}

function cutscene_player_land()
{
    var finished = false;
    obj_parent_player.vsp = approach(obj_parent_player.vsp, 12, 0.35);
    obj_parent_player.state = UnknownEnum.Value_110;
    obj_painter.image_speed = 0.35;
    obj_parent_player.image_speed = 0.35;
    
    with (obj_parent_player)
    {
        if (grounded && vsp > 0 && sprite_index != spr_player_PZ_land && sprite_index != spr_player_PZ_idle)
        {
            image_index = 0;
            sprite_index = spr_player_PZ_land;
            vsp = 0;
        }
        
        if (animation_end() && sprite_index == spr_player_PZ_land)
        {
            sprite_index = spr_player_PZ_idle;
            finished = true;
        }
    }
    
    if (finished)
        cutscene_event_end();
}

function scr_paintercut_waitforintro()
{
    obj_parent_player.hsp = 0;
    obj_parent_player.vsp = 0;
}

function cutscene_turn_painter()
{
    obj_painter.sprite_index = spr_painter_hurt;
    obj_painter.image_speed = 0.35;
    obj_parent_player.image_speed = 0.35;
    obj_painter.xscale = -1;
    
    with (obj_cutsceneManager)
        cutscene_event_end();
}

function cutscene_painter_jump()
{
    obj_painter.sprite_index = spr_painter_idle;
    obj_painter.image_speed = 0.35;
    obj_painter.vsp = -10;
    cutscene_event_end();
}

function cutscene_painter_land()
{
    static finished = false;
    
    if (obj_painter.grounded && obj_painter.vsp > 0)
    {
        finished = true;
        obj_painter.jumped = false;
        camera_shake_add(30, 50);
    }
    
    if (finished && audio_sound_get_track_position(global.music) >= 2.85 && obj_music.music == mu_painter)
    {
        cutscene_event_end();
        obj_parent_player.hsp = 0;
        obj_parent_player.movespeed = 0;
        obj_parent_player.state = UnknownEnum.Value_1;
        obj_painter.state = UnknownEnum.Value_0;
    }
}
