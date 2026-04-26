if (instance_exists(enemyID))
    exit;

with (instance_create(x, y, enemy))
{
    importantEnemy = other.importantEnemy;
    pizzanoEnemy = true;
    paletteSelect = 2;
    other.enemyID = id;
    instance_create(x, y, obj_poofeffect);
    
    if (face_obj(obj_parent_player) != 0)
        image_xscale = face_obj(obj_parent_player);
    
    hasSquashedX = true;
    squashValueX = 0;
    baddieStunTimer = 20;
    
    if (!scr_enemyDestroyableCheck(x, y))
    {
        invincibleBaddie = false;
        visible = true;
        flash = true;
        state = UnknownEnum.Value_4;
        sprite_index = baddieSpriteStun;
        image_index = 0;
    }
}

if (importantEnemy)
    instance_destroy();
