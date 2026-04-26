movespeed = 0;

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

if (state == UnknownEnum.Value_1)
    state = UnknownEnum.Value_18;

event_inherited();
scr_scareenemy();

if (state == UnknownEnum.Value_8 || (state == UnknownEnum.Value_4 && !thrown))
{
    hsp = 0;
    vsp = 0;
}
