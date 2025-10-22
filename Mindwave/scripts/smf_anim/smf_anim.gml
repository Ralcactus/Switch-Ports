function smf_anim(arg0) constructor
{
    static trim = function(arg0)
    {
        var newGrid = ds_grid_create(2, newNum);
        var i = 0;
        var ind = 0;
        
        while (ind < keyframeNum)
        {
            ds_grid_set(newGrid, 0, i, ds_grid_get(keyframeGrid, 0, floor(ind)));
            ds_grid_set(newGrid, 1, i, ds_grid_get(keyframeGrid, 1, floor(ind)));
            ind += (1 / arg0);
            i++;
        }
        
        ds_grid_destroy(keyframeGrid);
        ds_grid_resize(newGrid, 2, i);
        keyframeGrid = newGrid;
        keyframeNum = i;
    };
    
    static destroy = function()
    {
        ds_grid_destroy(keyframeGrid);
    };
    
    static duplicate = function()
    {
        var newAnim = new smf_anim(name + "2");
        newAnim.nodeNum = nodeNum;
        newAnim.interpolation = interpolation;
        newAnim.loop = loop;
        newAnim.sampleFrameMultiplier = sampleFrameMultiplier;
        newAnim.playTime = playTime;
        newAnim.playSpeed = playSpeed;
        newAnim.keyframeNum = keyframeNum;
        ds_grid_resize(newAnim.keyframeGrid, 2, keyframeNum);
        
        for (var i = 0; i < keyframeNum; i++)
        {
            var keyframe = ds_grid_get(keyframeGrid, 1, i);
            var newKeyframe = array_create(nodeNum);
            
            for (var j = 0; j < nodeNum; j++)
            {
                newKeyframe[j] = array_create(8);
                array_copy(newKeyframe[j], 0, keyframe[j], 0, 8);
            }
            
            ds_grid_set(newAnim.keyframeGrid, 0, i, ds_grid_get(keyframeGrid, 0, i));
            ds_grid_set(newAnim.keyframeGrid, 1, i, newKeyframe);
        }
        
        return newAnim;
    };
    
    static update = function()
    {
        for (var f = 0; f < keyframeNum; f++)
        {
            var oldKeyframe = ds_grid_get(keyframeGrid, 1, f);
            var num = min(nodeNum, array_length(oldKeyframe));
            var keyframe = array_create(nodeNum);
            array_copy(keyframe, 0, oldKeyframe, 0, array_length(oldKeyframe));
            
            for (var i = num; i < nodeNum; i++)
                keyframe[i] = [0, 0, 0, 1, 0, 0, 0, 0];
            
            ds_grid_set(keyframeGrid, 1, f, keyframe);
        }
    };
    
    static update_playspeed = function()
    {
        playSpeed = 1000 / playTime / game_get_speed(gamespeed_fps);
    };
    
    static generate_sample = function(arg0, arg1, arg2)
    {
        if (is_undefined(arg2))
            arg2 = interpolation;
        
        if (arg0.boneNum <= 0)
            return [0, 0, 0, 1, 0, 0, 0, 0];
        
        var timeDiv = floor(arg1);
        
        if (arg1 != 0 && arg1 == timeDiv)
            arg1 = 1;
        else
            arg1 -= timeDiv;
        
        var nodeList = arg0.nodeList;
        
        if (ds_list_size(nodeList) != nodeNum)
        {
            nodeNum = ds_list_size(nodeList);
            update();
        }
        
        var bonesInSample = 0;
        var tempDQ = global.AnimTempQ3;
        var worldDQ = global.AnimTempWorldDQ;
        
        if (nodeNum > array_length(worldDQ))
        {
            global.AnimTempWorldDQ = array_create(nodeNum);
            
            for (var i = 0; i < nodeNum; i++)
                global.AnimTempWorldDQ[i] = array_create(8);
            
            worldDQ = global.AnimTempWorldDQ;
        }
        
        var node = ds_list_find_value(nodeList, 0);
        array_copy(worldDQ[0], 0, node[(1 << 0)], 0, 8);
        var returnSample = array_create(arg0.boneNum * 8, 0);
        
        switch (arg2)
        {
            case (0 << 0):
                var keyframeA = ds_grid_get(keyframeGrid, 1, keyframe_get(arg1));
                
                for (var i = 0; i < nodeNum; i++)
                {
                    array_copy(tempDQ, 0, keyframeA[i], 0, 8);
                    node = ds_list_find_value(nodeList, i);
                    smf_dq_multiply(node[(2 << 0)], tempDQ, tempDQ);
                    smf_dq_multiply(worldDQ[node[(5 << 0)]], tempDQ, worldDQ[i]);
                    
                    if (!node[(8 << 0)])
                        continue;
                    
                    smf_dq_normalize(smf_dq_multiply(worldDQ[i], node[(3 << 0)], tempDQ));
                    array_copy(returnSample, bonesInSample * 8, tempDQ, 0, 8);
                    bonesInSample++;
                }
                
                break;
            
            case (1 << 0):
                var keyframeArray = keyframe_get_linear(arg1);
                var keyframeA = ds_grid_get(keyframeGrid, 1, array_get(keyframeArray, 0));
                var keyframeB = ds_grid_get(keyframeGrid, 1, array_get(keyframeArray, 1));
                
                for (var i = 0; i < nodeNum; i++)
                {
                    var A = keyframeA[i];
                    var B = keyframeB[i];
                    
                    if (smf_quat_dot(A, B) < 0)
                        smf_dq_invert(A);
                    
                    smf_dq_lerp(A, B, keyframeArray[2], tempDQ);
                    smf_dq_normalize(tempDQ);
                    node = ds_list_find_value(nodeList, i);
                    smf_dq_multiply(node[(2 << 0)], tempDQ, tempDQ);
                    smf_dq_multiply(worldDQ[node[(5 << 0)]], tempDQ, worldDQ[i]);
                    
                    if (!node[(8 << 0)])
                        continue;
                    
                    smf_dq_normalize(smf_dq_multiply(worldDQ[i], node[(3 << 0)], tempDQ));
                    array_copy(returnSample, bonesInSample * 8, tempDQ, 0, 8);
                    bonesInSample++;
                }
                
                break;
            
            case (2 << 0):
                var keyframeArray = keyframe_get_quadratic(arg1);
                var keyframeA = ds_grid_get(keyframeGrid, 1, array_get(keyframeArray, 0));
                var keyframeB = ds_grid_get(keyframeGrid, 1, array_get(keyframeArray, 1));
                var keyframeC = ds_grid_get(keyframeGrid, 1, array_get(keyframeArray, 2));
                
                for (var i = 0; i < nodeNum; i++)
                {
                    var A = keyframeA[i];
                    var B = keyframeB[i];
                    var C = keyframeC[i];
                    
                    if (smf_quat_dot(A, B) < 0)
                        smf_dq_invert(A);
                    
                    if (smf_quat_dot(B, C) < 0)
                        smf_dq_invert(C);
                    
                    smf_dq_quadratic_interpolate(A, B, C, keyframeArray[3], tempDQ);
                    smf_dq_normalize(tempDQ);
                    node = ds_list_find_value(nodeList, i);
                    smf_dq_multiply(node[(2 << 0)], tempDQ, tempDQ);
                    smf_dq_multiply(worldDQ[node[(5 << 0)]], tempDQ, worldDQ[i]);
                    
                    if (!node[(8 << 0)])
                        continue;
                    
                    smf_dq_normalize(smf_dq_multiply(worldDQ[i], node[(3 << 0)], tempDQ));
                    array_copy(returnSample, bonesInSample * 8, tempDQ, 0, 8);
                    bonesInSample++;
                }
                
                break;
        }
        
        return returnSample;
    };
    
    static keyframe_add = function(arg0)
    {
        arg0 = floor(clamp(arg0, 0, 0.99999) * 1000) / 1000;
        var keyframeInd = keyframeNum;
        var keyframe;
        
        for (var i = 0; i < keyframeNum; i++)
        {
            if (ds_grid_get(keyframeGrid, 0, i) == arg0)
            {
                keyframeInd = i;
                keyframe = ds_grid_get(keyframeGrid, 1, i);
                break;
            }
        }
        
        if (keyframeInd == keyframeNum)
        {
            keyframeNum++;
            ds_grid_resize(keyframeGrid, 2, keyframeInd + 1);
            keyframe = array_create(nodeNum, 0);
        }
        
        for (var i = 0; i < nodeNum; i++)
            keyframe[i] = [0, 0, 0, 1, 0, 0, 0, 0];
        
        ds_grid_set(keyframeGrid, 0, keyframeInd, arg0);
        ds_grid_set(keyframeGrid, 1, keyframeInd, keyframe);
        ds_grid_sort(keyframeGrid, 0, true);
        
        for (var i = 0; i < keyframeNum; i++)
        {
            if (ds_grid_get(keyframeGrid, 0, i) == arg0)
            {
                keyframeInd = i;
                break;
            }
        }
        
        return keyframeInd;
    };
    
    static keyframe_delete = function(arg0)
    {
        var i = arg0 + 1;
        
        while (i < keyframeNum)
        {
            ds_grid_set(keyframeGrid, 0, i - 1, ds_grid_get(keyframeGrid, 0, i));
            ds_grid_set(keyframeGrid, 1, i - 1, ds_grid_get(keyframeGrid, 1, i));
            i++;
        }
        
        keyframeNum--;
        ds_grid_resize(keyframeGrid, 2, keyframeNum);
    };
    
    static keyframe_duplicate = function(arg0, arg1)
    {
        arg1 = floor(clamp(arg1, 0, 0.99999) * 1000) / 1000;
        
        for (var i = 0; i < keyframeNum; i++)
        {
            if (ds_grid_get(keyframeGrid, 0, i) == arg1)
                return ds_grid_get(keyframeGrid, 0, i);
        }
        
        var srcKeyframe = ds_grid_get(keyframeGrid, 1, arg0);
        var keyframeInd = keyframeNum;
        ds_grid_resize(keyframeGrid, 2, keyframeInd + 1);
        keyframeNum++;
        var keyframe = array_create(nodeNum, 0);
        
        for (var i = 0; i < nodeNum; i++)
        {
            keyframe[i] = array_create(8);
            array_copy(keyframe[i], 0, srcKeyframe[i], 0, 8);
        }
        
        ds_grid_set(keyframeGrid, 0, keyframeInd, arg1);
        ds_grid_set(keyframeGrid, 1, keyframeInd, keyframe);
        ds_grid_sort(keyframeGrid, 0, true);
        
        for (var i = 0; i < keyframeNum; i++)
        {
            if (ds_grid_get(keyframeGrid, 0, i) == arg1)
            {
                keyframeInd = i;
                break;
            }
        }
        
        return keyframeInd;
    };
    
    static keyframe_clear = function(arg0)
    {
        var keyframe = array_create(nodeNum);
        
        for (var i = 0; i < nodeNum; i++)
            keyframe[i] = [0, 0, 0, 1, 0, 0, 0, 0];
        
        ds_grid_set(keyframeGrid, 1, arg0, keyframe);
    };
    
    static keyframe_get_node_dq = function(arg0, arg1, arg2)
    {
        var keyframe = ds_grid_get(keyframeGrid, 1, arg1);
        
        if (!is_array(keyframe))
        {
            show_debug_message("Error in script keyframe_get_node_dq: Trying to read from non-existing keyframe " + string(arg1));
            exit;
        }
        
        var nodeList = arg0.nodeList;
        var localDQ = global.AnimTempQ4;
        var worldDQ = [0, 0, 0, 1, 0, 0, 0, 0];
        
        while (arg2 > 0)
        {
            node = ds_list_find_value(nodeList, arg2);
            var deltaLocal = keyframe[arg2];
            smf_dq_multiply(node[(2 << 0)], keyframe[arg2], localDQ);
            smf_dq_multiply(localDQ, worldDQ, worldDQ);
            arg2 = node[(5 << 0)];
        }
        
        var node = ds_list_find_value(nodeList, 0);
        smf_dq_multiply(node[(2 << 0)], keyframe[0], localDQ);
        smf_dq_multiply(localDQ, worldDQ, worldDQ);
        smf_dq_multiply(node[(1 << 0)], worldDQ, worldDQ);
        return worldDQ;
    };
    
    static keyframe_get_node_matrix = function(arg0, arg1, arg2)
    {
        return smf_mat_create_from_dualquat(keyframe_get_node_dq(arg0, arg1, arg2), array_create(16));
    };
    
    static keyframe_get_node_position = function(arg0, arg1, arg2)
    {
        return smf_dq_get_translation(keyframe_get_node_dq(arg0, arg1, arg2));
    };
    
    static keyframe_get_string = function(arg0)
    {
        var keyframe = ds_grid_get(keyframeGrid, 1, arg0);
        
        if (!is_array(keyframe))
        {
            show_debug_message("Error in script anim_keyframe_get_string: Trying to read from non-existing keyframe " + string(arg0));
            exit;
        }
        
        var num = array_length(keyframe);
        var str = "KEYFRAME/";
        
        for (var i = 0; i < num; i++)
        {
            var deltaDQ = keyframe[i];
            
            for (var j = 0; j < 8; j++)
            {
                if (deltaDQ[j] == 0 || deltaDQ[j] == 1)
                    str += (string(round(deltaDQ[j])) + "/");
                else
                    str += (string_format(deltaDQ[j], 1, 8) + "/");
            }
        }
        
        return str;
    };
    
    static keyframe_set_from_string = function(arg0, arg1)
    {
        if (!is_string(arg1))
            return false;
        
        var pos = string_pos("/", arg1);
        var probe = string_copy(arg1, 1, pos - 1);
        
        if (probe != "KEYFRAME")
        {
            show_debug_message("Error in script keyframe_set_from_string: The given string does not contain a keyframe");
            return false;
        }
        
        arg1 = string_delete(arg1, 1, pos);
        var keyframe = array_create(string_count("/", arg1) / 8);
        var deltaDQ = array_create(8);
        var i = 0;
        var j = 0;
        
        while (arg1 != "")
        {
            pos = string_pos("/", arg1);
            probe = string_copy(arg1, 1, pos - 1);
            arg1 = string_delete(arg1, 1, pos);
            deltaDQ[j] = real(probe);
            j++;
            
            if (j >= 8)
            {
                keyframe[i++] = deltaDQ;
                deltaDQ = array_create(8);
                j = 0;
            }
        }
        
        ds_grid_set(keyframeGrid, 1, arg0, keyframe);
        return true;
    };
    
    static keyframe_set_from_sample = function(arg0, arg1, arg2)
    {
        var nodeList = arg0.nodeList;
        var keyframe = ds_grid_get(keyframeGrid, 1, arg1);
        var localDQ = global.AnimTempQ1;
        var deltaLocalDQ = global.AnimTempQ2;
        var parentConj = global.AnimTempQ3;
        var worldDQ = global.AnimTempWorldDQ;
        
        if (nodeNum > array_length(worldDQ))
        {
            global.AnimTempWorldDQ = array_create(nodeNum);
            
            for (var i = 0; i < nodeNum; i++)
                global.AnimTempWorldDQ[i] = array_create(8);
            
            worldDQ = global.AnimTempWorldDQ;
        }
        
        var node = ds_list_find_value(nodeList, 0);
        array_copy(worldDQ[0], 0, node[(1 << 0)], 0, 8);
        
        for (var i = 0; i < nodeNum; i++)
        {
            node = ds_list_find_value(nodeList, i);
            smf_dq_get_conjugate(worldDQ[node[(5 << 0)]], parentConj);
            sample_get_node_dq(arg0, i, arg2, worldDQ[i]);
            smf_dq_multiply(parentConj, worldDQ[i], localDQ);
            smf_dq_multiply(node[(4 << 0)], localDQ, deltaLocalDQ);
            
            if (node[(8 << 0)])
            {
                deltaLocalDQ[4] = 0;
                deltaLocalDQ[5] = deltaLocalDQ[2] * node[(9 << 0)];
                deltaLocalDQ[6] = -deltaLocalDQ[1] * node[(9 << 0)];
                deltaLocalDQ[7] = 0;
            }
            
            smf_dq_normalize(deltaLocalDQ);
            array_copy(keyframe[i], 0, deltaLocalDQ, 0, 8);
        }
    };
    
    static keyframe_set_node_dq = function(arg0, arg1, arg2, arg3, arg4, arg5)
    {
        var nodeList = arg0.nodeList;
        var keyframe = ds_grid_get(keyframeGrid, 1, arg1);
        
        if (!is_array(keyframe))
        {
            show_debug_message("Error in script anim_keyframe_set_node_dq: Trying to modify non-existing keyframe " + string(arg1));
            exit;
        }
        
        var keyframeTime = ds_grid_get(keyframeGrid, 0, arg1);
        var sample = generate_sample(arg0, keyframeTime, (0 << 0));
        sample_node_set_dq(arg0, arg2, sample, arg3, arg4, arg5);
        sample_update_locked_bones(arg0, arg2, sample, arg5);
        keyframe_set_from_sample(arg0, arg1, sample);
    };
    
    static keyframe_set_time = function(arg0, arg1)
    {
        arg1 = clamp(arg1, 0, 0.99999);
        
        for (var i = 0; i < keyframeNum; i++)
        {
            if (ds_grid_get(keyframeGrid, 0, i) == arg1)
                exit;
        }
        
        ds_grid_set(keyframeGrid, 0, arg0, arg1);
    };
    
    static keyframe_get = function(arg0)
    {
        var a = 0;
        var minD = 1;
        
        for (var i = 0; i < keyframeNum; i++)
        {
            var d = abs(ds_grid_get(keyframeGrid, 0, i) - arg0);
            
            if (d >= minD)
                break;
            
            minD = d;
            a = i;
        }
        
        return a;
    };
    
    static keyframe_get_linear = function(arg0)
    {
        var a = 0;
        var b = 0;
        var d = 0;
        
        for (var j = 0; j < keyframeNum; j++)
        {
            if (ds_grid_get(keyframeGrid, 0, j) > arg0)
            {
                b = j;
                break;
            }
        }
        
        if (loop)
        {
            a = ((b - 1) + keyframeNum) % keyframeNum;
        }
        else if (b == 0)
        {
            b = keyframeNum - 1;
            a = b;
        }
        else
        {
            a = max(b - 1, 0);
        }
        
        if (a != b)
        {
            var tb = ds_grid_get(keyframeGrid, 0, b);
            tb += (arg0 > tb);
            var ta = ds_grid_get(keyframeGrid, 0, a);
            ta -= (ta > tb);
            
            if (tb == ta)
                d = 0;
            else
                d = (arg0 - ta) / (tb - ta);
        }
        
        return [a, b, d];
    };
    
    static keyframe_get_quadratic = function(arg0)
    {
        var a = 0;
        var b = 0;
        var c = 0;
        var d = 0;
        
        for (var j = 0; j < keyframeNum; j++)
        {
            a = j;
            b = (a + 1) % keyframeNum;
            c = (a + 2) % keyframeNum;
            var ta = ds_grid_get(keyframeGrid, 0, a);
            var tb = ds_grid_get(keyframeGrid, 0, b);
            var tc = ds_grid_get(keyframeGrid, 0, c);
            
            if (loop)
            {
                if (arg0 > tc)
                {
                    tb += (tb < ta);
                    tc += (tc < tb);
                }
                
                tb -= (tb > tc);
                ta -= (ta > tb);
            }
            else
            {
                if (a == (keyframeNum - 2))
                {
                    c = keyframeNum - 1;
                    tc = 1;
                }
                
                if (a == (keyframeNum - 1))
                {
                    if (arg0 > tc)
                    {
                        b = keyframeNum - 1;
                        tb = ta;
                        c = keyframeNum - 1;
                        tc = 1;
                    }
                    else
                    {
                        a = 0;
                        ta = 0;
                        b = 0;
                        tb = 0;
                    }
                }
            }
            
            if (arg0 >= ((ta + tb) * 0.5) && arg0 <= ((tb + tc) * 0.5))
            {
                if (arg0 < tb)
                    d = (arg0 - ((ta + tb) * 0.5)) / (tb - ta);
                else
                    d = (tc == tb) ? 1 : (0.5 + ((arg0 - tb) / (tc - tb)));
                
                break;
            }
        }
        
        return [a, b, c, d];
    };
    
    name = arg0;
    nodeNum = 0;
    keyframeGrid = ds_grid_create(2, 0);
    interpolation = (2 << 0);
    loop = true;
    sampleFrameMultiplier = 5;
    playTime = 1000;
    playSpeed = 1 / game_get_speed(gamespeed_fps);
    keyframeNum = 0;
}

function anim_create(arg0)
{
    return new smf_anim(arg0);
}

function anim_generate_sample()
{
    var rig = argument[0];
    var anim = argument[1];
    var time = argument[2];
    var interpolation = anim.interpolation;
    
    if (argument_count > 3)
        interpolation = argument[3];
    
    return anim.generate_sample(rig, time, interpolation);
}

function anim_delete(arg0)
{
    arg0.destroy();
    arg0 = undefined;
}

function anim_duplicate(arg0)
{
    return arg0.duplicate();
}

function anim_add_keyframe(arg0, arg1)
{
    return arg0.keyframe_add(arg1);
}

function anim_delete_keyframe(arg0, arg1)
{
    return arg0.keyframe_delete(arg1);
}

function anim_duplicate_keyframe(arg0, arg1, arg2)
{
    return arg0.keyframe_duplicate(arg1, arg2);
}

function anim_keyframe_clear(arg0, arg1)
{
    return arg0.keyframe_clear(arg1);
}

function anim_keyframe_get_node_dq(arg0, arg1, arg2, arg3)
{
    return arg1.keyframe_get_node_dq(arg0, arg2, arg3);
}

function anim_keyframe_get_node_matrix(arg0, arg1, arg2, arg3)
{
    return arg1.keyframe_get_node_matrix(arg0, arg2, arg3);
}

function anim_keyframe_get_node_position(arg0, arg1, arg2, arg3)
{
    return arg1.keyframe_get_node_position(arg0, arg2, arg3);
}

function anim_keyframe_get_string(arg0, arg1)
{
    return arg0.keyframe_get_string(arg1);
}

function anim_keyframe_set_from_string(arg0, arg1, arg2)
{
    return arg0.keyframe_set_from_string(arg1, arg2);
}

function anim_keyframe_set_from_sample(arg0, arg1, arg2, arg3)
{
    return arg1.keyframe_set_from_sample(arg0, arg2, arg3);
}

function anim_keyframe_set_node_dq(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    return arg1.keyframe_set_node_dq(arg0, arg2, arg3, arg4, arg5, arg6);
}

function anim_keyframe_set_time(arg0, arg1, arg2)
{
    return arg0.keyframe_set_time(arg1, arg2);
}

function anim_get_interpolation(arg0)
{
    return arg0.interpolation;
}

function anim_get_keyframe_num(arg0)
{
    return ds_grid_height(arg0.keyframeGrid);
}

function anim_get_loop(arg0)
{
    return arg0.loop;
}

function anim_get_name(arg0)
{
    return animIndex.name;
}

function anim_get_playtime(arg0)
{
    return animIndex.playTime;
}

function anim_get_sample_frame_multiplier(arg0)
{
    return arg0.sampleFrameMultiplier;
}

function anim_set_name(arg0, arg1)
{
    arg0.name = arg1;
}

function anim_set_playtime(arg0, arg1)
{
    arg0.playTime = arg1;
}

function anim_set_interpolation(arg0, arg1)
{
    arg0.interpolation = arg1;
}

function anim_set_loop(arg0, arg1)
{
    arg0.loop = arg1;
}

function _anim_get_keyframe(arg0, arg1)
{
    return arg0.keyframe_get(arg1);
}

function _anim_get_keyframe_linear(arg0, arg1)
{
    return arg0.keyframe_get_linear(arg1);
}

function _anim_get_keyframe_quadratic(arg0, arg1)
{
    return arg0.keyframe_get_quadratic(arg1);
}

function anim_set_sample_frame_multiplier(arg0, arg1)
{
    arg0.sampleFrameMultiplier = arg1;
}

function anim_write_to_buffer(arg0, arg1)
{
    var keyframeGrid = arg1.keyframeGrid;
    var keyframeNum = ds_grid_height(keyframeGrid);
    var nodeNum = arg1.nodeNum;
    buffer_write(arg0, buffer_string, "SnidrsAnimation");
    buffer_write(arg0, buffer_string, arg1.name);
    buffer_write(arg0, buffer_u16, nodeNum);
    buffer_write(arg0, buffer_u16, arg1.playTime);
    buffer_write(arg0, buffer_bool, arg1.loop);
    buffer_write(arg0, buffer_u8, arg1.interpolation);
    buffer_write(arg0, buffer_u8, arg1.sampleFrameMultiplier);
    buffer_write(arg0, buffer_u16, keyframeNum);
    
    for (var j = 0; j < keyframeNum; j++)
    {
        var keyframeTime = ds_grid_get(keyframeGrid, 0, j);
        var keyframe = ds_grid_get(keyframeGrid, 1, j);
        var n = array_length(keyframe);
        buffer_write(arg0, buffer_f32, keyframeTime);
        
        for (var k = 0; k < nodeNum; k++)
        {
            if (k >= n)
                keyframe[k] = [0, 0, 0, 1, 0, 0, 0, 0];
            
            var deltaDQ = keyframe[k];
            
            for (var l = 0; l < 8; l++)
                buffer_write(arg0, buffer_f32, deltaDQ[l]);
        }
    }
}

function anim_read_from_buffer(arg0)
{
    var header = buffer_read(arg0, buffer_string);
    
    if (header != "SnidrsAnimation")
    {
        show_debug_message("ERROR in script anim_read_from_buffer: Trying to read from a section that does not contain animation.");
        return -1;
    }
    
    var animName = buffer_read(arg0, buffer_string);
    var anim = new smf_anim(animName);
    var nodeNum = buffer_read(arg0, buffer_u16);
    anim.nodeNum = nodeNum;
    anim.playTime = buffer_read(arg0, buffer_u16);
    anim.loop = buffer_read(arg0, buffer_bool);
    anim.interpolation = buffer_read(arg0, buffer_u8);
    anim.sampleFrameMultiplier = buffer_read(arg0, buffer_u8);
    var keyframeNum = buffer_read(arg0, buffer_u16);
    var keyframeGrid = anim.keyframeGrid;
    
    for (var j = 0; j < keyframeNum; j++)
    {
        var keyframeTime = buffer_read(arg0, buffer_f32);
        var keyframeInd = anim_add_keyframe(anim, keyframeTime);
        var keyframe = ds_grid_get(keyframeGrid, 1, keyframeInd);
        
        for (var k = 0; k < nodeNum; k++)
        {
            var deltaDQ = keyframe[k];
            
            for (var l = 0; l < 8; l++)
                deltaDQ[l] = buffer_read(arg0, buffer_f32);
        }
    }
    
    return anim;
}

function _anim_update(arg0)
{
    arg0.update();
}
