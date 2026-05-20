if (place_meeting(x, y, oPlayer) || on)
{
    oPlayer.move = false;
    on = true;
    time++;
    
    if (time == 10)
    {
        oPlayer.x = _x;
        oPlayer.y = _y;
        oPlayer.draw = true;
        oPlayer.pastXYS = [];
        
        repeat (72)
        {
            array_insert(oPlayer.pastXYS, 0, [_x, _y, oPlayer.sprite, 0]);
            op.fade = 11;
        }
        
        oPlayer.move = true;
        room_goto(_room);
        oPlayer.image_xscale = 1;
        oPlayer.image_speed = 0;
        oPlayer.freeAn = false;
        oPlayer.dodge_applyShaders = true;
        oPlayer.dodgeAlpha = 0;
        
        if (func != -1)
        {
            func();
            func = -1;
        }
    }
}
