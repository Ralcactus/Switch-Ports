depth = 0;
surf = -1;
drawPlace = 0;
flavourAt = -1;
glowWhite = 0;
popWhite = 0;
mw = 0;
eX = 0;
eY = 0;
mx = 0;
my = 0;
canChangeStats = true;
an = "idle";
time = [0, 0];
shake = 0;
shakeX = 0;
shakeY = 0;
shakeWhole = false;
_handd = [];
armSprites = [sHand_IdleMini, sHand_IdleMiniM, sHand_Idle2, sHand_IdleM2];
newSprites = [sHand_IdleMini, sHand_IdleMiniM, sHand_Idle2, sHand_IdleM2];
armExtraScale = [0, 0];
armScaleTime = [0, 0];
armScaleType = [-1, -1];
armDuration = [0, 0];
armPower = [0, 0];
armFunc = [-1, -1];
armSound = [-1, -1];
endImageFunc = [-1, -1];
image_xscale = 2;
image_yscale = 2;
circle = 0;
forceSpace = false;
glow = 0;
drawAlpha = 1;
starAlpha = [0, 0, 0, 0];
drawL = 0;

draw = function()
{
    if (inf_realName == "test_1" || inf_realName == "test_2" || inf_realName == "test_3")
    {
        var _i = 0;
        _handd = [];
        
        if (drawL != 2 || (drawL == 2 && drawPlace == 0))
        {
            if (shake > 0 || shake < 0)
            {
                shakeX = shake;
                
                if (shake > 0)
                {
                    shake--;
                    shake = -shake;
                }
                else
                {
                    shake++;
                    shake = -shake;
                }
            }
            else
            {
                shakeX = 0;
            }
        }
        
        if (shakeWhole)
        {
            shakeX = irandom_range(-2, 2);
            shakeY = irandom_range(-2, 2);
        }
        
        var handColor = 16777215;
        handd(armSprites[0], armSprites[1], time[0] / 6, 440 + eX + shakeX, 330 + eY + shakeY, image_xscale, (image_yscale - 0.1) + (dcos(op.ty * 3) * 0.1), dsin(op.ty * 3) * 2, handColor);
        handd(armSprites[2], armSprites[3], time[1] / 6, 440 + (30 * image_xscale) + eX + shakeX, 330 + eY + shakeY, image_xscale, (image_yscale - 0.05) + (dsin(op.ty * 3) * 0.05), dcos(op.ty * 3) * 2, handColor);
        
        if (!surface_exists(surf))
            surf = surface_create(640, 480);
        
        _i = 0;
        
        repeat (array_length(_handd))
        {
            if (drawL != 2 || (drawL == 2 && drawPlace == 1))
            {
                if (armScaleType[_i] == -1)
                    armScaleTime[_i] = 0;
                
                if (armScaleType[_i] == 1)
                {
                    armScaleTime[_i] += armPower[_i];
                    armExtraScale[_i] -= armScaleTime[_i];
                }
                
                if (armScaleType[_i] == 2)
                {
                    if (armScaleTime[_i] != 0)
                        armExtraScale[_i] *= -1;
                    
                    armScaleTime[_i] = 0;
                    armExtraScale[_i] += (0 - armExtraScale[_i]) / 5;
                }
                
                if (armDuration[_i] > 0)
                {
                    armDuration[_i]--;
                    
                    if (armDuration[_i] == 0)
                    {
                        time[_i] = 0;
                        armScaleType[_i] = 2;
                        armSprites[_i * 2] = newSprites[_i * 2];
                        armSprites[1 + (_i * 2)] = newSprites[1 + (_i * 2)];
                        
                        if (armSound[_i] != -1)
                        {
                            snd(armSound[_i]);
                            armSound[_i] = -1;
                        }
                        
                        if (armFunc[_i] != -1)
                        {
                            armFunc[_i]();
                            armFunc[_i] = -1;
                        }
                    }
                }
            }
            
            _handd[_i][2] = time[_i] / 6;
            depth = 0;
            
            if (_handd[_i][0] == sHand_Smash)
            {
                _handd[_i][2] = clamp(time[_i] / 2, 0, 8);
                
                if (_handd[_i][2] > 5)
                    depth = -640;
                
                if (_handd[_i][2] == 7 && endImageFunc[_i] != -1)
                {
                    endImageFunc[_i]();
                    endImageFunc[_i] = -1;
                }
            }
            
            if (_handd[_i][0] == sHand_Lift)
            {
                _handd[_i][2] = clamp(time[_i] / 2, 0, 5);
                
                if (_handd[_i][2] < 1)
                    depth = -640;
                
                if (_handd[_i][2] == 4 && endImageFunc[_i] != -1)
                {
                    endImageFunc[_i]();
                    endImageFunc[_i] = -1;
                }
            }
            
            if (_handd[_i][0] == sHand_laughExtend)
            {
                _handd[_i][2] = 1;
                _handd[_i][7] = 0;
                _handd[_i][6] = 2;
            }
            
            if (_handd[_i][0] == sHand_SpecialRise)
            {
                _handd[_i][2] = clamp(time[_i] / 3, 0, 12);
                _handd[_i][5] = 2;
                _handd[_i][6] = 2;
                _handd[_i][7] = 0;
            }
            
            if (_handd[_i][0] == sHand_Aim2)
            {
                _handd[_i][5] = 2;
                _handd[_i][6] = 2;
                _handd[_i][7] = 0;
            }
            
            if (drawL == 2 && drawPlace == 0)
                depth = -320;
            
            if (drawL == 2 && drawPlace == 1)
                depth = -640;
            
            _handd[_i][4] += round(oBUI.move_UI * 0.8);
            surface_set_target(surf);
            draw_clear_alpha(c_white, 0);
            
            if ((_i == 1 && circle > 0) && (drawL != 2 || (drawL == 2 && drawPlace == 0)))
                draw_circle(_handd[_i][3] - 50, _handd[_i][4] - 320, circle, false);
            
            if (forceSpace)
                _handd[_i][4] -= op.camY;
            
            if (drawL != 2 || (drawL == 2 && drawPlace == 1))
                ext(_handd[_i][1], _handd[_i][2], _handd[_i][3], _handd[_i][4], _handd[_i][5] - armExtraScale[_i], _handd[_i][6] + armExtraScale[_i], _handd[_i][7]);
            
            gpu_set_colorwriteenable(1, 1, 1, 0);
            var _spaceSprite = sSpaceM;
            
            if (drawL == 2)
                _spaceSprite = sSpaceM2;
            
            if (forceSpace)
            {
                oPep.image_alpha = 0;
                _spaceSprite = sSpaceM2;
            }
            
            if (op.benMode)
                _spaceSprite = sBen_Meat;
            
            ext(_spaceSprite, 0, 0, op.benMode * dsin(op.ty * 3) * 10, 2, 2, undefined, undefined, undefined, mw);
            gpu_set_blendmode(bm_add);
            ext(sConstellationStars, 1, 0, 0, 2, 2, undefined, undefined, starAlpha[0]);
            ext(sConstellationStars, 2, 0, 0, 2, 2, undefined, undefined, starAlpha[1]);
            ext(sConstellationStars, 3, 0, 0, 2, 2, undefined, undefined, starAlpha[2]);
            ext(sConstellationStars, 4, 0, 0, 2, 2, undefined, undefined, starAlpha[3]);
            gpu_set_blendmode(bm_normal);
            gpu_set_colorwriteenable(1, 1, 1, 1);
            
            if (drawL != 2 || (drawL == 2 && drawPlace == 1))
                ext(_handd[_i][0], _handd[_i][2], _handd[_i][3], _handd[_i][4], _handd[_i][5] - armExtraScale[_i], _handd[_i][6] + armExtraScale[_i], _handd[_i][7], undefined, undefined, mw);
            
            _i++;
            surface_reset_target();
            var _maskX = 0;
            var _maskY = 0;
            
            if (op.camMode == "soul" || op.camMode == "finalEnd")
            {
                _maskX = op.camX - 320;
                _maskY = op.camY;
                _maskX = clamp(_maskX, 0, 0);
                _maskY = clamp(_maskY, -9999, 0);
            }
            
            if (drawL == 2 && drawPlace == 1)
            {
                shader_set(shaRGB);
                shader_set_uniform_f(shader_get_uniform(shaRGB, "col_r"), glow);
                shader_set_uniform_f(shader_get_uniform(shaRGB, "col_g"), glow);
                shader_set_uniform_f(shader_get_uniform(shaRGB, "col_b"), glow);
                shader_set_uniform_f(shader_get_uniform(shaRGB, "col_a"), 0);
                _handd[0][9] *= drawAlpha;
            }
            
            draw_surface_ext(surf, _maskX, _maskY, 1, 1, 0, _handd[0][8], _handd[0][9]);
            
            if (drawPlace == 1)
                shader_reset();
        }
        
        if (op.benMode)
            ext(sBen, 0, 450, 140, 1, 1);
    }
};

starSurf = -1;
starsOn = false;

function drawStars(arg0 = "u")
{
    if (starsOn)
    {
        if (!surface_exists(starSurf))
            starSurf = surface_create(50, 50);
        
        thei = 0;
        _swap = -1;
        
        repeat (4)
        {
            surface_set_target(starSurf);
            draw_clear_alpha(c_white, 0);
            ext(sStar1, 0, 25, 25, 0.05, 0.05, op.ty * _swap * 8);
            surface_reset_target();
            
            var _draw = function(arg0 = 0, arg1 = 0, arg2 = 16777215)
            {
                draw_surface_ext(starSurf, 450 + arg0 + (dcos((op.ty * 5) + (thei * 90)) * 110), 20 + arg1 + (dsin((op.ty * 5) + (thei * 90)) * 25), 2, 2, 0, arg2, 1);
            };
            
            if (arg0 == "u" && dsin((op.ty * 5) + (thei * 90)) < 0)
            {
                _draw();
            }
            else if (arg0 == "d" && dsin((op.ty * 5) + (thei * 90)) >= 0)
            {
                if (dsin((op.ty * 5) + (thei * 90)) >= 0.5)
                {
                    _draw(-2, 0, 0);
                    _draw(2, 0, 0);
                    _draw(0, -2, 0);
                    _draw(0, 2, 0);
                }
                
                _draw();
            }
            
            _swap *= -1;
            thei++;
        }
    }
}
