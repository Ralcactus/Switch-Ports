if (prevhp != eliteHP)
{
    if (eliteHP < prevhp)
    {
        touchedground = 0;
        flickertime = 11;
        alarm[6] = 5;
    }
    
    prevhp = eliteHP;
}

if (state == UnknownEnum.Value_4 && baddieStunTimer > 50 && birdCreated == false)
{
    birdCreated = true;
    
    with (instance_create(x, y, obj_enemyBirdEffect))
        ID = other.id;
}

if (flash && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

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

if (bombreset > 0)
    bombreset--;

if (ragereset > 0)
    ragereset--;

invincibleBaddie = flickertime > 0;
