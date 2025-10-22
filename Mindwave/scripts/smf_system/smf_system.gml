global.SMFtempSample = array_create(128);
global.animTempV = array_create(3);
global.AnimTempQ1 = array_create(8);
global.AnimTempQ2 = array_create(8);
global.AnimTempQ3 = array_create(8);
global.AnimTempQ4 = array_create(8);
global.AnimTempM = array_create(16);
global.AnimUniMap = ds_map_create();
global.AnimTempWorldDQ = [];
global._SMFAsyncQueue = ds_queue_create();
global._SMFAsyncBuffer = buffer_create(1, buffer_grow, 1);
global._SMFAsyncHandle = -1;
global._SMFAsyncModel = -1;
global._SMFAsyncText = "";

function smf_model_load(arg0)
{
    if (!file_exists(arg0))
        return -1;
    
    var ext = string_lower(filename_ext(arg0));
    
    if (ext == ".obj")
        return smf_model_load_obj(arg0);
    
    if (ext == ".smf")
    {
        var loadBuff = buffer_load(arg0);
        var model = smf_model_load_from_buffer(loadBuff, arg0);
        buffer_delete(loadBuff);
        return model;
    }
    
    show_debug_message("smf_model_load could not load file " + string(arg0));
    return -1;
}

function smf_model_get_animation(arg0, arg1)
{
    return arg0.get_animation(arg1);
}

function smf_model_load_from_buffer(arg0, arg1 = "", arg2 = new smf_model())
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
    
    if (headerText != "SMF_v11_by_Snidr_and_Bart")
    {
        model = smf_model_load_v10_from_buffer(arg0, arg1, arg2);
        
        if (is_struct(model))
            return model;
        
        show_debug_message("smf_model_load_from_buffer: The given buffer does not contain a valid SMF model");
        return -1;
    }
    
    var texPos = buffer_read(arg0, buffer_u32);
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
    var nodeNum = buffer_read(arg0, buffer_u32);
    
    if (nodeNum > 0)
    {
        for (var i = 0; i < nodeNum; i++)
        {
            var Q = array_create(8);
            
            for (var j = 0; j < 8; j++)
                Q[j] = buffer_read(arg0, buffer_f32);
            
            var node = array_create((13 << 0), 0);
            node[(1 << 0)] = Q;
            node[(5 << 0)] = buffer_read(arg0, buffer_u32);
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
            
            if (f > 0)
                var prevFrame = keyframe;
            
            var keyframe = ds_grid_get(anim.keyframeGrid, 1, keyframeInd);
            
            for (var i = 0; i < nodeNum; i++)
            {
                var Q = array_create(8);
                
                for (var l = 0; l < 8; l++)
                    Q[l] = buffer_read(arg0, buffer_f32);
                
                poseDQ[i] = Q;
                var node = ds_list_find_value(nodeList, i);
                
                if (i == 0)
                {
                    keyframe[0] = smf_dq_multiply(node[(3 << 0)], poseDQ[i], array_create(8));
                }
                else
                {
                    var poseLocalDQ = smf_dq_multiply(smf_dq_get_conjugate(poseDQ[node[(5 << 0)]], array_create(8)), poseDQ[i], array_create(8));
                    keyframe[i] = smf_dq_multiply(node[(4 << 0)], poseLocalDQ, array_create(8));
                }
            }
        }
    }
    
    show_debug_message("Successfully loaded SMF model " + string(arg1) + ", containing " + string(modelNum) + " models and " + string(texNum) + " textures");
    return model;
}

function smf_model_load_obj(arg0)
{
    if (instance_exists(obj_minigame_controller) && struct_exists(obj_minigame_controller.preloads.smf_obj, arg0) && !obj_minigame_controller.preloading)
    {
        return struct_get(obj_minigame_controller.preloads.smf_obj, arg0);
    }
    else
    {
        if (!file_exists(arg0))
            return -1;
        
        var model = new smf_model();
        var buff = buffer_load(arg0);
        var obj = mbuff_load_obj_from_buffer(buffer_load(arg0), true);
        buffer_delete(buff);
        
        if (!is_array(obj))
            return -1;
        
        model.mBuff = obj[0];
        model.texPack = obj[1];
        model.vBuff = vbuff_create_from_mbuff(obj[0]);
        return model;
    }
}

function smf_model_submit()
{
    var model = argument[0];
    
    if (argument_count == 1)
        model.submit();
    else
        model.submit(argument[1]);
}

function smf_model_destroy(arg0, arg1)
{
    arg0.destroy(arg1);
    arg0 = undefined;
}

function smf_model_enable_compatibility(arg0, arg1, arg2)
{
    arg0.enable_compatibility(arg1, arg2);
}

function smf_model_partition_rig(arg0, arg1, arg2)
{
    arg0.partition_rig(arg1, arg2);
}

function smf_model_save(arg0, arg1, arg2)
{
    var mBuff = arg0.mBuff;
    var texPack = arg0.texPack;
    var vis = arg0.vis;
    var rig = arg0.rig;
    var animArray = arg0.animations;
    var partitioned = arg0.partitioned;
    var subRigIndex = arg0.subRigIndex;
    var subRigs = arg0.subRigs;
    var modelNum = array_length(mBuff);
    var saveBuff = buffer_create(100, buffer_grow, 1);
    buffer_write(saveBuff, buffer_string, "SMF_v11_by_Snidr_and_Bart");
    var texHeader = buffer_tell(saveBuff);
    buffer_write(saveBuff, buffer_u32, 0);
    var modHeader = buffer_tell(saveBuff);
    buffer_write(saveBuff, buffer_u32, 0);
    var rigHeader = buffer_tell(saveBuff);
    buffer_write(saveBuff, buffer_u32, 0);
    var aniHeader = buffer_tell(saveBuff);
    buffer_write(saveBuff, buffer_u32, 0);
    buffer_write(saveBuff, buffer_u32, 0);
    gpu_push_state();
    gpu_set_zwriteenable(false);
    gpu_set_ztestenable(false);
    gpu_set_cullmode(0);
    var texPos = buffer_tell(saveBuff);
    buffer_poke(saveBuff, texHeader, buffer_u32, texPos);
    buffer_write(saveBuff, buffer_u8, 0);
    var writtenTexMap = ds_map_create();
    var n = array_length(mBuff);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    var s = surface_create(1, 1);
    var texBuff = buffer_create(1, buffer_fast, 1);
    
    for (var t = 0; t < modelNum; t++)
    {
        var tex = texPack[t];
        
        if (!is_undefined(ds_map_find_value(writtenTexMap, tex)))
            continue;
        
        ds_map_set(writtenTexMap, tex, true);
        buffer_write(saveBuff, buffer_string, string(tex));
        
        if (arg2)
        {
            var w = sprite_get_width(tex);
            var h = sprite_get_height(tex);
            surface_resize(s, w, h);
            surface_set_target(s);
            draw_clear_alpha(c_white, 0);
            draw_sprite_ext(tex, 0, 0, h, 1, -1, 0, c_white, 1);
            surface_reset_target();
            buffer_resize(texBuff, w * h * 4);
            buffer_get_surface(texBuff, s, 0);
            buffer_write(saveBuff, buffer_u16, w);
            buffer_write(saveBuff, buffer_u16, h);
            buffer_copy(texBuff, 0, w * h * 4, saveBuff, buffer_tell(saveBuff));
            buffer_seek(saveBuff, buffer_seek_relative, w * h * 4);
        }
        else
        {
            buffer_write(saveBuff, buffer_u16, 0);
            buffer_write(saveBuff, buffer_u16, 0);
        }
    }
    
    surface_free(s);
    buffer_poke(saveBuff, texPos, buffer_u8, ds_map_size(writtenTexMap));
    ds_map_destroy(writtenTexMap);
    buffer_delete(texBuff);
    gpu_pop_state();
    
    if (!arg2)
    {
        buffer_write(saveBuff, buffer_u8, 99);
        var texNum = min(array_length(texPack), array_length(mBuff));
        
        for (var i = 0; i < texNum; i++)
            sprite_save(texPack[i], 0, filename_change_ext(arg1, "_" + string(texPack[i]) + ".png"));
    }
    
    buffer_poke(saveBuff, modHeader, buffer_u32, buffer_tell(saveBuff));
    buffer_write(saveBuff, buffer_u8, modelNum);
    
    for (var m = 0; m < modelNum; m++)
    {
        var size = buffer_get_size(mBuff[m]);
        buffer_write(saveBuff, buffer_u32, size);
        buffer_copy(mBuff[m], 0, size, saveBuff, buffer_tell(saveBuff));
        buffer_seek(saveBuff, buffer_seek_relative, size);
        buffer_write(saveBuff, buffer_string, "default");
        buffer_write(saveBuff, buffer_string, string(texPack[m]));
        buffer_write(saveBuff, buffer_u8, vis[m]);
    }
    
    buffer_poke(saveBuff, rigHeader, buffer_u32, buffer_tell(saveBuff));
    var nodeNum = 0;
    var nodeList;
    
    if (is_struct(rig))
    {
        nodeList = rig.nodeList;
        nodeNum = ds_list_size(nodeList);
    }
    
    buffer_write(saveBuff, buffer_u32, nodeNum);
    var M = array_create(16);
    
    for (var i = 0; i < nodeNum; i++)
    {
        var node = ds_list_find_value(nodeList, i);
        var DQ = node[(1 << 0)];
        
        for (var k = 0; k < 8; k++)
            buffer_write(saveBuff, buffer_f32, DQ[k]);
        
        buffer_write(saveBuff, buffer_u32, node[(5 << 0)]);
        buffer_write(saveBuff, buffer_u8, node[(8 << 0)]);
        buffer_write(saveBuff, buffer_u8, node[(11 << 0)]);
        var pAxis = node[(10 << 0)];
        
        if (is_array(pAxis))
        {
            buffer_write(saveBuff, buffer_f32, pAxis[0]);
            buffer_write(saveBuff, buffer_f32, pAxis[1]);
            buffer_write(saveBuff, buffer_f32, pAxis[2]);
        }
        else
        {
            buffer_write(saveBuff, buffer_f32, 0);
            buffer_write(saveBuff, buffer_f32, 0);
            buffer_write(saveBuff, buffer_f32, 0);
        }
    }
    
    buffer_poke(saveBuff, aniHeader, buffer_u32, buffer_tell(saveBuff));
    var animNum = array_length(animArray);
    buffer_write(saveBuff, buffer_u8, animNum);
    
    for (var a = 0; a < animNum; a++)
    {
        var anim = animArray[a];
        buffer_write(saveBuff, buffer_string, anim.name);
        buffer_write(saveBuff, buffer_u8, anim.loop);
        buffer_write(saveBuff, buffer_f32, anim.playTime);
        buffer_write(saveBuff, buffer_u8, anim.interpolation);
        buffer_write(saveBuff, buffer_u8, anim.sampleFrameMultiplier);
        var keyframeGrid = anim.keyframeGrid;
        var frameNum = ds_grid_height(keyframeGrid);
        buffer_write(saveBuff, buffer_u32, frameNum);
        
        for (var f = 0; f < frameNum; f++)
        {
            buffer_write(saveBuff, buffer_f32, ds_grid_get(keyframeGrid, 0, f));
            
            for (var i = 0; i < nodeNum; i++)
            {
                var DQ = anim.keyframe_get_node_dq(rig, f, i);
                
                for (var k = 0; k < 8; k++)
                    buffer_write(saveBuff, buffer_f32, DQ[k]);
            }
        }
    }
    
    buffer_save(saveBuff, arg1);
    buffer_delete(saveBuff);
}

function smf_model_load_async(arg0)
{
    var model = new smf_model();
    
    if (global._SMFAsyncHandle < 0)
    {
        _smf_async_start([arg0, model]);
    }
    else
    {
        ds_queue_enqueue(global._SMFAsyncQueue, [arg0, model]);
        global._SMFAsyncText = "SMF Async Loading: Enqueued model \"" + arg0 + "\"";
        show_debug_message(global._SMFAsyncText);
    }
    
    return model;
}

function _smf_async_start(arg0)
{
    global._SMFAsyncHandle = buffer_load_async(global._SMFAsyncBuffer, arg0[0], 0, -1);
    
    if (global._SMFAsyncHandle < 0)
    {
        global._SMFAsyncText = "ERROR: Failed to load \"" + global._SMFAsyncModel[0] + "\"";
        show_debug_message(global._SMFAsyncText);
        return false;
    }
    
    global._SMFAsyncModel = arg0;
    global._SMFAsyncText = "SMF Async Loading: Started loading model \"" + global._SMFAsyncModel[0] + "\"";
    show_debug_message(global._SMFAsyncText);
}

function smf_async_update()
{
    if (ds_map_find_value(async_load, "id") == global._SMFAsyncHandle)
    {
        if (ds_map_find_value(async_load, "status") == false)
        {
            global._SMFAsyncText = "SMF Async Loading: Load failed! \"" + global._SMFAsyncModel[0] + "\"";
            show_debug_message(global._SMFAsyncText);
        }
        else
        {
            global._SMFAsyncText = "SMF Async Loading: Successfully loaded file \"" + global._SMFAsyncModel[0] + "\"";
            show_debug_message(global._SMFAsyncText);
            smf_model_load_from_buffer(global._SMFAsyncBuffer, global._SMFAsyncModel[0], global._SMFAsyncModel[1]);
        }
        
        if (!ds_queue_empty(global._SMFAsyncQueue))
        {
            _smf_async_start(ds_queue_dequeue(global._SMFAsyncQueue));
            return false;
        }
        
        global._SMFAsyncText = "SMF Async Loading: Loading finished";
        show_debug_message(global._SMFAsyncText);
        global._SMFAsyncHandle = -1;
        return true;
    }
}
