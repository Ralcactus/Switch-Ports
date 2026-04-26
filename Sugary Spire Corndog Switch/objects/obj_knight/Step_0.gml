if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != UnknownEnum.Value_25)
    state = UnknownEnum.Value_25;

if (hitboxcreate == 0 && state == UnknownEnum.Value_1)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox, 
    {
        ID: other.id
    }))
    {
        ID = other.id;
        sprite_index = spr_swordhitbox;
        mask_index = sprite_index;
        image_xscale = other.image_xscale;
        image_index = other.image_index;
        depth = -1;
    }
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
