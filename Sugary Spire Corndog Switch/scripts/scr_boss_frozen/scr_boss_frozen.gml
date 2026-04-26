function scr_boss_frozen()
{
    if (global.freezeframe == false)
    {
        state = frozenState;
        sprite_index = frozenSpriteIndex;
        image_index = frozenImageIndex;
        image_speed = frozenImageSpeed;
        movespeed = frozenMoveSpeed;
        grav = frozenGrav;
        hsp = frozenHsp;
        vsp = frozenVsp;
        
        if (markedForDeath)
        {
            camera_shake_add(3, 3);
            
            repeat (2)
            {
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_baddieGibs);
            }
            
            with (obj_bosscontroller)
                event_user(0);
            
            markedForDeath = 0;
        }
    }
    else
    {
        vsp = 0;
        hsp = 0;
        grav = 0;
        image_speed = 0;
        movespeed = 0;
    }
}
