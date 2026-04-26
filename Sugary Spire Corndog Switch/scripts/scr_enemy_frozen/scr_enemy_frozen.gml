function scr_enemy_frozen()
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
