use_keys();

if (oPlayer.move)
{
    playerXY = [oPlayer.x, oPlayer.y];
    
    with (oJumpTarget)
    {
        if (numb == other.numb)
            other.targetXY = [x + 20, y + 20];
    }
}

if (place_meeting(x, y, oPlayer) && hideSeconds > 0)
    hideSeconds--;

if (place_meeting(x, y, oPlayer) && oPlayer.move && !auto && hideSeconds == 0)
{
    if (alpha < 1)
        alpha += 0.1;
}
else if (alpha > 0)
{
    alpha -= 0.1;
}

if (tapEarly > 0)
    tapEarly--;

if (place_meeting(x, y, oPlayer) && !go && !oPlayer.move && TapZ && !cool)
    tapEarly += 15;

if ((place_meeting(x, y, oPlayer) && !go && (oPlayer.move || auto)) && (TapZ || tapEarly > 0 || auto))
{
    if (cool)
        counter++;
    
    oPlayer.move = false;
    oPlayer.sprite = sKris_Jump;
    oPlayer.image_index = 0;
    oPlayer.image_speed = 0.5;
    oPlayer.freeAn = true;
    go = true;
    time = 0;
    
    if (oPlayer.x < targetXY[0])
        oPlayer.image_xscale = -1;
    else
        oPlayer.image_xscale = 1;
    
    if (!auto)
        snd(snd_smallswing);
    
    if (counter == 1)
    {
        move_char("sock", 20, 40, 0, sSock_Jockey, 0, -2);
        sprite_char("sock", sSock_Jockey, 1, 0, undefined, undefined, -2);
        move_char("ralsei", 20, 700, 320, sRalsei_Right, 0.25, -2);
    }
}

if (go)
{
    alpha = 0;
    time++;
    oPlayer.x = playerXY[0];
    oPlayer.y = playerXY[1];
    oPlayer.x += ((targetXY[0] - playerXY[0]) / delay) * time;
    oPlayer.y += ((targetXY[1] - playerXY[1]) / delay) * time;
    oPlayer.y -= dsin((360 / (delay * 2)) * time) * sinmod;
    
    if (time == delay)
    {
        go = false;
        anim = true;
        time = 0;
        oPlayer.x = targetXY[0] - 3;
        oPlayer.y = targetXY[1];
        oPlayer.image_xscale = 1;
        
        if (counter == 3)
        {
            anim = false;
            coolAnim = true;
            sprite_player(sKris_LandCool, 0);
            oPlayer.image_speed = 0.25;
        }
        else
        {
            sprite_player(sKris_Land, 0);
            oPlayer.image_speed = 1;
        }
        
        snd(snd_wing);
    }
}

if (anim)
{
    time++;
    
    if (time == 3)
        oPlayer.x += 6;
    
    if (time == 5)
        oPlayer.x -= 6;
    
    if (time == 7)
        oPlayer.x += 3;
    
    if (time == 15)
    {
        sprite_player(sKris_Down, 0);
        oPlayer.image_speed = 0;
        oPlayer.image_index = 0;
        oPlayer.x = round(oPlayer.x);
        oPlayer.y = round(oPlayer.y);
        oPlayer.freeAn = false;
        oPlayer.freeMove = false;
        oPlayer.move = true;
        anim = false;
        time = 0;
    }
}

if (coolAnim)
{
    time++;
    
    if (time == 1)
        ow_music_stop();
    
    if (time == 3)
        oPlayer.x += 6;
    
    if (time == 5)
        oPlayer.x -= 6;
    
    if (time == 7)
        oPlayer.x += 3;
    
    if (time == 45)
    {
        move_player(5, 320, 260, sKris_JumpCool, 1);
        snd(snd_jump);
    }
    
    if (time >= 45)
        coolalpha += 0.14285714285714285;
    
    if (time == 50)
    {
        oPlayer.x = -999;
        oPlayer.y = -999;
        room_goto(rSoulTutorial);
    }
}
