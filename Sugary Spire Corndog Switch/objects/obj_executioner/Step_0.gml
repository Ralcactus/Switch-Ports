if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = 0;

var target_player = instance_nearest(x, y, obj_parent_player);

if (((target_player.x > (x - 400) && target_player.x < (x + 400)) && (y <= (target_player.y + 60) && y >= (target_player.y - 60))) && sign(target_player.x - x) == sign(image_xscale) && state == UnknownEnum.Value_1)
{
    state = UnknownEnum.Value_2;
    sprite_index = spr_executionerCharge;
    image_index = 0;
}

if (state == UnknownEnum.Value_4)
    movespeed = 0;
else if (state == UnknownEnum.Value_1)
    movespeed = 1;
else if (state == UnknownEnum.Value_2)
    movespeed = 7;

event_inherited();

if (state != UnknownEnum.Value_2)
    scr_scareenemy();

if (!hitboxcreate && state == UnknownEnum.Value_2)
{
    hitboxcreate = true;
    
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
