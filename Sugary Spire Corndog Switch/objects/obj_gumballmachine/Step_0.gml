event_inherited();
bombreset = max(bombreset - 1, 0);

if (state != UnknownEnum.Value_6 && bombreset <= 0)
{
    if (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_0)
    {
        image_index = 0;
        state = UnknownEnum.Value_6;
        sprite_index = spr_throw;
    }
}

if (flash && alarm[2] <= 0)
{
}

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
