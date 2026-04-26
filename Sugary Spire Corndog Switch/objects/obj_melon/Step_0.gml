if (flash && alarm[2] <= 0)
{
}

if (bombreset > 0)
{
    bombreset--;
}
else if (state == UnknownEnum.Value_1)
{
    state = UnknownEnum.Value_17;
    substate = 0;
    tauntTimer = 40;
    
    with (instance_create(x, y, obj_baddieTauntEffect))
        image_speed = 0.25;
    
    sprite_index = spr_meloncooltaunt;
    image_index = choose(0, 1, 2);
}

if (hitboxcreate == 0 && state == UnknownEnum.Value_17)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox, 
    {
        ID: other.id
    }))
    {
        ID = other.id;
        sprite_index = spr_swordhitbox2;
        image_xscale = other.image_xscale;
        depth = -1;
    }
}

if (state != UnknownEnum.Value_7)
    depth = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = 0;

if (boundbox == 0 && state != UnknownEnum.Value_25 && state != UnknownEnum.Value_17)
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
