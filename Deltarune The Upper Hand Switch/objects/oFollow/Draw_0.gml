if (!oPlayer.freeMove)
{
    if (oPlayer.x == oPlayer.pastX && oPlayer.y == oPlayer.pastY)
        image_ = 0;
    
    if (numb == 1)
    {
        if (sprite_index == sKris_Up)
            sprite = sSusie_Up;
        
        if (sprite_index == sKris_Down)
            sprite = sSusie_Down;
        
        if (sprite_index == sKris_Left)
            sprite = sSusie_Left;
        
        if (sprite_index == sKris_Right)
            sprite = sSusie_Right;
    }
    
    if (numb == 2)
    {
        if (sprite_index == sKris_Up)
            sprite = sRalsei_Up;
        
        if (sprite_index == sKris_Down)
            sprite = sRalsei_Down;
        
        if (sprite_index == sKris_Left)
            sprite = sRalsei_Left;
        
        if (sprite_index == sKris_Right)
            sprite = sRalsei_Right;
    }
}

if (oPlayer.draw && op.drawFollow)
    ext(sprite, image_, x, y);
