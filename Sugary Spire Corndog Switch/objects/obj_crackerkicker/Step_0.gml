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

if (state != UnknownEnum.Value_6)
    scr_scareenemy();

bombreset = max(bombreset - 1, 0);
ragereset = max(ragereset - 1, 0);
var target_player = instance_nearest(x, y, obj_parent_player);

if (x != target_player.x && state != UnknownEnum.Value_6 && target_player.state != UnknownEnum.Value_95 && bombreset <= 0 && grounded)
{
    if (target_player.x > (x - 80) && target_player.x < (x + 80) && y <= (target_player.y + 100) && y >= (target_player.y - 100))
    {
        if (state == UnknownEnum.Value_1)
        {
            image_index = 0;
            sprite_index = spr_throw;
            image_xscale = sign(target_player.x - x);
            state = UnknownEnum.Value_6;
        }
    }
}
