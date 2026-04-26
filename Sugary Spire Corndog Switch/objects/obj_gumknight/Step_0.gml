if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != UnknownEnum.Value_25)
    state = UnknownEnum.Value_25;

var target_player = obj_player1;

if (x != target_player.x && state != UnknownEnum.Value_6 && target_player.state != UnknownEnum.Value_95 && bombreset <= 0 && grounded)
{
    if (target_player.x > (x - 200) && target_player.x < (x + 200) && y <= (target_player.y + 100) && y >= (target_player.y - 100))
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

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_8 && state != UnknownEnum.Value_6)
    bombreset -= 0.5;

event_inherited();
scr_scareenemy();
