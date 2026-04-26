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

bombreset = max(bombreset - 1, 0);

if (((obj_parent_player.x > (x - 50) && obj_parent_player.x < (x + 50)) && (y <= (obj_parent_player.y + 300) && y >= (obj_parent_player.y - 300))) && obj_parent_player.state != UnknownEnum.Value_87 && obj_parent_player.state != UnknownEnum.Value_96 && obj_parent_player.state != UnknownEnum.Value_72 && obj_parent_player.state != UnknownEnum.Value_97)
{
    if (state != UnknownEnum.Value_6 && bombreset <= 0 && obj_parent_player.state != UnknownEnum.Value_87)
    {
        if (state == UnknownEnum.Value_18)
        {
            image_index = 0;
            state = UnknownEnum.Value_6;
            
            if (x != obj_parent_player.x)
                image_xscale = sign(obj_parent_player.x - x);
            
            sprite_index = spr_throw;
        }
    }
}

if (state == UnknownEnum.Value_1)
    state = UnknownEnum.Value_18;

event_inherited();
scr_scareenemy();
