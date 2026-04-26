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

event_inherited();

if (state != UnknownEnum.Value_6)
    scr_scareenemy();

bombreset = max(bombreset - 1, 0);
ragereset = max(ragereset - 1, 0);

if (point_in_rectangle(obj_parent_player.x, obj_parent_player.y, x - 200, y - 50, x + 200, y + 50) && obj_parent_player.state != UnknownEnum.Value_72 && obj_parent_player.state != UnknownEnum.Value_57)
{
    if (state != UnknownEnum.Value_6 && state == UnknownEnum.Value_1 && bombreset <= 0)
    {
        image_index = 0;
        flash = true;
        create_heat_afterimage(UnknownEnum.Value_0);
        state = UnknownEnum.Value_6;
        
        if (x != obj_parent_player.x)
            image_xscale = sign(obj_parent_player.x - x);
        
        sprite_index = spr_throw;
    }
}
