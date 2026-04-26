if (state != UnknownEnum.Value_22 && state != UnknownEnum.Value_16 && grounded)
    scr_scareenemy();

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

if (hitboxcreate == 0 && (state == UnknownEnum.Value_16 || state == UnknownEnum.Value_22))
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox, 
    {
        ID: other.id
    }))
    {
        ID = other.id;
        image_xscale = other.image_xscale;
        image_index = other.image_index;
        depth = -1;
        
        if (other.state != UnknownEnum.Value_22)
        {
            mask_index = spr_sluggy_jumphitbox;
            sprite_index = spr_sluggy_jumphitbox;
        }
    }
}

if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_8 && state != UnknownEnum.Value_4 && state != UnknownEnum.Value_7 && state != UnknownEnum.Value_14 && state != UnknownEnum.Value_16 && state != UnknownEnum.Value_17)
{
    idletimer = max(idletimer - 1, 0);
    jumptimer = max(jumptimer - 1, 0);
}

var player_present = jumptimer <= 0 && (obj_parent_player.x > (x - 250) && obj_parent_player.x < (x + 250) && y <= (obj_parent_player.y + 200) && y >= (obj_parent_player.y - 16));

if (grounded && (!eliteEnemy || ragereset <= 0) && (player_present || (scr_solid(x + (image_xscale * 32), y, true) && !scr_solid(x + (image_xscale * 32), y - 100, true) && !scr_slope_ext(x + (image_xscale * 32), y) && !scr_slope_ext(x, y + 1))))
{
    if (state == UnknownEnum.Value_1)
    {
        if (player_present)
            image_xscale = sign(obj_parent_player.x - x);
        
        state = UnknownEnum.Value_16;
        ragereset = 200;
        sprite_index = spr_sluggy_jumpstart;
        image_index = 0;
        movespeed = 0;
        hsp = 0;
        vsp = 0;
    }
}

event_inherited();
