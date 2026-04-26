movespeed = 0;

if (!instance_exists(obj_cardboardgummy) && ((obj_parent_player.x > (x - 400) && obj_parent_player.x < (x + 400)) && (y <= (obj_parent_player.y + 60) && y >= (obj_parent_player.y - 60))) && sprite_index != spr_cardcherry_getup && sprite_index != spr_cardcherry_idle)
{
    if (sprite_index != spr_cardcherry_getup)
    {
        image_index = 0;
        sprite_index = spr_cardcherry_getup;
    }
}

if (floor(image_index) == (image_number - 1) && sprite_index == spr_cardcherry_getup)
{
    sprite_index = spr_cardcherry_idle;
    didthingflag = 1;
}

if (didthingflag == 1 && sprite_index == spr_cardboardcherry)
    sprite_index = spr_cardcherry_idle;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    birdCreated = 0;

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
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}

if (didthingflag == 1)
    sprite_index = spr_cardcherry_idle;
else if (didthingflag == 0 && sprite_index != spr_cardcherry_getup)
    sprite_index = spr_cardboardcherry;

event_inherited();
