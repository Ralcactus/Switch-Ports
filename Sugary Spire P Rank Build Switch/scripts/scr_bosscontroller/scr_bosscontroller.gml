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
                color = c_black;
                
                if (fadeout == 1)
                {
                    intro_state = 3;
                    showing_versus = false;
                }
            }
            
            break;
        
        case 3:
            fadeout = approach(fadeout, 0, 0.1);
            state = states.normal;
            break;
    }
}

function scr_bosscontroller_normal()
{
    if (boss_func != noone)
        self.boss_func();
    
    if (bosshp != lastbosshp)
        lastbosshp = bosshp;
}

function scr_bosscontroller_draw_health(sprite = spr_pizzellehp, dir = 1, total = playmaxhp, my_health = playhp, _x = 64, _y = 50, _wrap = total / 2, pad_x = 54, pad_y = 52, _index = playhpindex) 
{
	for (var i = 0; i < total; i++) 
	{
		var _color = i < my_health ? c_white : c_black;
		var real_x = _x + ((i % _wrap) * (dir * pad_x));
		var real_y = _y + (floor(i / _wrap) * pad_y);
		
		if (sprite == spr_pizzellehp)
			scr_palette_as_player();
			
		draw_sprite_ext(sprite, _index, real_x, real_y, 1, 1, 0, _color, 1);
		shader_reset();
	}
	
}
