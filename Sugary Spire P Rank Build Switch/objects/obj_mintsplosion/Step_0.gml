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

if (bombreset > 0)
    bombreset--;

scr_commonenemy();
scr_scareenemy();

if (((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && obj_player.state != states.cotton && obj_player.state != states.cottondrill && obj_player.state != states.door && obj_player.state != states.cottonroll && obj_player.state != states.changing)
{
    if (state != baddiestate.scared && state != baddiestate.Throw && bombreset <= 0 && obj_player.state != states.cotton)
    {
        if (state == baddiestate.walk || state == baddiestate.idle)
        {
            image_index = 0;
            state = baddiestate.Throw;
            
            if (x != obj_player.x)
                image_xscale = -sign(x - obj_player.x);
            
            sprite_index = spr_throw;
        }
    }
}

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
