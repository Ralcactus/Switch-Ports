switch (state)
{
    case UnknownEnum.Value_0:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_3:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_1:
        scr_enemy_walk();
        break;
    
    case UnknownEnum.Value_5:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_2:
        scr_enemy_charge();
        break;
    
    case UnknownEnum.Value_4:
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_9:
        scr_enemy_frozen();
        break;
    
    case UnknownEnum.Value_10:
        hsp = 0;
        vsp = 0;
        break;
    
    case UnknownEnum.Value_18:
        scr_enemy_float();
        break;
    
    case UnknownEnum.Value_19:
        scr_enemy_thief();
        break;
    
    case UnknownEnum.Value_11:
        scr_enemy_panicWait();
        break;
    
    case UnknownEnum.Value_12:
        scr_enemy_secretWait();
        break;
    
    case UnknownEnum.Value_6:
        scr_enemy_throw();
        break;
    
    case UnknownEnum.Value_7:
        scr_enemy_grabbed();
        break;
    
    case UnknownEnum.Value_8:
        scr_enemy_scared();
        break;
    
    case UnknownEnum.Value_13:
        scr_enemy_cherrywait();
        break;
    
    case UnknownEnum.Value_14:
        scr_enemy_charcherry();
        break;
    
    case UnknownEnum.Value_16:
        scr_enemy_slugjump();
        break;
    
    case UnknownEnum.Value_17:
        scr_enemy_slugparry();
        break;
    
    case UnknownEnum.Value_20:
        scr_enemy_eyescreamwait();
        break;
    
    case UnknownEnum.Value_21:
        scr_enemy_eyescream();
        break;
    
    case UnknownEnum.Value_22:
        scr_enemy_rage();
        break;
}

if (baddieCollisionBoxEnabled)
    scr_baddieCollisionBox();

if (y > (room_height + 64))
    instance_destroy();

if (state != UnknownEnum.Value_8 && state != UnknownEnum.Value_9)
    baddieScareBuffer = 0;

if (tauntBuffer)
{
    if (!instance_exists(tauntBufferEffect))
    {
        with (instance_create(x, y, obj_baddieAngryCloud, 
        {
            baddieID: id
        }))
            other.tauntBufferEffect = id;
    }
    
    if (!global.freezeframe)
    {
        if (obj_parent_player.state != UnknownEnum.Value_42 && obj_parent_player.state != UnknownEnum.Value_92 && state != UnknownEnum.Value_6)
        {
            tauntBuffer = false;
            bombreset = 0;
            ragereset = 0;
            baddieStunTimer = 0;
            jumptimer = 0;
            baddieScareBuffer = 0;
        }
    }
}

if (state == UnknownEnum.Value_4 && baddieStunTimer >= 50 && !birdCreated && object_index != obj_coneboy && object_index != obj_cherrycardboard)
{
    birdCreated = true;
    instance_create(x, y - 40, obj_enemyBirdEffect, 
    {
        baddieID: id
    });
}

if (place_meeting_solid(x, y) && state == UnknownEnum.Value_5)
    instance_destroy();

if (baddieInvincibilityBuffer > 0 && global.freezeframe == false)
    baddieInvincibilityBuffer--;

if (global.freezeframe && state != UnknownEnum.Value_9)
{
    frozenState = state;
    frozenSpriteIndex = sprite_index;
    frozenImageIndex = image_index;
    frozenImageSpeed = image_speed;
    frozenMoveSpeed = movespeed;
    frozenGrav = grav;
    frozenHsp = hsp;
    frozenVsp = vsp;
    state = UnknownEnum.Value_9;
}

if (markedForDeath && !global.freezeframe && object_index != obj_iceblock)
    instance_destroy();

if (flash && alarm[2] <= 0)
    alarm[2] = room_speed * 0.15;

if (state != UnknownEnum.Value_7)
    depth = 0;
