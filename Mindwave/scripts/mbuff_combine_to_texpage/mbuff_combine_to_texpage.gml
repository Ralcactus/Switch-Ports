function mbuff_combine_to_texpage(arg0, arg1, arg2, arg3, arg4)
{
    var mBuff = arg0;
    var texPack = arg1;
    var padding = arg2;
    var maxSize = arg3;
    var forcePow2 = arg4;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var modelNum = array_length(mBuff);
    
    if (modelNum <= 0)
        return -1;
    
    var texPagePriority = ds_priority_create();
    var texToPageMap = ds_map_create();
    var texPackSize = array_length(texPack);
    var modelsPerTex = texPackSize * ceil(modelNum / texPackSize);
    var s = surface_create(2, 2);
    surface_set_target(s);
    draw_clear(c_white);
    surface_reset_target();
    var noTex = sprite_create_from_surface(s, 0, 0, 2, 2, 0, 0, 0, 0);
    surface_free(s);
    var tex;
    
    for (var t = 0; t < texPackSize; t++)
    {
        tex = texPack[t];
        
        if (tex < 0)
        {
            texPack[t] = noTex;
            tex = texPack[t];
        }
        
        if (is_undefined(ds_priority_find_priority(texPagePriority, tex)))
        {
            var w = sprite_get_width(tex);
            var h = sprite_get_height(tex);
            
            if (h > w)
            {
                texPack[t] = _mbuff_rotate_sprite(tex);
                tex = texPack[t];
            }
            
            ds_priority_add(texPagePriority, tex, sprite_get_width(tex) + sprite_get_height(tex));
            
            for (var m = t; m < modelNum; m += modelsPerTex)
            {
                if (h > w)
                    mbuff_rotate_uvs(mBuff[m]);
                
                mbuff_tesselate_uvs(mBuff[m]);
            }
        }
    }
    
    var texNum = ds_priority_size(texPagePriority);
    
    if (texNum <= 0)
        return -1;
    
    var image_list = ds_list_create();
    var texPages = 1;
    var texInd = ds_priority_find_max(texPagePriority);
    var texPageW;
    texPageW[0] = sprite_get_width(texInd) + (2 * padding);
    var texPageH;
    texPageH[0] = sprite_get_height(texInd) + (2 * padding);
    
    if (forcePow2)
    {
        texPageW[0] = power(2, ceil(log2(texPageW[0])));
        texPageH[0] = power(2, ceil(log2(texPageH[0])));
    }
    
    if (max(texPageW[0], texPageH[0]) > maxSize)
        show_debug_message("Error in script mbuff_combine_to_texpage: Textures do not fit on texture page size. The max size of the texture pages will not be correct.");
    
    var freeSpace;
    freeSpace[0] = ds_list_create();
    ds_list_add(freeSpace[0], 0, 0, texPageW[0], texPageH[0]);
    
    while (ds_priority_size(texPagePriority))
    {
        texInd = ds_priority_delete_max(texPagePriority);
        var texW = sprite_get_width(texInd) + (2 * padding);
        var texH = sprite_get_height(texInd) + (2 * padding);
        chosenRegion = -1;
        minH = 9999;
        var i;
        
        for (i = 0; i < texPages; i++)
        {
            var num = ds_list_size(freeSpace[i]);
            
            for (var n = 0; n < num; n += 4)
            {
                spaceLeft = ds_list_find_value(freeSpace[i], n);
                spaceUpper = ds_list_find_value(freeSpace[i], n + 1);
                spaceRight = ds_list_find_value(freeSpace[i], n + 2);
                spaceLower = ds_list_find_value(freeSpace[i], n + 3);
                spaceW = spaceRight - spaceLeft;
                spaceH = spaceLower - spaceUpper;
                
                if (spaceW >= texW && spaceH >= texH && spaceH < minH)
                {
                    chosenRegion = n;
                    minH = spaceH;
                }
            }
            
            if (chosenRegion >= 0)
                break;
            
            if (texPageH[i] > texPageW[i])
            {
                for (var n = 0; n < num; n += 4)
                {
                    spaceLeft = ds_list_find_value(freeSpace[i], n);
                    spaceUpper = ds_list_find_value(freeSpace[i], n + 1);
                    spaceRight = ds_list_find_value(freeSpace[i], n + 2);
                    spaceLower = ds_list_find_value(freeSpace[i], n + 3);
                    spaceH = spaceLower - spaceUpper;
                    
                    if (spaceRight >= texPageW[i] && spaceH >= texH)
                    {
                        spaceRight = spaceLeft + texW;
                        
                        if (forcePow2)
                            spaceRight = power(2, ceil(log2(spaceRight)));
                        
                        if (spaceRight > maxSize)
                        {
                        }
                        else
                        {
                            for (var nn = 0; nn < ds_list_size(freeSpace[i]); nn += 4)
                            {
                                var __Right = ds_list_find_value(freeSpace[i], nn + 2);
                                
                                if (__Right == texPageW[i])
                                    ds_list_set(freeSpace[i], nn + 2, spaceRight);
                            }
                            
                            for (var nn = 0; nn < ds_list_size(image_list); nn += 4)
                            {
                                if (ds_list_find_value(image_list, nn + 1) != i)
                                    continue;
                                
                                var __tex = ds_list_find_value(image_list, nn);
                                var __Right = ds_list_find_value(image_list, nn + 2) + sprite_get_width(__tex) + padding;
                                
                                if (__Right <= (texPageW[i] - 1))
                                    continue;
                                
                                ds_list_add(freeSpace[i], __Right, ds_list_find_value(image_list, nn + 3) - padding, spaceRight, ds_list_find_value(image_list, nn + 3) + sprite_get_height(__tex) + padding);
                            }
                            
                            texPageW[i] = spaceRight;
                            chosenRegion = n;
                            break;
                        }
                    }
                }
                
                if (chosenRegion >= 0)
                    break;
                
                newW = texPageW[i] + texW;
                
                if (forcePow2)
                    newW = power(2, ceil(log2(newW)));
                
                if (newW > maxSize)
                    continue;
                
                chosenRegion = ds_list_size(freeSpace[i]);
                ds_list_add(freeSpace[i], texPageW[i], 0, newW, texPageH[i]);
                texPageW[i] = newW;
                break;
            }
            else
            {
                for (var n = 0; n < num; n += 4)
                {
                    spaceLeft = ds_list_find_value(freeSpace[i], n);
                    spaceUpper = ds_list_find_value(freeSpace[i], n + 1);
                    spaceRight = ds_list_find_value(freeSpace[i], n + 2);
                    spaceLower = ds_list_find_value(freeSpace[i], n + 3);
                    spaceW = spaceRight - spaceLeft;
                    
                    if (spaceLower >= texPageH[i] && spaceW >= texW)
                    {
                        spaceLower = spaceUpper + texH;
                        
                        if (forcePow2)
                            spaceLower = power(2, ceil(log2(spaceLower)));
                        
                        if (spaceLower > maxSize)
                        {
                        }
                        else
                        {
                            for (var nn = 0; nn < ds_list_size(freeSpace[i]); nn += 4)
                            {
                                var __Lower = ds_list_find_value(freeSpace[i], nn + 3);
                                
                                if (__Lower == texPageH[i])
                                    ds_list_set(freeSpace[i], nn + 3, spaceLower);
                            }
                            
                            for (var nn = 0; nn < ds_list_size(image_list); nn += 4)
                            {
                                if (ds_list_find_value(image_list, nn + 1) != i)
                                    continue;
                                
                                var __tex = ds_list_find_value(image_list, nn);
                                var __Lower = ds_list_find_value(image_list, nn + 3) + sprite_get_height(__tex) + padding;
                                
                                if (__Lower <= (texPageH[i] - 1))
                                    continue;
                                
                                ds_list_add(freeSpace[i], ds_list_find_value(image_list, nn + 2) - padding, __Lower, ds_list_find_value(image_list, nn + 2) + sprite_get_width(__tex) + padding, spaceLower);
                            }
                            
                            texPageH[i] = spaceLower;
                            chosenRegion = n;
                            break;
                        }
                    }
                }
                
                if (chosenRegion >= 0)
                    break;
                
                newH = texPageH[i] + texH;
                
                if (forcePow2)
                    newH = power(2, ceil(log2(newH)));
                
                if (newH > maxSize)
                {
                }
                else
                {
                    chosenRegion = ds_list_size(freeSpace[i]);
                    ds_list_add(freeSpace[i], 0, texPageH[i], texPageW[i], newH);
                    texPageH[i] = newH;
                    break;
                }
            }
        }
        
        if (chosenRegion < 0)
        {
            i = texPages;
            texPages++;
            texPageW[i] = sprite_get_width(tex) + (2 * padding);
            texPageH[i] = sprite_get_height(tex) + (2 * padding);
            
            if (forcePow2)
            {
                texPageW[i] = power(2, ceil(log2(texPageW[i])));
                texPageH[i] = power(2, ceil(log2(texPageH[i])));
            }
            
            if (max(texPageW[i], texPageH[i]) > maxSize)
                show_debug_message("Error in script mbuff_combine_to_texpage: Textures do not fit on texture page size. The max size of the texture pages will not be correct.");
            
            freeSpace[i] = ds_list_create();
            ds_list_add(freeSpace[i], 0, 0, texPageW[0], texPageH[0]);
            chosenRegion = 0;
        }
        
        spaceLeft = ds_list_find_value(freeSpace[i], chosenRegion);
        spaceUpper = ds_list_find_value(freeSpace[i], chosenRegion + 1);
        spaceRight = ds_list_find_value(freeSpace[i], chosenRegion + 2);
        spaceLower = ds_list_find_value(freeSpace[i], chosenRegion + 3);
        ds_map_set(texToPageMap, texInd, ds_list_size(image_list));
        ds_list_add(image_list, texInd, i, spaceLeft + padding, spaceUpper + padding);
        
        repeat (4)
            ds_list_delete(freeSpace[i], chosenRegion);
        
        if (texW < (spaceRight - spaceLeft))
            ds_list_add(freeSpace[i], spaceLeft + texW, spaceUpper, spaceRight, spaceUpper + texH);
        
        if (texH < (spaceLower - spaceUpper))
            ds_list_add(freeSpace[i], spaceLeft, spaceUpper + texH, spaceRight, spaceLower);
    }
    
    matrix_set(0, matrix_build_identity());
    matrix_set(2, matrix_build_identity());
    gpu_set_zwriteenable(false);
    gpu_set_cullmode(0);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    gpu_set_texrepeat(false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    var newTexPack = array_create(texPages);
    var newMbuff = array_create(texPages, -1);
    
    for (var i = 0; i < texPages; i++)
    {
        s = surface_create(texPageW[i], texPageH[i]);
        surface_set_target(s);
        draw_clear_alpha(c_white, 0);
        
        for (var t = 0; t < ds_list_size(image_list); t += 4)
        {
            if (ds_list_find_value(image_list, t + 1) != i)
                continue;
            
            tex = ds_list_find_value(image_list, t);
            texPadX = padding / sprite_get_width(tex);
            texPadY = padding / sprite_get_height(tex);
            var w = sprite_get_width(tex);
            var h = sprite_get_height(tex);
            draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(tex, 0));
            uv = texture_get_uvs(sprite_get_texture(tex, 0));
            uv[2] = texture_get_width(sprite_get_texture(tex, 0));
            uv[3] = texture_get_height(sprite_get_texture(tex, 0));
            draw_vertex_texture(ds_list_find_value(image_list, t + 2) - padding, ds_list_find_value(image_list, t + 3) - padding, uv[0] - (uv[2] * texPadX), uv[1] - (uv[3] * texPadY));
            draw_vertex_texture(ds_list_find_value(image_list, t + 2) + padding + w, ds_list_find_value(image_list, t + 3) - padding, uv[0] + (uv[2] * (1 + texPadX)), uv[1] - (uv[3] * texPadY));
            draw_vertex_texture(ds_list_find_value(image_list, t + 2) - padding, ds_list_find_value(image_list, t + 3) + padding + h, uv[0] - (uv[2] * texPadX), uv[1] + (uv[3] * (1 + texPadY)));
            draw_vertex_texture(ds_list_find_value(image_list, t + 2) + padding + w, ds_list_find_value(image_list, t + 3) + padding + h, uv[0] + (uv[2] * (1 + texPadX)), uv[1] + (uv[3] * (1 + texPadY)));
            draw_primitive_end();
        }
        
        var num = ds_list_size(freeSpace[i]);
        draw_set_colour(c_black);
        
        for (var n = 0; n < num; n += 4)
        {
            spaceLeft = ds_list_find_value(freeSpace[i], n);
            spaceUpper = ds_list_find_value(freeSpace[i], n + 1);
            spaceRight = ds_list_find_value(freeSpace[i], n + 2);
            spaceLower = ds_list_find_value(freeSpace[i], n + 3);
            draw_rectangle(spaceLeft, spaceUpper - 1, spaceRight - 1, spaceLower - 1, true);
        }
        
        draw_set_colour(c_white);
        surface_reset_target();
        newTexPack[i] = sprite_create_from_surface(s, 0, 0, texPageW[i], texPageH[i], 0, 0, 0, 0);
        surface_free(s);
    }
    
    gpu_set_blendmode(bm_normal);
    var bytesPerVert = 44;
    
    for (var m = 0; m < modelNum; m++)
    {
        var t = ds_map_find_value(texToPageMap, array_get(texPack, m % texPackSize));
        texInd = ds_list_find_value(image_list, t);
        var texPage = ds_list_find_value(image_list, t + 1);
        var texX = ds_list_find_value(image_list, t + 2) / texPageW[texPage];
        var texY = ds_list_find_value(image_list, t + 3) / texPageH[texPage];
        var texW = sprite_get_width(texInd) / texPageW[texPage];
        var texH = sprite_get_height(texInd) / texPageH[texPage];
        var buff = mBuff[m];
        var buffSize = buffer_get_size(buff);
        
        for (var j = 0; j < buffSize; j += bytesPerVert)
        {
            var u = buffer_peek(buff, j + 24, buffer_f32);
            var v = buffer_peek(buff, j + 28, buffer_f32);
            buffer_poke(buff, j + 24, buffer_f32, texX + (texW * u));
            buffer_poke(buff, j + 28, buffer_f32, 1 - (texY + (texH * v)));
        }
        
        var newBuff = newMbuff[texPage];
        
        if (newBuff <= -1)
        {
            newBuff = buffer_create(buffSize, buffer_fixed, 1);
            buffer_copy(buff, 0, buffSize, newBuff, 0);
            newMbuff[texPage] = newBuff;
        }
        else
        {
            var oldBuffSize = buffer_get_size(newBuff);
            buffer_resize(newBuff, oldBuffSize + buffSize);
            buffer_copy(buff, 0, buffSize, newBuff, oldBuffSize);
        }
    }
    
    return [newMbuff, newTexPack];
}
