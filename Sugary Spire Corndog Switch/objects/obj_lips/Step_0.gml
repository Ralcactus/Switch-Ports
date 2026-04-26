var pl = obj_parent_player;

if (point_in_rectangle(pl.x, pl.y, x - 500, y - 300, x + 500, y + 300))
    suckPenis = true;
else
    suckPenis = false;

if (suckPenis == true)
{
    with (pl)
    {
        if (state == UnknownEnum.Value_78 || state == UnknownEnum.Value_79 || state == UnknownEnum.Value_81)
        {
            sprite_index = spr_bump;
            state = UnknownEnum.Value_67;
            
            with (instance_create(x, y, obj_dogMount))
                state = 1;
        }
    }
}

if (place_meeting(x, y, pl) && suckPenis == true)
{
    with (instance_nearest(x, y, obj_dogMount))
    {
        state = 0;
        image_blend = c_white;
    }
    
    instance_destroy();
}
