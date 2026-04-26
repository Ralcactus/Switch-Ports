if (state != UnknownEnum.Value_7)
    depth = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = 0;

if (boundbox == 0)
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

if (hitboxcreate == 0 && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_1) && obj_parent_player.state != UnknownEnum.Value_65)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_taserhitbox))
        ID = other.id;
}

if (state == UnknownEnum.Value_4)
    hitboxcreate = 0;

if (x != obj_parent_player.x)
{
    movespeed = 3;
    image_xscale = sign(obj_parent_player.x - x);
}
