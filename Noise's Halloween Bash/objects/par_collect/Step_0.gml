if (game_paused())
{
    image_index -= image_speed;
    exit;
}

if (hasphysics && !magnetised)
{
    scr_collide();
    
    if (grounded)
    {
        hsp = 0;
        
        if (collectonland)
            magnetised = true;
    }
    
    if (is_outofview3d(x, y, depth) && collectonland)
        magnetised = true;
}

if (!place_meeting(x, y, [par_destructible]) && inblock)
    inblock = false;

if (place_meeting(x, y, collectors) && !(collectonland && !magnetised) && !collected && player_collideable())
    event_user(0);

if (collected)
{
    if (splittimer <= 0)
    {
        if (splittime <= 0 && splitfactor > 1)
        {
            repeat (splitfactor)
                event_user(1);
        }
        else
            event_user(1);
    }
    
    splittimer--;
}

if (sprdest && sprite_animation_end())
{
    if (splitcounter < splitfactor)
        image_speed = 0;
    else
        instance_destroy();
}

if (canmagnetise && !collected && player_collideable())
{
    if (magnetised)
    {
        var _dir = point_direction(x, y, obj_player.x, obj_player.y);
        x += lengthdir_x(magnetspeed, _dir);
        y += lengthdir_y(magnetspeed, _dir);
        magnetspeed++;
    }
    else if (!inblock)
    {
        if (!magnetised && distance_to_point(obj_player.x + (sprite_width / 2), obj_player.y + (sprite_height / 2)) <= magdist)
            magnetised = true;
    }
}
