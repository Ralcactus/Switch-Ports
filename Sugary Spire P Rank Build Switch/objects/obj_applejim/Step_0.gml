bashcooldown--;

if (state == baddiestate.walk)
    movespeed = 0;

if (state == baddiestate.applejimBash)
    movespeed = 5;

if (bashcooldown == 0)
{
    sprite_index = spr_applejim_charge;
    state = baddiestate.applejimBash;
    bashcooldown = 200;
}

if (state == baddiestate.stun && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (hp == 0)
    instance_destroy();

if (state != baddiestate.stun && state != baddiestate.frozen)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != baddiestate.grabbed)
    depth = 0;

instance_destroy(obj_baddiethrow);
instance_destroy(obj_swordhitbox);
instance_destroy(obj_slaphitbox);
