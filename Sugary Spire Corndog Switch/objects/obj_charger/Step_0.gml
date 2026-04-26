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

scr_scareenemy();
event_inherited();
var targetplayer = instance_nearest(x, y, obj_parent_player);

if (x != targetplayer.x && grounded)
{
    if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20)))
    {
        if (state == UnknownEnum.Value_1)
        {
            state = UnknownEnum.Value_2;
            substate = 0;
            movespeed = 0;
            image_xscale = sign(obj_parent_player.x - x);
            sprite_index = spr_banana_chargestart;
            image_index = 0;
            fmod_event_play(sndCharge);
        }
    }
}

if (sprite_index == spr_banana_chargestart && floor(image_index) == (image_number - 1))
    sprite_index = spr_banana_charge;

if (hitboxcreate == 0 && state == UnknownEnum.Value_2 && sprite_index == spr_banana_charge)
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
        sprite_index = spr_chargershitbox;
        mask_index = spr_chargershitbox;
    }
}

if (state == UnknownEnum.Value_1)
{
    movespeed = 0;
    hsp = 0;
}
