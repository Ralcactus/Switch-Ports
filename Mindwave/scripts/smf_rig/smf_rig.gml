function smf_rig() constructor
{
    static destroy = function()
    {
        ds_list_destroy(nodeList);
        ds_list_destroy(bindMap);
    };
    
    static clear = function()
    {
        ds_list_clear(nodeList);
        ds_list_clear(bindMap);
        boneNum = 0;
    };
    
    static get_node_number = function()
    {
        return ds_list_size(nodeList);
    };
    
    static lock_positions = function(arg0)
    {
        nodeNum = ds_list_size(nodeList);
        
        for (var i = 0; i < nodeNum; i++)
        {
            var node = ds_list_find_value(nodeList, i);
            
            if (node[(8 << 0)] && !node[(11 << 0)])
                continue;
            
            node[(12 << 0)] = sample_get_node_position(self, i, arg0);
        }
    };
    
    static transform = function(arg0, arg1, arg2, arg3)
    {
        nodeNum = ds_list_size(nodeList);
        
        for (var i = 0; i < nodeNum; i++)
        {
            var node = ds_list_find_value(nodeList, i);
            smf_dq_multiply(arg0, node[(1 << 0)], node[(1 << 0)]);
            var nPos = smf_dq_get_translation(node[(1 << 0)]);
            smf_dq_set_translation(node[(1 << 0)], nPos[0] * arg1, nPos[1] * arg2, nPos[2] * arg3);
            update_node(i);
        }
    };
    
    static node_create = function(arg0, arg1, arg2)
    {
        var nodeInd = ds_list_size(nodeList);
        var node = array_create((13 << 0), 0);
        
        if (arg1 < 0 || ds_list_size(nodeList) == 0)
            arg2 = false;
        
        node[(0 << 0)] = string(ds_list_size(nodeList));
        node[(5 << 0)] = max(arg1, 0);
        node[(8 << 0)] = arg2;
        node[(6 << 0)] = [];
        node[(7 << 0)] = [];
        node[(10 << 0)] = [1, 0, 0];
        var parentNode = ds_list_find_value(nodeList, arg1);
        
        if (arg2)
        {
            node[(1 << 0)] = smf_dq_duplicate(parentNode[(1 << 0)]);
            smf_dq_set_translation(node[(1 << 0)], arg0[0], arg0[1], arg0[2]);
        }
        else
        {
            node[(1 << 0)] = smf_dq_create(0, 1, 0, 0, arg0[0], arg0[1], arg0[2]);
        }
        
        ds_list_set(nodeList, nodeInd, node);
        update_node(nodeInd);
        update_bindmap();
        return nodeInd;
    };
    
    static node_insert = function(arg0)
    {
        var nodeNum = ds_list_size(nodeList);
        
        if (arg0 <= 0 || ds_list_size(nodeList) < 2)
        {
            show_debug_message("ERROR in script node_insert: Could not insert node at position " + string(arg0));
            exit;
        }
        
        var childNode = ds_list_find_value(nodeList, arg0);
        var childPos = smf_dq_get_translation(childNode[(1 << 0)]);
        var parent = childNode[(5 << 0)];
        var parentNode = ds_list_find_value(nodeList, parent);
        var parentPos = smf_dq_get_translation(parentNode[(1 << 0)]);
        var newX = (childPos[0] + parentPos[0]) * 0.5;
        var newY = (childPos[1] + parentPos[1]) * 0.5;
        var newZ = (childPos[2] + parentPos[2]) * 0.5;
        var node = array_create((13 << 0));
        node[(5 << 0)] = parent;
        node[(8 << 0)] = childNode[(8 << 0)];
        node[(7 << 0)] = [];
        node[(1 << 0)] = smf_dq_duplicate(childNode[(1 << 0)]);
        smf_dq_set_translation(node[(1 << 0)], newX, newY, newZ);
        ds_list_insert(nodeList, arg0, node);
        nodeNum = ds_list_size(nodeList);
        childNode[(5 << 0)] = arg0;
        var i = arg0 + 2;
        
        while (i < nodeNum)
        {
            node = ds_list_find_value(nodeList, i);
            
            if (node[(5 << 0)] >= arg0)
                node[(5 << 0)]++;
            
            i++;
        }
        
        update_bindmap();
        update_node(arg0);
        node = ds_list_find_value(nodeList, arg0);
        var childArray = node[(6 << 0)];
        var childNum = array_length(childArray);
        
        for (i = 0; i < childNum; i++)
        {
            var child = ds_list_find_value(nodeList, array_get(childArray, i));
            update_node(childArray[i]);
            var grandchildArray = child[(6 << 0)];
            var grandchildNum = array_length(grandchildArray);
            
            for (var j = 0; j < grandchildNum; j++)
                update_node(grandchildArray[j]);
        }
        
        return arg0;
    };
    
    static node_get_dq = function(arg0)
    {
        var node = ds_list_find_value(nodeList, arg0);
        
        if (is_undefined(node))
        {
            show_debug_message("ERROR in script node_get_dq: Invalid nodeIndex " + string(arg0));
            return false;
        }
        
        return node[(1 << 0)];
    };
    
    static node_delete = function(arg0)
    {
        if (arg0 < 0)
        {
            show_debug_message("ERROR in script node_delete: Trying to delete a nodeInd < 0");
            return false;
        }
        
        var nodeNum = ds_list_size(nodeList);
        var node = ds_list_find_value(nodeList, arg0);
        var childArray = node[(6 << 0)];
        var parent = node[(5 << 0)];
        
        if (arg0 >= nodeNum)
        {
            show_debug_message("ERROR in script node_delete: Node " + string(arg0) + " does not exist in rig");
            return false;
        }
        
        ds_list_delete(nodeList, arg0);
        nodeNum--;
        
        for (var i = arg0; i < nodeNum; i++)
        {
            node = ds_list_find_value(nodeList, i);
            
            if (node[(5 << 0)] > arg0)
                node[(5 << 0)] = max(node[(5 << 0)] - 1, 0);
            else if (node[(5 << 0)] == arg0)
                node[(5 << 0)] = parent;
            
            if (i == 0)
                node[(8 << 0)] = false;
        }
        
        update_bindmap();
        var childNum = array_length(childArray);
        
        for (var i = 0; i < childNum; i++)
        {
            var child = ds_list_find_value(nodeList, childArray[i] - 1);
            update_node(childArray[i] - 1);
            var grandchildArray = child[(6 << 0)];
            var grandchildNum = array_length(grandchildArray);
            
            for (var j = 0; j < grandchildNum; j++)
                update_node(grandchildArray[j]);
        }
        
        return true;
    };
    
    static node_move = function(arg0, arg1, arg2, arg3)
    {
        var node = ds_list_find_value(nodeList, arg0);
        smf_dq_set_translation(node[(1 << 0)], arg1, arg2, arg3);
        update_node(arg0);
        var childArray = node[(6 << 0)];
        var childNum = array_length(childArray);
        
        for (var i = 0; i < childNum; i++)
        {
            var child = ds_list_find_value(nodeList, array_get(childArray, i));
            update_node(childArray[i]);
            var grandchildArray = child[(6 << 0)];
            var grandchildNum = array_length(grandchildArray);
            
            for (var j = 0; j < grandchildNum; j++)
                update_node(grandchildArray[j]);
        }
    };
    
    static node_rotate = function(arg0, arg1)
    {
        var node = ds_list_find_value(nodeList, arg0);
        smf_dq_multiply(node[(1 << 0)], smf_dq_create(arg1, 1, 0, 0, 0, 0, 0), node[(1 << 0)]);
        update_node(arg0);
        var nodeNum = ds_list_size(nodeList);
        var i = arg0 + 1;
        
        while (i < nodeNum)
        {
            var childNode = ds_list_find_value(nodeList, i);
            
            if (childNode[(5 << 0)] == arg0)
                update_node(i);
            
            i++;
        }
    };
    
    static node_set_locked = function(arg0, arg1)
    {
        if (arg0 == 0)
        {
            show_debug_message("ERROR in script node_set_locked: Cannot make the first node in the hierarchy represent a bone");
            return false;
        }
        
        if (arg0 < 0)
        {
            show_debug_message("ERROR in script node_set_locked: Invalid nodeIndex " + string(arg0));
            return false;
        }
        
        var cNode = ds_list_find_value(nodeList, arg0);
        cNode[(11 << 0)] = arg1;
        return true;
    };
    
    static node_get_locked = function(arg0)
    {
        var node = ds_list_find_value(nodeList, arg0);
        return node[(11 << 0)];
    };
    
    static node_set_parent = function(arg0, arg1)
    {
        if (arg0 == 0)
        {
            show_debug_message("ERROR in script node_set_parent: Cannot change the parent of the first node");
            return false;
        }
        
        if (arg0 < 0)
        {
            show_debug_message("ERROR in script node_set_parent: Trying to edit a nodeIndex < 0");
            return false;
        }
        
        var node = ds_list_find_value(nodeList, arg0);
        
        if (!is_array(node))
        {
            show_debug_message("ERROR in script node_set_parent: Node " + string(arg0) + " does not exist in rig");
            return false;
        }
        
        if (arg1 >= node[(5 << 0)])
        {
            show_debug_message("ERROR in script node_set_parent: Cannot assign parent that has a higher node index than the child");
            return false;
        }
        
        node[(5 << 0)] = arg1;
        update_bindmap();
        return true;
    };
    
    static node_set_bone = function(arg0, arg1)
    {
        if (arg0 == 0)
        {
            show_debug_message("ERROR in script node_set_bone: Cannot make the first node in the hierarchy represent a bone");
            return false;
        }
        
        if (arg0 < 0)
        {
            show_debug_message("ERROR in script node_set_bone: Invalid nodeIndex " + string(arg0));
            return false;
        }
        
        var node = ds_list_find_value(nodeList, arg0);
        
        if (!is_array(node))
        {
            show_debug_message("ERROR in script node_set_bone: Invalid nodeIndex " + string(arg0));
            return false;
        }
        
        node[(8 << 0)] = arg1;
        
        if (!arg1)
            node[(9 << 0)] = 0;
        else
            update_node(arg0);
        
        update_bindmap(arg0);
        return true;
    };
    
    static node_get_bone = function(arg0)
    {
        var node = ds_list_find_value(nodeList, arg0);
        
        if (is_undefined(node))
        {
            show_debug_message("ERROR in script node_get_bone: Invalid node index " + string(arg0));
            return false;
        }
        
        return node[(8 << 0)];
    };
    
    static update_node = function(arg0)
    {
        var node = ds_list_find_value(nodeList, arg0);
        var nodeDQ = node[(1 << 0)];
        var nodePos = smf_dq_get_translation(nodeDQ);
        var parentNode = ds_list_find_value(nodeList, array_get(node, (5 << 0)));
        var parentPos = smf_dq_get_translation(parentNode[(1 << 0)]);
        var boneVx = nodePos[0] - parentPos[0];
        var boneVy = nodePos[1] - parentPos[1];
        var boneVz = nodePos[2] - parentPos[2];
        
        if (node[(8 << 0)])
        {
            node[(9 << 0)] = sqrt((boneVx * boneVx) + (boneVy * boneVy) + (boneVz * boneVz));
            var nodeUp = smf_quat_get_up(nodeDQ);
            
            if (boneVx == 0 && boneVy == 0 && boneVz == 0)
                show_debug_message("Node " + string(arg0) + " has no up vector. DQ: " + string(nodeDQ));
            
            var nodeM = smf_mat_create(nodePos[0], nodePos[1], nodePos[2], boneVx, boneVy, boneVz, nodeUp[0], nodeUp[1], nodeUp[2], 1, 1, 1);
            smf_dq_normalize(smf_dq_create_from_matrix(nodeM, nodeDQ));
            var gNode = ds_list_find_value(nodeList, array_get(parentNode, (5 << 0)));
            var gPos = smf_dq_get_translation(gNode[(1 << 0)]);
            var upAxisX = boneVx;
            var upAxisY = boneVy;
            var upAxisZ = boneVz;
            var pAxisX = nodePos[0] - gPos[0];
            var pAxisY = nodePos[1] - gPos[1];
            var pAxisZ = nodePos[2] - gPos[2];
            var dp = dot_product_3d(upAxisX, upAxisY, upAxisZ, pAxisX, pAxisY, pAxisZ) / dot_product_3d(pAxisX, pAxisY, pAxisZ, pAxisX, pAxisY, pAxisZ);
            upAxisX -= (pAxisX * dp);
            upAxisY -= (pAxisY * dp);
            upAxisZ -= (pAxisZ * dp);
            var l = dot_product_3d(upAxisX, upAxisY, upAxisZ, pAxisX, pAxisY, pAxisZ);
            
            if (l == 0 || is_nan(l))
            {
                node[(10 << 0)] = [0, 0, 1];
            }
            else
            {
                l = 1 / sqrt(l);
                node[(10 << 0)] = [upAxisX * l, upAxisY * l, upAxisZ * l];
            }
        }
        else if (!is_array(node[(10 << 0)]))
        {
            node[(10 << 0)] = [0, 0, 1];
        }
        
        node[(3 << 0)] = smf_dq_get_conjugate(nodeDQ, array_create(8));
        node[(2 << 0)] = smf_dq_multiply(parentNode[(3 << 0)], nodeDQ, array_create(8));
        node[(4 << 0)] = smf_dq_get_conjugate(node[(2 << 0)], array_create(8));
    };
    
    static update_bindmap = function()
    {
        if (bindMap < 0)
            bindMap = ds_list_create();
        
        ds_list_clear(bindMap);
        var sampleBoneInd = 0;
        nodeNum = ds_list_size(nodeList);
        
        for (var i = 0; i < nodeNum; i++)
        {
            var node = ds_list_find_value(nodeList, i);
            
            if (node[(8 << 0)])
            {
                ds_list_set(bindMap, i, sampleBoneInd);
                sampleBoneInd++;
            }
            else
            {
                ds_list_set(bindMap, i, -1);
            }
            
            node[(6 << 0)] = [];
            node[(7 << 0)] = [];
            var ancestor = i;
            var ancestorNode = ds_list_find_value(nodeList, ancestor);
            
            while (ancestor > 0)
            {
                ancestor = ancestorNode[(5 << 0)];
                ancestorNode = ds_list_find_value(nodeList, ancestor);
                descendants = ancestorNode[(7 << 0)];
                descendants[array_length(descendants)] = i;
                
                if (ancestor == node[(5 << 0)])
                {
                    children = ancestorNode[(6 << 0)];
                    children[array_length(children)] = i;
                }
            }
        }
        
        boneNum = sampleBoneInd;
    };
    
    nodeList = ds_list_create();
    bindMap = ds_list_create();
    boneNum = 0;
    nodeNum = 0;
}

function rig_delete(arg0)
{
    arg0.destroy();
    arg0 = undefined;
}

function rig_clear(arg0)
{
    return arg0.clear();
}

function rig_get_node_number(arg0)
{
    return arg0.get_node_number();
}

function rig_lock_positions(arg0, arg1)
{
    return arg0.lock_positions(arg1);
}

function rig_transform(arg0, arg1, arg2, arg3, arg4)
{
    return arg0.transform(arg1, arg2, arg3, arg4);
}

function _anim_rig_update_node(arg0, arg1)
{
    return arg0.update_node(arg1);
}

function rig_add_node(arg0, arg1, arg2, arg3)
{
    return arg0.node_create(arg1, arg2, arg3);
}

function rig_insert_node(arg0, arg1)
{
    return arg0.node_insert(arg1);
}

function rig_delete_node(arg0, arg1)
{
    return arg0.node_delete(arg1);
}

function rig_move_node(arg0, arg1, arg2, arg3, arg4)
{
    return arg0.node_move(arg1, arg2, arg3, arg4);
}

function rig_rotate_node(arg0, arg1, arg2)
{
    return arg0.node_rotate(arg1, arg2);
}

function rig_node_get_bone(arg0, arg1)
{
    return arg0.node_get_bone(arg1);
}

function rig_node_get_dq(arg0, arg1)
{
    return arg0.node_get_dq(arg1);
}

function rig_node_set_bone(arg0, arg1, arg2)
{
    return arg0.node_set_bone(arg1, arg2);
}

function rig_node_get_locked(arg0, arg1)
{
    return arg0.node_get_locked(arg1);
}

function rig_node_set_locked(arg0, arg1, arg2)
{
    return arg0.node_set_locked(arg1, arg2);
}

function _anim_rig_update_bindmap(arg0)
{
    return arg0.update_bindmap();
}

function rig_node_set_parent(arg0, arg1, arg2)
{
    return arg0.node_set_parent(arg1, arg2);
}

function rig_write_to_buffer(arg0, arg1)
{
    buffer_write(arg0, buffer_string, "Rig");
    var nodeList = arg1.nodeList;
    
    if (nodeList < 0)
    {
        buffer_write(arg0, buffer_u16, 0);
        exit;
    }
    
    var nodeNum = ds_list_size(nodeList);
    buffer_write(arg0, buffer_u16, nodeNum);
    
    for (var i = 0; i < nodeNum; i++)
    {
        var node = ds_list_find_value(nodeList, i);
        buffer_write(arg0, buffer_string, node[(0 << 0)]);
        buffer_write(arg0, buffer_bool, node[(8 << 0)]);
        buffer_write(arg0, buffer_u16, node[(5 << 0)]);
        buffer_write(arg0, buffer_u8, node[(11 << 0)]);
        var pAxis = node[(10 << 0)];
        buffer_write(arg0, buffer_f32, pAxis[0]);
        buffer_write(arg0, buffer_f32, pAxis[1]);
        buffer_write(arg0, buffer_f32, pAxis[2]);
        var worldDQ = node[(1 << 0)];
        
        for (var j = 0; j < 8; j++)
            buffer_write(arg0, buffer_f32, worldDQ[j]);
    }
}

function rig_read_from_buffer(arg0)
{
    var rig = new smf_rig();
    var nodeList = rig.nodeList;
    var header = buffer_read(arg0, buffer_string);
    
    if (header != "Rig")
    {
        show_debug_message("Error in script anim_rig_read_from_buffer: Trying to read from a section that does not contain a rig.");
        exit;
    }
    
    var nodeNum = buffer_read(arg0, buffer_u16);
    
    for (var i = 0; i < nodeNum; i++)
    {
        var node = array_create((13 << 0), 0);
        ds_list_set(nodeList, i, node);
        node[(0 << 0)] = buffer_read(arg0, buffer_string);
        node[(8 << 0)] = buffer_read(arg0, buffer_bool);
        node[(5 << 0)] = buffer_read(arg0, buffer_u16);
        node[(11 << 0)] = buffer_read(arg0, buffer_u8);
        var pAxisX = buffer_read(arg0, buffer_f32);
        var pAxisY = buffer_read(arg0, buffer_f32);
        var pAxisZ = buffer_read(arg0, buffer_f32);
        var worldDQ = array_create(8);
        
        for (var j = 0; j < 8; j++)
            worldDQ[j] = buffer_read(arg0, buffer_f32);
        
        node[(1 << 0)] = worldDQ;
        _anim_rig_update_node(rig, i);
        node[(10 << 0)] = [pAxisX, pAxisY, pAxisZ];
    }
    
    _anim_rig_update_bindmap(rig);
    return rig;
}
