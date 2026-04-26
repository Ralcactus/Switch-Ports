if (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_0)
    movespeed = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = false;

event_inherited();
bombreset = max(bombreset - 1, 0);
var target_player = instance_nearest(x, y, obj_parent_player);

if (x != target_player.x && state != UnknownEnum.Value_6 && bombreset <= 0 && grounded)
{
    if (distance_to_object(target_player) < 350)
    {
        if (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_1)
        {
            image_index = 0;
            sprite_index = spr_throw;
            image_xscale = sign(target_player.x - x);
            state = UnknownEnum.Value_6;
        }
    }
}

if (state != UnknownEnum.Value_6)
    scr_scareenemy();
