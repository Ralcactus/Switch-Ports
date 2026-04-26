function scr_enemy_turnAround()
{
    if (object_index == obj_knight)
    {
        state = UnknownEnum.Value_3;
        hsp = 0;
    }
    else
    {
        image_xscale *= -1;
        hsp = 0;
    }
}

function scr_enemy_walk()
{
    if (grounded)
        hsp = image_xscale * movespeed;
    else
        hsp = 0;
    
    scr_conveyorBeltKinematics();
    image_speed = 0.35;
    
    if (grounded && sprite_index != spr_minippcnland && sprite_index != spr_minippcnspawn)
        sprite_index = baddieSpriteWalk;
    
    if (scr_solid(x + image_xscale, y, true) || (place_meeting(x + image_xscale, y, obj_clutterCone) && !place_meeting(x, y, obj_clutterCone)))
        scr_enemy_turnAround();
    
    if (place_meeting(x + image_xscale, y, obj_hallway))
    {
        var hallway_direction = -sign(instance_place(x + sign(image_xscale), y, obj_hallway).image_xscale);
        
        if (sign(other.image_xscale) != hallway_direction)
            scr_enemy_turnAround();
    }
    
    var _bbox_side = (image_xscale >= 1) ? bbox_right : bbox_left;
    
    if (grounded && movespeed > 0 && !scr_solid(_bbox_side + image_xscale, y + 31) && !scr_slopePlatform(_bbox_side + image_xscale, y + 31))
    {
        if (object_index == obj_sluggy && (scr_solid(_bbox_side + image_xscale, y + 32) || scr_solid(_bbox_side + image_xscale, y + 64) || scr_solid(_bbox_side + image_xscale, y + 79)))
            vsp = -3;
        else
            scr_enemy_turnAround();
    }
}
