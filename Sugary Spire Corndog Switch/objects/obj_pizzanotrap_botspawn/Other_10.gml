if (instance_exists(enemyID))
    exit;

var enemy = obj_pizzanobot;

if (flying)
    enemy = obj_pizzanobot_flying;

if (shooting)
    enemy = obj_pizzanobot_shotter;

with (instance_create(x, y, enemy))
{
    importantEnemy = other.importantEnemy;
    pizzano = true;
    other.enemyID = id;
    image_xscale = other.image_xscale;
    instance_create(x, y, obj_poofeffect);
    
    if (face_obj(obj_parent_player) != 0)
        image_xscale = face_obj(obj_parent_player);
    
    hasSquashedX = true;
    squashValueX = 0;
    
    if (!scr_enemyDestroyableCheck(x, y))
    {
        invincibleBaddie = false;
        visible = true;
        flash = true;
        
        if (object_index != obj_pizzanobot_flying)
            state = UnknownEnum.Value_4;
        
        sprite_index = baddieSpriteStun;
        image_index = 0;
    }
}

if (importantEnemy)
    instance_destroy();
