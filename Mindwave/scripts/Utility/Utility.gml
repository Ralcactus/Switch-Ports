function smf_smoothstep(arg0, arg1, arg2)
{
    var xx = clamp((arg2 - arg0) / (arg1 - arg0), 0, 1);
    return xx * xx * (3 - (2 * xx));
}

function smf_quadratic_interpolate(arg0, arg1, arg2, arg3)
{
    var t0 = 0.5 * sqr(1 - arg3);
    var t1 = 0.5 * arg3 * arg3;
    var t2 = 2 * arg3 * (1 - arg3);
    return (t0 * (arg0 + arg1)) + (t1 * (arg1 + arg2)) + (t2 * arg1);
}

function smf_get_array_index(arg0, arg1)
{
    var i = array_length(arg0) - 1;
    
    while (i >= 0)
    {
        if (arg1 == arg0[i])
            return i;
        
        i--;
    }
    
    return -1;
}

function smf_model_load_v7_from_buffer(arg0, arg1 = "", arg2 = new smf_model())
{
    buffer_seek(arg0, buffer_seek_start, 0);
    var HeaderText = buffer_read(arg0, buffer_string);
    var versionNum = 0;
    
    if (HeaderText != "SnidrsModelFormat")
    {
        show_debug_message("The given buffer does not contain a valid SMF model");
        return -1;
    }
    
    versionNum = buffer_read(arg0, buffer_f32);
    var partitioned = false;
    var compatibility = false;
    
    if (versionNum > 8)
    {
        show_error("This was made with a newer version of SMF.", false);
        return -1;
    }
    else if (versionNum == 8)
    {
        partitioned = true;
        compatibility = buffer_read(arg0, buffer_bool);
    }
    else if (versionNum < 6)
    {
        show_error("This was made with an unsupported version of SMF.", false);
        return -1;
    }
    
    var model = arg2;
    var texPos = buffer_read(arg0, buffer_u32);
    var matPos = buffer_read(arg0, buffer_u32);
    var modPos = buffer_read(arg0, buffer_u32);
    var nodPos = buffer_read(arg0, buffer_u32);
    var colPos = buffer_read(arg0, buffer_u32);
    var rigPos = buffer_read(arg0, buffer_u32);
    var aniPos = buffer_read(arg0, buffer_u32);
    var selPos = buffer_read(arg0, buffer_u32);
    var subPos = buffer_read(arg0, buffer_u32);
    buffer_read(arg0, buffer_u32);
    
    if (versionNum == 6)
    {
        if (buffer_read(arg0, buffer_u8))
        {
            show_error("This was made with an unsupported version of SMF.", false);
            return -1;
        }
    }
    
    var modelNum = buffer_read(arg0, buffer_u8);
    var texMap = ds_map_create();
    buffer_seek(arg0, buffer_seek_start, texPos);
    var texNum = buffer_read(arg0, buffer_u8);
    
    if (texNum > 0)
    {
        var s = surface_create(8, 8);
        surface_set_target(s);
        draw_clear(c_white);
        surface_reset_target();
        var blankSprite = sprite_create_from_surface(s, 0, 0, 8, 8, 0, 0, 0, 0);
        var texBuff = buffer_create(1, buffer_fast, 1);
        
        for (var t = 0; t < texNum; t++)
        {
            var name = buffer_read(arg0, buffer_string);
            var w = buffer_read(arg0, buffer_u16);
            var h = buffer_read(arg0, buffer_u16);
            var spr = asset_get_index(filename_change_ext(filename_name(arg1), "_" + string(name)));
            
            if (sprite_exists(spr))
            {
                ds_map_set(texMap, name, spr);
            }
            else if (w > 0 && h > 0)
            {
                surface_resize(s, w, h);
                buffer_resize(texBuff, w * h * 4);
                buffer_copy(arg0, buffer_tell(arg0), w * h * 4, texBuff, 0);
                buffer_set_surface(texBuff, s, 0);
                ds_map_set(texMap, name, sprite_create_from_surface(s, 0, 0, w, h, 0, 0, 0, 0));
            }
            else if (is_undefined(ds_map_find_value(texMap, name)))
            {
                ds_map_set(texMap, name, sprite_duplicate(blankSprite));
            }
            
            buffer_seek(arg0, buffer_seek_relative, w * h * 4);
        }
        
        sprite_delete(blankSprite);
        surface_free(s);
        buffer_delete(texBuff);
    }
    
    buffer_seek(arg0, buffer_seek_start, modPos);
    model.mBuff = array_create(modelNum);
    model.vBuff = array_create(modelNum);
    model.texPack = array_create(modelNum);
    model.vis = array_create(modelNum);
    model.subRigIndex = array_create(modelNum);
    
    for (var m = 0; m < modelNum; m++)
    {
        var size = buffer_read(arg0, buffer_u32);
        var mBuff = buffer_create(size, buffer_fixed, 1);
        buffer_copy(arg0, buffer_tell(arg0), size, mBuff, 0);
        var vBuff = vertex_create_buffer_from_buffer(mBuff, compatibility ? global.mBuffStdFormat : global.mBuffFormat);
        vertex_freeze(vBuff);
        model.mBuff[m] = mBuff;
        model.vBuff[m] = vBuff;
        model.subRigIndex[m] = 0;
        buffer_seek(arg0, buffer_seek_relative, size);
        var matName = buffer_read(arg0, buffer_string);
        var texName = buffer_read(arg0, buffer_string);
        var texInd = ds_map_find_value(texMap, texName);
        model.texPack[m] = is_undefined(texInd) ? -1 : texInd;
        model.vis[m] = buffer_read(arg0, buffer_u8);
        var n = buffer_read(arg0, buffer_u32);
        
        repeat (n)
            buffer_seek(arg0, buffer_seek_relative, buffer_read(arg0, buffer_u8) * 4);
        
        n = buffer_read(arg0, buffer_u32);
        buffer_seek(arg0, buffer_seek_relative, n * 4);
        
        if (partitioned)
            model.subRigIndex[m] = buffer_read(arg0, buffer_u8);
    }
    
    ds_map_destroy(texMap);
    buffer_seek(arg0, buffer_seek_start, rigPos);
    var nodeNum = buffer_read(arg0, buffer_u8);
    var nodeList;
    
    if (nodeNum > 0)
    {
        model.rig = new smf_rig();
        nodeList = model.rig.nodeList;
        
        for (var i = 0; i < nodeNum; i++)
        {
            var node = array_create((13 << 0), 0);
            var worldDQ = array_create(8);
            
            for (var j = 0; j < 8; j++)
                worldDQ[j] = buffer_read(arg0, buffer_f32);
            
            node[(1 << 0)] = worldDQ;
            node[(5 << 0)] = buffer_read(arg0, buffer_u8);
            node[(8 << 0)] = buffer_read(arg0, buffer_u8);
            node[(10 << 0)] = [0, 0, 1];
            ds_list_set(nodeList, i, node);
            _anim_rig_update_node(model.rig, i);
        }
        
        _anim_rig_update_bindmap(model.rig);
    }
    
    if (buffer_read(arg0, buffer_u8) == 232)
    {
        var bytesPerNode = buffer_read(arg0, buffer_u8);
        var buffPos = buffer_tell(arg0);
        
        for (var i = 0; i < nodeNum; i++)
        {
            var node = ds_list_find_value(nodeList, i);
            node[(11 << 0)] = buffer_peek(arg0, buffPos + (bytesPerNode * i), buffer_u8);
            
            if (bytesPerNode >= 13)
            {
                var pAxis = array_create(3);
                pAxis[0] = buffer_peek(arg0, buffPos + (bytesPerNode * i) + 1, buffer_f32);
                pAxis[1] = buffer_peek(arg0, buffPos + (bytesPerNode * i) + 5, buffer_f32);
                pAxis[2] = buffer_peek(arg0, buffPos + (bytesPerNode * i) + 9, buffer_f32);
                node[(10 << 0)] = pAxis;
            }
        }
    }
    
    if (partitioned)
    {
        buffer_seek(arg0, buffer_seek_start, subPos);
        var num = buffer_read(arg0, buffer_u8);
        model.subRigs = array_create(num);
        
        for (var i = 0; i < num; i++)
        {
            var boneNum = buffer_read(arg0, buffer_u8);
            var subRig = array_create(boneNum);
            
            for (var j = 0; j < boneNum; j++)
                subRig[j] = buffer_read(arg0, buffer_u8);
            
            model.subRigs[i] = subRig;
        }
    }
    
    buffer_seek(arg0, buffer_seek_start, aniPos);
    var localDQ = array_create(8);
    var animNum = buffer_read(arg0, buffer_u8);
    
    if (animNum > 0)
    {
        model.animations = array_create(animNum);
        
        for (var a = 0; a < animNum; a++)
        {
            var animName = buffer_read(arg0, buffer_string);
            var anim = new smf_anim(animName);
            var keyframeNum = buffer_read(arg0, buffer_u8);
            var keyframeGrid = anim.keyframeGrid;
            anim.loop = true;
            anim.nodeNum = nodeNum;
            anim.interpolation = (2 << 0);
            
            for (var f = 0; f < keyframeNum; f++)
            {
                var keyframeTime = buffer_read(arg0, buffer_f32);
                var keyframeInd = anim_add_keyframe(anim, keyframeTime);
                var keyframe = ds_grid_get(keyframeGrid, 1, keyframeInd);
                
                for (var i = 0; i < nodeNum; i++)
                {
                    for (var l = 0; l < 8; l++)
                        localDQ[l] = buffer_read(arg0, buffer_f32);
                    
                    var node = ds_list_find_value(nodeList, i);
                    var deltaDQ = keyframe[i];
                    smf_dq_multiply(node[(4 << 0)], localDQ, deltaDQ);
                    
                    if (node[(8 << 0)])
                    {
                        deltaDQ[4] = 0;
                        deltaDQ[5] = deltaDQ[2] * node[(9 << 0)];
                        deltaDQ[6] = -deltaDQ[1] * node[(9 << 0)];
                        deltaDQ[7] = 0;
                    }
                }
            }
            
            ds_map_set(model.animMap, animName, a);
            model.animations[a] = anim;
        }
    }
    
    if (buffer_read(arg0, buffer_u8) == 239)
    {
        for (var a = 0; a < animNum; a++)
        {
            var anim = model.animations[a];
            anim.playTime = buffer_read(arg0, buffer_f32);
            anim.update_playspeed();
            anim.sampleFrameMultiplier = buffer_read(arg0, buffer_u8);
            anim.loop = buffer_read(arg0, buffer_bool);
        }
    }
    
    for (var a = 0; a < animNum; a++)
    {
        var anim = model.animations[a];
        array_set(model.sampleStrips, a, new smf_samplestrip(model.rig, anim));
    }
    
    show_debug_message("Successfully loaded SMF model " + string(arg1) + ", containing " + string(modelNum) + ((modelNum > 1) ? " models" : " model") + " and " + string(texNum) + ((texNum > 1) ? " textures" : " texture"));
    return model;
}

function smf_model_load_v10_from_buffer(arg0, arg1 = "", arg2 = new smf_model())
{
    if (arg1 != "")
    {
        var ext = string_lower(filename_ext(arg1));
        
        if (ext == ".obj")
        {
            var buff = buffer_load(arg1);
            
            if (buff < 0)
                show_debug_message("smf_model_load_from_buffer: The given buffer does not contain a valid OBJ model");
            
            var obj = mbuff_load_obj_from_buffer(buff, arg1, true);
            buffer_delete(buff);
            mbuff_add(arg2.mBuff, obj[0]);
            texpack_add_texpack(arg2.texPack, obj[1]);
            arg2.vBuff = vbuff_create_from_mbuff(arg2.mBuff);
            modelNum = array_length(obj[0]);
            texNum = array_length(obj[1]);
            show_debug_message("smf_model_load_from_buffer: Successfully loaded OBJ model " + string(arg1) + ", containing " + string(modelNum) + " models and " + string(texNum) + " textures");
            return arg2;
        }
    }
    
    buffer_seek(arg0, buffer_seek_start, 0);
    var headerText = buffer_read(arg0, buffer_string);
    
    if (headerText != "SMF_v10_by_Snidr_and_Bart")
    {
        model = smf_model_load_v7_from_buffer(arg0, arg1, arg2);
        
        if (is_struct(model))
            return model;
        
        show_debug_message("smf_model_load_from_buffer: The given buffer does not contain a valid SMF model");
        return -1;
    }
    
    var texPos = buffer_read(arg0, buffer_u32);
    var matPos = buffer_read(arg0, buffer_u32);
    var modPos = buffer_read(arg0, buffer_u32);
    var rigPos = buffer_read(arg0, buffer_u32);
    var aniPos = buffer_read(arg0, buffer_u32);
    var texMap = ds_map_create();
    buffer_seek(arg0, buffer_seek_start, texPos);
    var texNum = buffer_read(arg0, buffer_u8);
    
    if (texNum > 0)
    {
        var s = surface_create(8, 8);
        surface_set_target(s);
        draw_clear(c_white);
        surface_reset_target();
        var blankSprite = sprite_create_from_surface(s, 0, 0, 8, 8, 0, 0, 0, 0);
        var texBuff = buffer_create(1, buffer_fast, 1);
        
        for (var t = 0; t < texNum; t++)
        {
            var name = buffer_read(arg0, buffer_string);
            var w = buffer_read(arg0, buffer_u16);
            var h = buffer_read(arg0, buffer_u16);
            var spr = asset_get_index(filename_change_ext(filename_name(arg1), "_" + string(name)));
            
            if (sprite_exists(spr))
            {
                ds_map_set(texMap, name, spr);
            }
            else if (w > 0 && h > 0)
            {
                surface_resize(s, w, h);
                buffer_resize(texBuff, w * h * 4);
                buffer_copy(arg0, buffer_tell(arg0), w * h * 4, texBuff, 0);
                buffer_set_surface(texBuff, s, 0);
                ds_map_set(texMap, name, sprite_create_from_surface(s, 0, 0, w, h, 0, 0, 0, 0));
            }
            else if (is_undefined(ds_map_find_value(texMap, name)))
            {
                ds_map_set(texMap, name, sprite_duplicate(blankSprite));
            }
            
            buffer_seek(arg0, buffer_seek_relative, w * h * 4);
        }
        
        sprite_delete(blankSprite);
        surface_free(s);
        buffer_delete(texBuff);
    }
    
    buffer_seek(arg0, buffer_seek_start, modPos);
    var modelNum = buffer_read(arg0, buffer_u8);
    var model = arg2;
    model.mBuff = array_create(modelNum);
    model.vBuff = array_create(modelNum);
    model.texPack = array_create(modelNum);
    model.vis = array_create(modelNum);
    model.subRigIndex = array_create(modelNum);
    
    for (var m = 0; m < modelNum; m++)
    {
        var size = buffer_read(arg0, buffer_u32);
        var mBuff = buffer_create(size, buffer_fixed, 1);
        buffer_copy(arg0, buffer_tell(arg0), size, mBuff, 0);
        buffer_seek(arg0, buffer_seek_relative, size);
        var vBuff = vertex_create_buffer_from_buffer(mBuff, global.mBuffFormat);
        vertex_freeze(vBuff);
        model.mBuff[m] = mBuff;
        model.vBuff[m] = vBuff;
        var matName = buffer_read(arg0, buffer_string);
        var texName = buffer_read(arg0, buffer_string);
        var texInd = ds_map_find_value(texMap, texName);
        model.texPack[m] = is_undefined(texInd) ? -1 : texInd;
        model.vis[m] = buffer_read(arg0, buffer_u8);
    }
    
    ds_map_destroy(texMap);
    buffer_seek(arg0, buffer_seek_start, rigPos);
    var nodeNum = buffer_read(arg0, buffer_u8);
    
    if (nodeNum > 0)
    {
        M = array_create(16);
        
        for (var i = 0; i < nodeNum; i++)
        {
            for (var j = 0; j < 16; j++)
                M[j] = buffer_read(arg0, buffer_f32);
            
            smf_mat_orthogonalize(M);
            var node = array_create((13 << 0), 0);
            node[(1 << 0)] = smf_dq_create_from_matrix(M, array_create(8));
            node[(5 << 0)] = buffer_read(arg0, buffer_u8);
            node[(8 << 0)] = buffer_read(arg0, buffer_u8);
            node[(11 << 0)] = buffer_read(arg0, buffer_u8);
            var px = buffer_read(arg0, buffer_f32);
            var py = buffer_read(arg0, buffer_f32);
            var pz = buffer_read(arg0, buffer_f32);
            node[(10 << 0)] = (px == 0 && py == 0 && pz == 0) ? undefined : [px, py, pz];
            ds_list_set(model.rig.nodeList, i, node);
            model.rig.update_node(i);
        }
        
        model.rig.update_bindmap();
    }
    
    buffer_seek(arg0, buffer_seek_start, aniPos);
    var animNum = buffer_read(arg0, buffer_u8);
    var nodeList = model.rig.nodeList;
    var M = array_create(16);
    var poseDQ = array_create(nodeNum);
    model.animations = array_create(animNum);
    model.sampleStrips = array_create(animNum);
    
    for (var a = 0; a < animNum; a++)
    {
        var animName = buffer_read(arg0, buffer_string);
        var anim = new smf_anim(animName);
        anim.loop = buffer_read(arg0, buffer_u8);
        anim.playTime = buffer_read(arg0, buffer_f32);
        anim.interpolation = buffer_read(arg0, buffer_u8);
        anim.sampleFrameMultiplier = buffer_read(arg0, buffer_u8);
        anim.nodeNum = nodeNum;
        anim.update_playspeed();
        ds_map_set(model.animMap, animName, a);
        model.animations[a] = anim;
        var frameNum = buffer_read(arg0, buffer_u32);
        
        for (var f = 0; f < frameNum; f++)
        {
            var frameTime = buffer_read(arg0, buffer_f32);
            var keyframeInd = anim.keyframe_add(frameTime);
            var prevFrame;
            
            if (f > 0)
                prevFrame = keyframe;
            
            var keyframe = ds_grid_get(anim.keyframeGrid, 1, keyframeInd);
            
            for (var i = 0; i < nodeNum; i++)
            {
                for (var l = 0; l < 16; l++)
                    M[l] = buffer_read(arg0, buffer_f32);
                
                smf_mat_orthogonalize(M);
                poseDQ[i] = smf_dq_create_from_matrix(M, array_create(8));
                var node = ds_list_find_value(nodeList, i);
                
                if (i > 0)
                {
                    var poseLocalDQ = smf_dq_multiply(smf_dq_get_conjugate(poseDQ[node[(5 << 0)]], array_create(8)), poseDQ[i], array_create(8));
                    keyframe[i] = smf_dq_multiply(node[(4 << 0)], poseLocalDQ, array_create(8));
                    
                    if (f == 0)
                    {
                        if (keyframe[i][3] < 0)
                        {
                        }
                    }
                    else if (smf_quat_dot(prevFrame[i], keyframe[i]) < 0)
                    {
                        smf_dq_invert(keyframe[i]);
                    }
                }
                else
                {
                    keyframe[i] = smf_dq_multiply(node[(3 << 0)], poseDQ[i], array_create(8));
                }
            }
        }
    }
    
    show_debug_message("Successfully loaded SMF model " + string(arg1) + ", containing " + string(modelNum) + " models and " + string(texNum) + " textures");
    return model;
}
