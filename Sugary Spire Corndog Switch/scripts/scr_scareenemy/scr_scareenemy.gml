function scr_scareenemy()
{
    if (global.freezeframe)
        exit;
    
    var player_object = get_nearestPlayer(x, y);
    
    if (!jumpedFromBlock && point_in_rectangle(x, y, player_object.x - 400, player_object.y - 60, player_object.x + 400, player_object.y + 60) && (player_object.state == UnknownEnum.Value_65 || ((player_object.state == UnknownEnum.Value_78 && object_index != obj_fancypancake) && abs(movespeed) >= 12) || player_object.state == UnknownEnum.Value_79 || (player_object.movespeed >= 10 && player_object.state == UnknownEnum.Value_100) || (player_object.character == UnknownEnum.Value_3 && player_object.gumbobBounceCounter >= 3)))
    {
        if (state != UnknownEnum.Value_8 && state != UnknownEnum.Value_5)
        {
            state = UnknownEnum.Value_8;
            sprite_index = baddieSpriteScared;
            
            if (x != player_object.x)
                image_xscale = getFacingDirection(x, player_object.x);
            
            hsp = 0;
            
            if (grav != 0 && grounded)
                vsp = -3;
            
            image_index = 0;
        }
        
        var max_buf = 80;
        var min_buf = 50;
        baddieScareBuffer = clamp(baddieScareBuffer++, min_buf, max_buf);
    }
    
    baddieScareBuffer--;
    
    if (scare_jump_buffer > 0)
        scare_jump_buffer--;
    
    if (baddieScareBuffer <= 0 && state == UnknownEnum.Value_8)
    {
        state = UnknownEnum.Value_1;
        sprite_index = baddieSpriteWalk;
        baddieScareBuffer = 0;
        scare_jump = false;
    }
}
