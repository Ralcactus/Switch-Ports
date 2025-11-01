for (var i = 0; i < array_length(boms); i++)
{
    if (!exit_freeze())
    {
        boms[i].y += boms[i].vspd;
        
        if (boms[i].y < (y + 100))
        {
            boms[i].x = lerp(boms[i].x, x + 128, 0.2);
        }
        else
        {
            var _dir = 0;
            
            if ((boms[i].x + 20) > ((boxX + 256 + boms[i].hspd) - 28))
                _dir = 1;
            
            if ((boms[i].x - 20) < (boxX + boms[i].hspd + 28))
                _dir = -1;
            
            if (_dir != 0)
            {
                boms[i].hspd = -boms[i].hspd;
                
                if (_dir == 1)
                    boms[i].x = (boxX + 256 + boms[i].hspd) - 28 - 20;
                else
                    boms[i].x = boxX + boms[i].hspd + 28 + 20;
            }
            
            if (boms[i].vspd > 0 && boms[i].y > (boxY + 165 + boms[i].vspd))
            {
                boms[i].y = boxY + 165;
                var _jump = -6;
                boms[i].vspd = _jump * choose(1, 1.3, 1.6);
            }
            
            boms[i].x += boms[i].hspd;
            boms[i].vspd += 1.4;
        }
    }
    
    draw_sprite(bom_spr, boms_index + i, boms[i].x, boms[i].y);
}

var _swap = col != 0 && anim_sprite == spr_pipe_enter;

if (_swap)
    pal_swap(pal_pipe, 0, col);

draw_sprite_ext(anim_sprite, anim_index, x, y, 1, 1, 0, c_white, 1);

if (_swap)
    shader_reset();
