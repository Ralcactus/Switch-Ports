if (state != baddiestate.rage && state != baddiestate.slugjump && grounded && !pizzano)
    scr_scareenemy();

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

if (boundbox == 0)
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

if (hitboxcreate == 0 && (state == baddiestate.slugjump || state == baddiestate.rage))
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
        
        if (other.state != baddiestate.rage)
        {
            mask_index = spr_sluggy_jumphitbox;
            sprite_index = spr_sluggy_jumphitbox;
        }
    }
}

if (state != baddiestate.idle && state != baddiestate.scared && state != baddiestate.stun && state != baddiestate.grabbed && state != baddiestate.cherryactive && state != baddiestate.slugjump && state != baddiestate.slugparry && idletimer > 0)
    idletimer--;

if (state != baddiestate.idle && state != baddiestate.scared && state != baddiestate.stun && state != baddiestate.grabbed && state != baddiestate.cherryactive && state != baddiestate.slugjump && state != baddiestate.slugparry && jumptimer > 0)
    jumptimer--;

var _isplayerpresent = jumptimer <= 0 && (obj_player.x > (x - 250) && obj_player.x < (x + 250) && y <= (obj_player.y + 200) && y >= (obj_player.y - 16));

if (grounded && (!use_heat() || ragereset <= 0) && (_isplayerpresent || (scr_solid(x + (image_xscale * 32), y, true) && !scr_solid(x + (image_xscale * 32), y - 100, true) && !scr_slope_ext(x + (image_xscale * 32), y) && !scr_slope_ext(x, y + 1))))
{
    if (state == baddiestate.walk)
    {
        if (!use_heat())
        {
            if (_isplayerpresent)
                image_xscale = -sign(x - obj_player.x);
            
            state = baddiestate.slugjump;
            ragereset = 200;
            sprite_index = spr_sluggy_jumpstart;
            image_index = 0;
            movespeed = 0;
            hsp = 0;
            vsp = 0;
        }
        else
        {
            if (_isplayerpresent)
                image_xscale = -sign(x - obj_player.x);
            
            state = baddiestate.rage;
            ragereset = 100;
            sprite_index = spr_cotton_attack;
            image_index = 0;
            movespeed = 8;
            vsp = 0;
        }
    }
}

scr_commonenemy();
