op.parameter = [0, 0, 0, 0];
op.camMode = 0;
op.camX = 0;
op.camY = 1490;
res_i();
i1 = 1;
i2 = false;
i3 = [];

funcStep = function()
{
    i++;
    
    if (op.camY > 0)
    {
        op.camY -= 6;
        
        if (op.camY < 0)
            op.camY = 0;
    }
    
    if (op.camY == 0 && !i2)
    {
        i2 = true;
        i = 0;
    }
    
    if (i2)
    {
        if (i == 0)
        {
            create_char("s", 175, 335, sSock_Left, 0);
            char("s").image_alpha = 0;
            move_char("s", 20, 130, 370, sSock_Left, 0, function()
            {
                other.image_index = 1;
                other.shake = 3;
            }, ["arc2"]);
            snd(snd_jump);
        }
        
        if (i < 5)
            char("s").image_alpha += 0.2;
        
        if (i == 55)
            sprite_char("s", sSock_Right, 1, 0);
        
        if (i == 80)
            move_char("s", 40, 240, 420, sSock_Right, 1);
        
        if (i == 110)
        {
            move_char("s", 35, 320, 420, sSock_Right, 1, function()
            {
                other.image_speed = 0;
                other.sprite_index = sSock_Up;
                other.image_index = 1;
            });
        }
        
        if (i == 200)
            sprite_char("s", sSock_Sprites, 7, 0);
        
        if (i == 230)
            sprite_char("s", sSock_Sprites, 8, 0);
        
        if (i == 255)
            sprite_char("s", sSock_Sprites, 14, 0);
        
        if (i == 285)
            sprite_char("s", sSock_Selftalk, 0, 0);
        
        if (i == 345)
            move_char("s", 120, 320, 380, sSock_Up, 0.45);
        
        if (i == 575)
            room_goto(rLighthouseInside);
    }
};

funcDrawGUI = function()
{
    ext(sBBG1, 0, 0, 0, 2, 2, 0, 16777215, i1);
    ext(sBBG1, 5, 0, 0, 2, 2, 0, 16777215, i1);
    
    if (i1 > 0)
        i1 -= 0.016666666666666666;
    
    if (i >= 425)
        ext(sPixel, 0, 0, 0, 999, 999, 0, 0, 1);
};
