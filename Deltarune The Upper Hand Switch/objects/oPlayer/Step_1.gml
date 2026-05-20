pastX = x;
pastY = y;

if (move)
    sinceMoved = 0;
else
    sinceMoved++;

if (move)
{
    use_keys();
    
    if (moveTy > 0)
    {
        moveTy--;
        
        if (moveTy == 0)
            doLerp = false;
    }
}
else
{
    res_keys();
    moveTy = 5;
}

if (moveTy > 0)
    res_keys();

if (doLerp)
    dontSetSprites = true;

if (KeyX)
    runTimer++;
else
    runTimer = 0;

if (runTimer > 60)
    walkMult = 2.25;
else if (runTimer > 10)
    walkMult = 2;
else if (runTimer > 0)
    walkMult = 1.5;
else
    walkMult = 1;

walkSpeed = 4 * walkMult;

if (moveTime[0] > 0)
{
    if (moveTime[0] == moveTime[1])
        sprite = moveTime[6];
    
    walkSpeed = moveTime[7];
    moveTime[0]--;
    x += ((moveTime[2] - moveTime[4]) / moveTime[1]);
    y += ((moveTime[3] - moveTime[5]) / moveTime[1]);
    ey = 0;
    
    if (array_contains(seed, "arc1"))
        ey = -dsin((180 / moveTime[1]) * moveTime[0]) * 150;
    
    if (moveTime[0] == 0 && moveTime[8] != -1)
    {
        moveTime[8]();
        ey = 0;
    }
}

if (TapUP && ss == 0)
{
    sprite = sKris_Up;
    ss = 1;
}

if (TapDOWN && ss == 0)
{
    sprite = sKris_Down;
    ss = 1;
}

if (TapLEFT && ss == 0)
{
    sprite = sKris_Left;
    ss = 1;
}

if (TapRIGHT && ss == 0)
{
    sprite = sKris_Right;
    ss = 1;
}

if (KeyUP && !(KeyDOWN || KeyLEFT || KeyRIGHT))
{
    sprite = sKris_Up;
    ss = 1;
}

if (KeyDOWN && !(KeyUP || KeyLEFT || KeyRIGHT))
{
    sprite = sKris_Down;
    ss = 1;
}

if (KeyLEFT && !(KeyUP || KeyDOWN || KeyRIGHT))
{
    sprite = sKris_Left;
    ss = 1;
}

if (KeyRIGHT && !(KeyUP || KeyDOWN || KeyLEFT))
{
    sprite = sKris_Right;
    ss = 1;
}

if (!oPlayer.freeMove)
{
    if (KeyUP)
    {
        if (sprite == sKris_Down)
        {
            sprite = sKris_Up;
            ss = 1;
        }
        
        y -= round(walkSpeed);
        
        if (place_meeting(x, y, oWall) && !(KeyDOWN || KeyLEFT || KeyRIGHT))
        {
            if (!place_meeting(x + 4, y, oWall))
                x += 4;
            
            if (!place_meeting(x - 4, y, oWall))
                x -= 4;
        }
        
        while (place_meeting(x, y, oWall))
        {
            y++;
            
            if (walkSpeed >= 4)
                walkSpeed = 4;
            
            runTimer = 0;
        }
    }
    else if (KeyDOWN)
    {
        if (sprite == sKris_Up)
        {
            sprite = sKris_Down;
            ss = 1;
        }
        
        y += round(walkSpeed);
        
        if (place_meeting(x, y, oWall) && !(KeyUP || KeyLEFT || KeyRIGHT))
        {
            if (!place_meeting(x + 4, y, oWall))
                x += 4;
            
            if (!place_meeting(x - 4, y, oWall))
                x -= 4;
        }
        
        while (place_meeting(x, y, oWall))
        {
            y--;
            
            if (walkSpeed >= 4)
                walkSpeed = 4;
            
            runTimer = 0;
        }
    }
    
    if (KeyLEFT)
    {
        if (sprite == sKris_Right)
        {
            sprite = sKris_Left;
            ss = 1;
        }
        
        x -= round(walkSpeed);
        
        if (place_meeting(x, y, oWall) && !(KeyUP || KeyDOWN || KeyRIGHT))
        {
            if (!place_meeting(x, y + 4, oWall))
                y += 4;
            
            if (!place_meeting(x, y - 4, oWall))
                y -= 4;
        }
        
        while (place_meeting(x, y, oWall))
        {
            x++;
            
            if (walkSpeed >= 4)
                walkSpeed = 4;
            
            runTimer = 0;
        }
    }
    else if (KeyRIGHT)
    {
        if (sprite == sKris_Left)
        {
            sprite = sKris_Right;
            ss = 1;
        }
        
        x += round(walkSpeed);
        
        if (place_meeting(x, y, oWall) && !(KeyUP || KeyDOWN || KeyLEFT))
        {
            if (!place_meeting(x, y + 4, oWall))
                y += 4;
            
            if (!place_meeting(x, y - 4, oWall))
                y -= 4;
        }
        
        while (place_meeting(x, y, oWall))
        {
            x--;
            
            if (walkSpeed >= 4)
                walkSpeed = 4;
            
            runTimer = 0;
        }
    }
}

if (!freeAn)
{
    if (runTimer <= 10)
        image_index += (max(walkSpeed, abs((xprevious - x) / 2) * walkSpeed, abs((yprevious - y) / 2) * walkSpeed) / 60);
    else
        image_index += (max(walkSpeed, abs((xprevious - x) / 2) * walkSpeed, abs((yprevious - y) / 2) * walkSpeed) / 120);
    
    if (x == pastX && y == pastY)
    {
        image_index = 0;
        ss = 0;
        runTimer = 0;
    }
    else
    {
        dontSetSprites = false;
        array_insert(pastXYS, 0, [x, y, sprite, image_index]);
    }
}

depth = -y;

if (TapZ)
{
    with (instance_create_depth(x, y, -9999, oz))
    {
        if (other.sprite == sKris_Up)
            image_index = 0;
        
        if (other.sprite == sKris_Down)
            image_index = 1;
        
        if (other.sprite == sKris_Left)
            image_index = 2;
        
        if (other.sprite == sKris_Right)
            image_index = 3;
    }
}

if (dodgeFrames > 0)
    dodgeFrames--;

if (place_meeting(x, y, oDodgeZone))
{
    if (dodgeAlpha < 1)
        dodgeAlpha += 0.1;
    
    if (!dodgeSoul)
    {
        dodgeSoul = true;
        instance_destroy(oDodgeSoul);
        instance_create_depth(x, y - 28, -9999, oDodgeSoul);
    }
}
else if (dodgeAlpha > 0)
{
    dodgeAlpha -= 0.1;
    instance_destroy(oDodgeSoul);
    dodgeSoul = false;
}

if (dodge_applyShaders)
{
    dodge_applyShaders = false;
    
    function layer_shader_start()
    {
        if (event_type == ev_draw && event_number == 0)
        {
            ext(sPixel, 0, 0, 0, room_width, room_height, undefined, 0, oPlayer.dodgeAlpha * 0.5);
            shader_set(shaRGB);
            shader_set_uniform_f(shader_get_uniform(shaRGB, "col_r"), 0);
            shader_set_uniform_f(shader_get_uniform(shaRGB, "col_g"), 0);
            shader_set_uniform_f(shader_get_uniform(shaRGB, "col_b"), 0);
            shader_set_uniform_f(shader_get_uniform(shaRGB, "col_a"), -1 + oPlayer.dodgeAlpha);
        }
    }
    
    function layer_shader_end()
    {
        if (event_type == ev_draw && event_number == 0)
            shader_reset();
    }
    
    function layer_shader_start2()
    {
        if (event_type == ev_draw && event_number == 0)
        {
            shader_set(shaRGB);
            shader_set_uniform_f(shader_get_uniform(shaRGB, "col_r"), 0);
            shader_set_uniform_f(shader_get_uniform(shaRGB, "col_g"), 0);
            shader_set_uniform_f(shader_get_uniform(shaRGB, "col_b"), 0);
            shader_set_uniform_f(shader_get_uniform(shaRGB, "col_a"), -1 + oPlayer.dodgeAlpha);
        }
    }
    
    var lay_id = layer_get_id("dodge");
    layer_script_begin(lay_id, layer_shader_start);
    layer_script_end(lay_id, layer_shader_end);
    lay_id = layer_get_id("dodgeSprites");
    layer_script_begin(lay_id, layer_shader_start2);
    layer_script_end(lay_id, layer_shader_end);
    lay_id = layer_get_id("dodgeSpritesFront");
    layer_script_begin(lay_id, layer_shader_start2);
    layer_script_end(lay_id, layer_shader_end);
}
