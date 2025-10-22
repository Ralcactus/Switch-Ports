function smf_model() constructor
{
    static destroy = function(arg0 = true)
    {
        mbuff_delete(mBuff);
        vbuff_delete(vBuff);
        rig.destroy();
        ds_map_destroy(animMap);
        var num = array_length(animations);
        
        for (var i = 0; i < num; i++)
            anim_delete(animations[i]);
        
        if (arg0)
        {
            num = array_length(texPack);
            
            for (var i = 0; i < num; i++)
            {
                if (sprite_exists(texPack[i]))
                    sprite_delete(texPack[i]);
            }
        }
    };
    
    static submit = function()
    {
        var num = array_length(vBuff);
        
        if (num <= 0)
            exit;
        
        var shader = shader_current();
        
        if (argument_count == 0 || shader < 0)
        {
            vbuff_draw(vBuff, texPack);
        }
        else
        {
            var sample = argument[0];
            var subRigNum = array_length(subRigs);
            var t = array_length(texPack);
            var prevR = -1;
            
            for (var i = 0; i < num; i++)
            {
                if (subRigNum <= 1)
                {
                    sample_set_uniform(shader, sample);
                }
                else
                {
                    var r = subRigIndex[i];
                    
                    if (r != prevR)
                    {
                        var subRig = subRigs[r];
                        var bNum = array_length(subRig);
                        
                        for (var b = 0; b < bNum; b++)
                            array_copy(global.SMFtempSample, b * 8, sample, subRig[b] * 8, 8);
                        
                        sample_set_uniform(shader, global.SMFtempSample);
                        prevR = r;
                    }
                }
                
                var tex = -1;
                
                if (t > 0)
                {
                    var spr = texPack[i % t];
                    tex = (spr >= 0) ? sprite_get_texture(spr, 0) : -1;
                }
                
                vertex_submit(vBuff[i], pr_trianglelist, tex);
            }
        }
    };
    
    static enable_compatibility = function(arg0, arg1)
    {
        arg0 = clamp(arg0, 1, 16);
        arg1 = clamp(arg1, 0, 16 - arg0);
        
        if (compatibility)
        {
            show_debug_message("Error: Cannot modify compatibility model");
            exit;
        }
        
        partition_rig(arg0, arg1);
        compatibility = true;
        var num = array_length(mBuff);
        var scale = 0.8181818181818182;
        
        for (var m = 0; m < num; m++)
        {
            var buff = mBuff[m];
            var buffSize = buffer_get_size(buff);
            var newBuff = buffer_create(round(buffSize * scale), buffer_fixed, 1);
            
            for (var i = 0; i < buffSize; i += 44)
            {
                buffer_copy(buff, i, 32, newBuff, round(i * scale));
                buffer_seek(buff, buffer_seek_start, i + 36);
                var b1 = buffer_read(buff, buffer_u8);
                var b2 = buffer_read(buff, buffer_u8);
                var b3 = buffer_read(buff, buffer_u8);
                var b4 = buffer_read(buff, buffer_u8);
                var w1 = round((buffer_read(buff, buffer_u8) * 15) / 255);
                var w2 = round((buffer_read(buff, buffer_u8) * 15) / 255);
                var w3 = round((buffer_read(buff, buffer_u8) * 15) / 255);
                var w4 = round((buffer_read(buff, buffer_u8) * 15) / 255);
                buffer_seek(newBuff, buffer_seek_start, round((i * scale) + 32));
                buffer_write(newBuff, buffer_u8, round(b1 + (16 * w1)));
                buffer_write(newBuff, buffer_u8, round(b2 + (16 * w2)));
                buffer_write(newBuff, buffer_u8, round(b3 + (16 * w3)));
                buffer_write(newBuff, buffer_u8, round(b4 + (16 * w4)));
            }
            
            buffer_delete(buff);
            vertex_delete_buffer(vBuff[m]);
            mBuff[m] = newBuff;
            vBuff[m] = vertex_create_buffer_from_buffer(mBuff[m], global.mBuffStdFormat);
            vertex_freeze(vBuff[m]);
        }
    };
    
    static get_animation = function(arg0)
    {
        var animInd = ds_map_find_value(animMap, arg0);
        
        if (is_undefined(animInd))
            return -1;
        
        return animations[animInd];
    };
    
    static partition_rig = function(arg0, arg1)
    {
        if (compatibility)
        {
            show_debug_message("Error: Cannot modify compatibility model");
            exit;
        }
        
        if (partitioned)
        {
            show_debug_message("Error in script partition_rig: Model has already been partitioned");
            exit;
        }
        
        var nodeList = rig.nodeList;
        var bindMap = rig.bindMap;
        var nodeNum = ds_list_size(nodeList);
        var boneNum = rig.boneNum;
        var batchInd = 0;
        var batchNum = ceil(boneNum / arg0);
        var batchSize = array_create(batchNum);
        var batchMap = array_create(boneNum);
        var subRigPri = [];
        
        if (batchNum <= 1)
            return -1;
        
        for (var i = 0; i < nodeNum; i++)
        {
            var node = ds_list_find_value(nodeList, i);
            var children = node[(6 << 0)];
            var childNum = array_length(children);
            
            for (var j = 0; j < childNum; j++)
            {
                var child = children[j];
                var bone = ds_list_find_value(bindMap, child);
                
                if (bone < 0)
                    continue;
                
                if (batchSize[batchInd] == 0)
                    subRigPri[batchInd] = ds_priority_create();
                
                batchMap[bone] = batchInd;
                batchSize[batchInd]++;
                
                if (batchSize[batchInd] >= arg0)
                {
                    batchInd++;
                    batchSize[batchInd] = 0;
                }
            }
        }
        
        var newMbuff = [];
        var mBuffNum = array_length(mBuff);
        var bytesPerVert = 44;
        var b1 = array_create(3);
        var b2 = array_create(3);
        var b3 = array_create(3);
        var b4 = array_create(3);
        var w1 = array_create(3);
        var w2 = array_create(3);
        var w3 = array_create(3);
        var w4 = array_create(3);
        
        for (var i = 0; i < mBuffNum; i++)
        {
            var buff = mBuff[i];
            var buffSize = buffer_get_size(buff);
            
            for (var j = 0; j < buffSize; j += bytesPerVert)
            {
                for (var k = 0; k < 3; k++)
                {
                    buffer_seek(buff, buffer_seek_start, (j + bytesPerVert) - 8);
                    b1[k] = buffer_read(buff, buffer_u8);
                    b2[k] = buffer_read(buff, buffer_u8);
                    b3[k] = buffer_read(buff, buffer_u8);
                    b4[k] = buffer_read(buff, buffer_u8);
                    w1[k] = buffer_read(buff, buffer_u8);
                    w2[k] = buffer_read(buff, buffer_u8);
                    w3[k] = buffer_read(buff, buffer_u8);
                    w4[k] = buffer_read(buff, buffer_u8);
                }
                
                batchInd = batchMap[b1[0]];
                var pri = subRigPri[batchInd];
                
                for (var k = 0; k < 3; k++)
                {
                    var p = ds_priority_find_priority(pri, b1[k]);
                    
                    if (is_undefined(p))
                        ds_priority_add(pri, b1[k], w1[k]);
                    else if (p < w1[k])
                        ds_priority_change_priority(pri, b1[k], w1[k]);
                    
                    p = ds_priority_find_priority(pri, b2[k]);
                    
                    if (is_undefined(p))
                        ds_priority_add(pri, b2[k], w2[k]);
                    else if (p < w2[k])
                        ds_priority_change_priority(pri, b2[k], w2[k]);
                    
                    p = ds_priority_find_priority(pri, b3[k]);
                    
                    if (is_undefined(p))
                        ds_priority_add(pri, b3[k], w3[k]);
                    else if (p < w3[k])
                        ds_priority_change_priority(pri, b3[k], w3[k]);
                    
                    p = ds_priority_find_priority(pri, b4[k]);
                    
                    if (is_undefined(p))
                        ds_priority_add(pri, b4[k], w4[k]);
                    else if (p < w4[k])
                        ds_priority_change_priority(pri, b4[k], w4[k]);
                }
            }
        }
        
        subRigs = array_create(batchNum);
        
        for (var i = 0; i < batchNum; i++)
        {
            var pri = subRigPri[i];
            var num = min(arg0 + arg1, ds_priority_size(pri));
            var subRig = array_create(num);
            
            for (var j = 0; j < num; j++)
                subRig[j] = ds_priority_delete_max(pri);
            
            subRigs[i] = subRig;
            ds_priority_destroy(pri);
        }
        
        var totalBatches = 0;
        var bytesPerTri = bytesPerVert * 3;
        var batches = array_create(mBuffNum);
        
        for (var i = 0; i < mBuffNum; i++)
        {
            batches[i] = array_create(batchNum, -1);
            var batch = batches[i];
            var buff = mBuff[i];
            var buffSize = buffer_get_size(buff);
            
            for (var j = 0; j < buffSize; j += bytesPerTri)
            {
                buffer_seek(buff, buffer_seek_start, (j + bytesPerVert) - 8);
                b1 = buffer_read(buff, buffer_u8);
                batchInd = batchMap[b1];
                
                if (batch[batchInd] < 0)
                {
                    batch[batchInd] = buffer_create(1, buffer_grow, 1);
                    totalBatches++;
                }
                
                var buffPos = (buffer_tell(batch[batchInd]) div bytesPerTri) * bytesPerTri;
                buffer_copy(buff, j, bytesPerTri, batch[batchInd], buffPos);
                var subRig = subRigs[batchInd];
                var newBuff = batch[batchInd];
                var prevB1 = 0;
                
                for (var k = 0; k < 3; k++)
                {
                    buffer_seek(newBuff, buffer_seek_start, (buffPos + (k * bytesPerVert) + bytesPerVert) - 8);
                    b1 = smf_get_array_index(subRig, buffer_read(newBuff, buffer_u8));
                    b2 = smf_get_array_index(subRig, buffer_read(newBuff, buffer_u8));
                    b3 = smf_get_array_index(subRig, buffer_read(newBuff, buffer_u8));
                    b4 = smf_get_array_index(subRig, buffer_read(newBuff, buffer_u8));
                    w1 = buffer_read(newBuff, buffer_u8);
                    w2 = buffer_read(newBuff, buffer_u8) * (b2 >= 0);
                    w3 = buffer_read(newBuff, buffer_u8) * (b3 >= 0);
                    w4 = buffer_read(newBuff, buffer_u8) * (b4 >= 0);
                    var sum = (w1 + w2 + w3 + w4) / 255;
                    
                    if (sum == 0)
                        sum = 1;
                    
                    buffer_seek(newBuff, buffer_seek_start, (buffPos + (k * bytesPerVert) + bytesPerVert) - 8);
                    buffer_write(newBuff, buffer_u8, (b1 < 0) ? prevB1 : b1);
                    buffer_write(newBuff, buffer_u8, (b2 < 0) ? 0 : b2);
                    buffer_write(newBuff, buffer_u8, (b3 < 0) ? 0 : b3);
                    buffer_write(newBuff, buffer_u8, (b4 < 0) ? 0 : b4);
                    buffer_write(newBuff, buffer_u8, w1 / sum);
                    buffer_write(newBuff, buffer_u8, w2 / sum);
                    buffer_write(newBuff, buffer_u8, w3 / sum);
                    buffer_write(newBuff, buffer_u8, w4 / sum);
                    
                    if (b1 >= 0)
                        prevB1 = b1;
                }
                
                buffer_seek(newBuff, buffer_seek_start, buffPos + bytesPerTri);
            }
        }
        
        var texNum = min(array_length(texPack), mBuffNum);
        newMbuff = array_create(totalBatches);
        var newVbuff = array_create(totalBatches);
        var newTexpack = array_create(totalBatches);
        var newVis = array_create(totalBatches);
        var mbuffInd = 0;
        
        for (var i = 0; i < mBuffNum; i++)
        {
            var tex = texPack[i % texNum];
            var batch = batches[i];
            
            for (var j = 0; j < batchNum; j++)
            {
                if (batch[j] >= 0)
                {
                    var size = buffer_tell(batch[j]);
                    newMbuff[mbuffInd] = buffer_create(size, buffer_fixed, 1);
                    newTexpack[mbuffInd] = tex;
                    newVis[mbuffInd] = vis[i];
                    buffer_copy(batch[j], 0, size, newMbuff[mbuffInd], 0);
                    buffer_delete(batch[j]);
                    subRigInd[mbuffInd] = j;
                    mbuffInd++;
                }
            }
            
            buffer_delete(mBuff[i]);
            vertex_delete_buffer(vBuff[i]);
        }
        
        mBuff = newMbuff;
        vBuff = vbuff_create_from_mbuff(newMbuff);
        texPack = newTexpack;
        vis = newVis;
        partitioned = true;
    };
    
    mBuff = [];
    vBuff = [];
    vis = [];
    texPack = [];
    rig = new smf_rig();
    subRigs = [];
    subRigIndex = [];
    partitioned = false;
    compatibility = false;
    animMap = ds_map_create();
    animations = [];
    sampleStrips = [];
}
