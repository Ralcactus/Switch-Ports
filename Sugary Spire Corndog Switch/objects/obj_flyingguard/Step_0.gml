if (state == UnknownEnum.Value_18)
{
    if (!instance_exists(sightID) && !alarmed)
    {
        sightID = instance_create(x, y, obj_guardhitbox);
        sightID.ID = id;
    }
    
    baddieSpriteWalk = alarmed ? spr_guard_run : spr_guard;
    
    if (state == UnknownEnum.Value_18 && alarmed)
        movespeed = 4;
    
    if (alarm[3] > 0)
        hsp = 0;
}

if (state == UnknownEnum.Value_4 || state == UnknownEnum.Value_8 || state == UnknownEnum.Value_9 || state == UnknownEnum.Value_7 || alarmed)
{
    alarm[3] = -1;
    
    if (instance_exists(sightID))
        instance_destroy(sightID);
}

if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != UnknownEnum.Value_25)
    state = UnknownEnum.Value_25;

if (flash && alarm[2] <= 0)
{
}

if (state != UnknownEnum.Value_7)
    depth = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = 0;

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

event_inherited();
scr_scareenemy();
