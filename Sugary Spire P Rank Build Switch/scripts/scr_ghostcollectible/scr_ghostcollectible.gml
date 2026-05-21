function scr_ghostcollectible(_candysona = false)
{
    var q = noone;
    var b = id;
    
    with (obj_secretfound)
    {
        q = 
        {
            x: b.xstart,
            y: b.ystart,
            sprite_index: b.sprite_index,
            image_speed: b.image_speed,
            image_number: b.image_number,
            image_alpha: 0.5,
            image_index: 0,
            candysona: _candysona
        };
        trace(q);
        ds_list_add(collectiblelist, q);
    }
    
    return q;
}
