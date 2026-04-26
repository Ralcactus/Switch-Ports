function scr_enemy_turn()
{
    sprite_index = baddieSpriteTurn;
    image_speed = 0.35;
    hsp = 0;
    scr_conveyorBeltKinematics();
    
    if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_0;
        image_index = 0;
        sprite_index = baddieSpriteIdle;
        image_xscale *= -1;
    }
}
