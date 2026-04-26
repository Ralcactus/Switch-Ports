if (state == UnknownEnum.Value_1)
{
    if (y > ystart && !scr_solid(x, y - 1))
        y--;
    else if (y < ystart && !scr_solid(x, y + 1))
        y++;
}

if (state == UnknownEnum.Value_4 || state == UnknownEnum.Value_5)
{
    grav = 0.5;
}
else
{
    grav = 0;
    vsp = 0;
}

if (state != UnknownEnum.Value_7)
    depth = 0;

if (hitboxcreate == 0 && state == UnknownEnum.Value_2 && sprite_index == spr_swed_charge)
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
    }
}

if (sprite_index == spr_swed_chargestart && floor(image_index) == (image_number - 1))
{
    sprite_index = spr_swed_charge;
    movespeed = 10;
}

bombreset = max(bombreset - 1, 0);

if (obj_parent_player.bushDetection == 0 && ((obj_parent_player.x > (x - 400) && obj_parent_player.x < (x + 400)) && (y <= (obj_parent_player.y + 60) && y >= (obj_parent_player.y - 60))) && state == UnknownEnum.Value_1 && bombreset == 0)
{
    if (state != UnknownEnum.Value_2 || state != UnknownEnum.Value_4)
        state = UnknownEnum.Value_2;
    
    if (state == UnknownEnum.Value_2 && sprite_index != spr_swed_charge && sprite_index != baddieSpriteScared)
    {
        sprite_index = spr_swed_chargestart;
        fmod_event_play(sndCharge);
        image_index = 0;
        image_xscale = sign(obj_parent_player.x - x);
        bombreset = 250;
    }
}

if (state == UnknownEnum.Value_2 && place_meeting(x + 1, y, obj_solid) && vsp < -18)
{
    state = UnknownEnum.Value_4;
    vsp++;
    sprite_index = baddieSpriteStun;
    baddieStunTimer = 100;
}

if (state == UnknownEnum.Value_4 || state == UnknownEnum.Value_1)
    movespeed = 0;

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
scr_scareenemy();
