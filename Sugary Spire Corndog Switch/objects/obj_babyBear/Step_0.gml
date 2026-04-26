movespeed = 5;

if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != UnknownEnum.Value_25)
    state = UnknownEnum.Value_25;

if (flash && alarm[2] <= 0)
{
}

if (state != UnknownEnum.Value_7)
    depth = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = 0;

if (ragereset > 0)
    ragereset--;

if (point_in_rectangle(obj_parent_player.x, obj_parent_player.y, x - 200, y - 50, x + 200, y + 50) && obj_parent_player.state != UnknownEnum.Value_72 && obj_parent_player.state != UnknownEnum.Value_57)
{
    if (state != UnknownEnum.Value_22 && state == UnknownEnum.Value_1 && ragereset <= 0)
    {
        state = UnknownEnum.Value_22;
        fmod_event_play(sndCharge);
        sprite_index = baddieSpriteRage;
        
        if (x != obj_parent_player.x)
            image_xscale = sign(obj_parent_player.x - x);
        
        ragereset = 100;
        image_index = 0;
        image_speed = 0.35;
        flash = true;
        alarm[4] = 5;
        create_heat_afterimage(UnknownEnum.Value_0);
    }
}

if (boundbox == 0 && state != UnknownEnum.Value_25)
{
    with (instance_create(x, y, obj_baddie_collisionBox, 
    {
        baddieID: other.id
    }))
    {
        sprite_index = other.sprite_index;
        mask_index = other.mask_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}

if (hitboxcreate == 0 && animation_end(undefined, 10) && state == UnknownEnum.Value_22)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox, 
    {
        ID: other.id
    }))
    {
        ID = other.id;
        image_xscale = other.image_xscale;
        image_index = other.image_index;
        depth = -1;
    }
}

event_inherited();
