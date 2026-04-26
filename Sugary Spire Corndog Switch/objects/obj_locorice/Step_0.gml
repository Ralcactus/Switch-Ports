if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != UnknownEnum.Value_25)
    state = UnknownEnum.Value_25;

if (flash && alarm[2] <= 0)
{
}

if (hitboxcreate == 0 && active)
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

if (state != UnknownEnum.Value_7)
    depth = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = 0;

if (active)
{
    event_inherited();
    scr_scareenemy();
}

if (state == UnknownEnum.Value_0 && active)
    state = UnknownEnum.Value_14;
