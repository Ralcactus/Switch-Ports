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

event_inherited();
scr_scareenemy();

if ((place_meeting(x + 1, y, obj_parent_player) && sprite_index == spr_minippcnspawn) || (place_meeting(x - 1, y, obj_parent_player) && sprite_index == spr_minippcnspawn))
    scr_hurtplayer();

if (!grounded && sprite_index == spr_minippcnspawn)
    hsp = 2 * image_xscale;

if (state == UnknownEnum.Value_1)
{
    if (!grounded && object_index == obj_minipopcorn)
        sprite_index = spr_minippcnspawn;
    
    if (grounded && sprite_index == spr_minippcnspawn)
    {
        sprite_index = spr_minippcnland;
        image_index = 0;
    }
    
    if (animation_end() && sprite_index == spr_minippcnland)
        sprite_index = baddieSpriteWalk;
}
