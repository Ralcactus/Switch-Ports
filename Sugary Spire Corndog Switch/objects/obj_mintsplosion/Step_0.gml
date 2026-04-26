if (bombreset > 0)
    bombreset--;

event_inherited();
scr_scareenemy();

if (((obj_parent_player.x > (x - 400) && obj_parent_player.x < (x + 400)) && (y <= (obj_parent_player.y + 60) && y >= (obj_parent_player.y - 60))) && obj_parent_player.state != UnknownEnum.Value_87 && obj_parent_player.state != UnknownEnum.Value_96 && obj_parent_player.state != UnknownEnum.Value_72 && obj_parent_player.state != UnknownEnum.Value_97)
{
    if (state != UnknownEnum.Value_8 && state != UnknownEnum.Value_6 && bombreset <= 0 && obj_parent_player.state != UnknownEnum.Value_87)
    {
        if (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_0)
        {
            image_index = 0;
            state = UnknownEnum.Value_6;
            
            if (x != obj_parent_player.x)
                image_xscale = sign(obj_parent_player.x - x);
            
            sprite_index = spr_throw;
        }
    }
}

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
