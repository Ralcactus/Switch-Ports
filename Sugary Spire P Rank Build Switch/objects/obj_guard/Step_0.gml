if (flying == true)
{
    grav = 0;
    movespeed = 0;
}

if (state == baddiestate.walk)
{
    if (!instance_exists(sightID) && !alarmed)
    {
        sightID = instance_create(x, y, obj_guardhitbox);
        sightID.ID = id;
    }
    
    walkspr = alarmed ? spr_guard_run : spr_guard;
    
    if (state == baddiestate.walk && alarmed)
        movespeed = 4;
    
    if (alarm[3] > 0)
        hsp = 0;
}

if (state == baddiestate.stun || state == baddiestate.scared || state == baddiestate.frozen || state == baddiestate.grabbed || alarmed)
{
    alarm[3] = -1;
    
    if (instance_exists(sightID))
        instance_destroy(sightID);
}

if (point_in_circle(x, y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != baddiestate.inhaled)
    state = baddiestate.inhaled;

if (state == baddiestate.stun && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != baddiestate.stun && state != baddiestate.frozen)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != baddiestate.grabbed)
    depth = 0;

if (state != baddiestate.stun && state != baddiestate.frozen)
    thrown = 0;

if (boundbox == 0 && state != baddiestate.inhaled)
{
    with (instance_create(x, y, obj_baddiecollisionbox, 
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

scr_commonenemy();
scr_scareenemy();
var _x = x + (sign(image_xscale) * 150);

if (stationary == true)
    movespeed = 0;
