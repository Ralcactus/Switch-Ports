var _x = 0;
var _y = 0;
var col = 16777215;

if (ty > 1)
{
    if (!(as("NotDraw") || as("star1") || as("star2") || as("handLazer") || as("drawLazer")))
        draw_self();
    
    if ((as("star1") || as("star2")) && ty > 0)
    {
        sprite_index = sAttack1;
        
        if (as("star1"))
        {
            image_xscale = surfIn[3];
            image_yscale = surfIn[3];
        }
        
        if (as("star2"))
        {
            image_xscale = surfIn[3] + (oGraze.maxi * 5);
            image_yscale = surfIn[3] + (oGraze.maxi * 5);
        }
        
        if (as("noJumpScale"))
        {
            image_xscale = surfIn[3];
            image_yscale = surfIn[3];
        }
        
        if (op.starBoxes && !sdone)
        {
            image_blend = c_red;
            draw_self();
        }
        
        if (specialStar == -1 && op.st_simplifyVFX == -1)
        {
            var _surfS = 2000;
            
            if (!surface_exists(op.surf))
                op.surf = surface_create(_surfS, _surfS);
            
            if (!surface_exists(op.surf2))
                op.surf2 = surface_create(_surfS * 0.2, _surfS * 0.2);
            
            surface_set_target(op.surf);
            draw_clear_alpha(c_white, 0);
            
            repeat (1)
            {
                image_angle += surfIn[4];
                
                if (sdone)
                    image_angle += (starC[0] * sign(surfIn[4]));
                
                draw_sprite_ext(sStar1, surfIn[2], _surfS / 2, _surfS / 2, 1 * starC[5], 1 * starC[5], image_angle, c_white, 1);
                surfI++;
            }
            
            surface_reset_target();
            surface_set_target(op.surf2);
            draw_clear_alpha(c_white, 0);
            draw_surface_ext(op.surf, 0, 0, surfIn[0], surfIn[0] * surfIn[1], 0, c_white, 1);
            surface_reset_target();
            _x = x - (_surfS * surfIn[0]);
            _y = y - (_surfS * surfIn[0] * surfIn[1]);
            col = 0;
            
            if (as("followerStar"))
            {
                col = 16777215;
                draw_surface_ext(op.surf2, _x - 2, _y, 2, 2, 0, col, 1);
                draw_surface_ext(op.surf2, _x + 2, _y, 2, 2, 0, col, 1);
                draw_surface_ext(op.surf2, _x, _y - 2, 2, 2, 0, col, 1);
                draw_surface_ext(op.surf2, _x, _y + 2, 2, 2, 0, col, 1);
            }
            
            if (as("star2") && !sdone && starC[0] == 0)
            {
                col = 16777215;
                draw_surface_ext(op.surf2, _x - 2, _y, 2, 2, 0, col, 1);
                draw_surface_ext(op.surf2, _x + 2, _y, 2, 2, 0, col, 1);
                draw_surface_ext(op.surf2, _x, _y - 2, 2, 2, 0, col, 1);
                draw_surface_ext(op.surf2, _x, _y + 2, 2, 2, 0, col, 1);
            }
            
            col = 16777215;
            
            if (as("star2"))
            {
                col = rgb(0, 0, 255);
                
                if (starC[0] != 0 || sdone)
                    col = 16777215;
            }
            
            if (as("followerStar"))
                col = 0;
            
            res_i();
            
            repeat (array_length(trail))
            {
                gpu_set_blendmode(bm_add);
                draw_surface_ext(op.surf2, trail[i][0] - (_surfS * surfIn[0] * 0.75), trail[i][1] - (_surfS * surfIn[0] * surfIn[1] * 0.75), 1.5, 1.5, 0, c_white, trail[i][2]);
                gpu_set_blendmode(bm_normal);
                trail[i][2] -= (1 / sd);
                i++;
            }
            
            res_i();
            i = array_length(trail);
            
            repeat (array_length(trail))
            {
                i--;
                
                if (trail[i][2] <= 0)
                    array_delete(trail, i, 1);
            }
            
            if (sdone)
                gpu_set_blendmode(bm_add);
            else
                gpu_set_blendmode(bm_normal);
            
            draw_surface_ext(op.surf2, _x, _y, 2, 2, 0, col, image_alpha);
        }
        
        if (specialStar == -1 && op.st_simplifyVFX == 1)
        {
            image_angle += surfIn[4];
            
            if (sdone)
                image_angle += (starC[0] * sign(surfIn[4]));
            
            surfI++;
            col = 0;
            
            if (as("followerStar"))
            {
                col = 16777215;
                ext(sStar1, surfIn[2], x - 2, y, 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, col, 1);
                ext(sStar1, surfIn[2], x + 2, y, 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, col, 1);
                ext(sStar1, surfIn[2], x, y - 2, 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, col, 1);
                ext(sStar1, surfIn[2], x, y + 2, 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, col, 1);
            }
            
            if (as("star2") && !sdone && starC[0] == 0)
            {
                col = 16777215;
                ext(sStar1, surfIn[2], x - 2, y, 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, col, 1);
                ext(sStar1, surfIn[2], x + 2, y, 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, col, 1);
                ext(sStar1, surfIn[2], x, y - 2, 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, col, 1);
                ext(sStar1, surfIn[2], x, y + 2, 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, col, 1);
            }
            
            col = 16777215;
            
            if (as("star2"))
            {
                col = rgb(0, 0, 255);
                
                if (starC[0] != 0 || sdone)
                    col = 16777215;
            }
            
            if (as("followerStar"))
                col = 0;
            
            res_i();
            
            repeat (array_length(trail))
            {
                gpu_set_blendmode(bm_add);
                ext(sStar1, surfIn[2], trail[i][0], trail[i][1], 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, 16777215, trail[i][2]);
                gpu_set_blendmode(bm_normal);
                trail[i][2] -= (1 / sd);
                i++;
            }
            
            res_i();
            i = array_length(trail);
            
            repeat (array_length(trail))
            {
                i--;
                
                if (trail[i][2] <= 0)
                    array_delete(trail, i, 1);
            }
            
            if (sdone)
                gpu_set_blendmode(bm_add);
            else
                gpu_set_blendmode(bm_normal);
            
            ext(sStar1, surfIn[2], x, y, 2 * surfIn[0] * starC[5], 2 * surfIn[0] * starC[5], image_angle, col, image_alpha);
        }
        
        gpu_set_blendmode(bm_normal);
        
        if (specialStar != -1)
        {
            rareAngle = 0;
            
            if (specialStar == 2 || specialStar == 3 || specialStar == 5 || specialStar == 6 || specialStar == 7 || specialStar == 8 || specialStar == 9)
                rareAngle = dsin(extraAngle + (ty * 10)) * 15;
            else
                rareAngle = extraAngle + (ty * 10);
            
            ext(sRareObjects, specialStar, x, y, 2, 2, rareAngle, 16777215, image_alpha);
        }
    }
    
    if (as("drawLazer"))
    {
        if (!surface_exists(surf))
            surf = surface_create(640, 3480);
        
        i1 = [];
        i = 0;
        
        with (oAttack)
        {
            if (as("handLazer"))
                array_push(other.i1, [x, y, image_xscale, image_angle, image_alpha, visScale + (dsin(ty * 10) * 1), visScale2 + ((visScale2 > 0) * dsin(ty * 10) * 1), scaleTo]);
        }
        
        surface_set_target(surf);
        ext(sPixel, 0, -100, -100, 9999, 9999, 0, 0, 1);
        i = array_length(i1) - 1;
        
        repeat (array_length(i1))
        {
            if (i1[i][7] == 15)
                ext(sPixel2, 0, i1[i][0], i1[i][1] + 3000, i1[i][2], i1[i][5], i1[i][3], rgb(127.5, 127.5, 127.5), 1);
            
            i--;
        }
        
        i = array_length(i1) - 1;
        
        repeat (array_length(i1))
        {
            ext(sPixel2, 0, i1[i][0], i1[i][1] + 3000, i1[i][2], i1[i][6], i1[i][3], rgb(255 * i1[i][4], 255 * i1[i][4], 255 * i1[i][4]), 1);
            i--;
        }
        
        if (oBUI.attack != "final")
            ext(sHand_LazerExtra, oEnemie._handd[1][2], oEnemie._handd[1][3], oEnemie._handd[1][4] + 3000, oEnemie._handd[1][5] - oEnemie.armExtraScale[1], oEnemie._handd[1][6] + oEnemie.armExtraScale[1], oEnemie._handd[1][7]);
        
        surface_reset_target();
        gpu_set_blendmode(bm_add);
        draw_surface(surf, 0, -3000);
        gpu_set_blendmode(bm_normal);
    }
}
