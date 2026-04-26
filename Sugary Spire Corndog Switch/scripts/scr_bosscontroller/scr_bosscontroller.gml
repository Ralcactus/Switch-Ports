function scr_bosscontroller_intro()
{
    if (showing_player)
    {
        player_scale = approach(player_scale, 1, 0.8);
        player_shake = approach(player_shake, 0, 0.8);
    }
    
    if (showing_boss)
    {
        boss_scale = approach(boss_scale, 1, 0.8);
        boss_shake = approach(boss_shake, 0, 0.8);
    }
    
    if (showing_names)
    {
        name_shake = approach(name_shake, 0, 1.2);
        versus_shake = approach(versus_shake, 0, 1.5);
    }
    
    switch (intro_state)
    {
        case 0:
            color_fade = approach(color_fade, 255, 10);
            color = make_color_hsv(0, 0, color_fade);
            
            if (color_fade >= 255)
                intro_state = 1;
            
            break;
        
        case 1:
            fadeout = approach(fadeout, 0, 0.1);
            
            if (!showing_player)
            {
                showing_player = true;
                player_shake = 45;
                player_color = 0;
                alarm[0] = 10;
            }
            
            break;
        
        case 2:
            if (intro_timer > 0)
            {
                intro_timer--;
                fadeout = approach(fadeout, 0, 0.1);
            }
            else
            {
                fadeout = approach(fadeout, 1, 0.1);
                color = 0;
                
                if (fadeout == 1)
                {
                    intro_state = 3;
                    showing_versus = false;
                }
            }
            
            break;
        
        case 3:
            fadeout = approach(fadeout, 0, 0.1);
            state = UnknownEnum.Value_1;
            break;
    }
}

function scr_bosscontroller_normal()
{
    if (boss_func != -4)
        self.boss_func();
    
    if (bosshp != lastbosshp)
        lastbosshp = bosshp;
}

function scr_bosscontroller_draw_health(arg0 = spr_pizzellehp, arg1 = 1, arg2 = playmaxhp, arg3 = playhp, arg4 = 64, arg5 = 50, arg6 = arg2 / 2, arg7 = 54, arg8 = 52, arg9 = playhpindex)
{
    for (var i = 0; i < arg2; i++)
    {
        var _color = (i < arg3) ? 16777215 : 0;
        var real_x = arg4 + ((i % arg6) * (arg1 * arg7));
        var real_y = arg5 + (floor(i / arg6) * arg8);
        
        if (arg0 == spr_pizzellehp)
            scr_palette_as_player();
        
        draw_sprite_ext(arg0, arg9, real_x, real_y, 1, 1, 0, _color, 1);
        shader_reset();
    }
}
