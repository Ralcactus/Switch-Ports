function sample_create_bind(arg0)
{
    var i = arg0.boneNum;
    
    if (i <= 0)
        return [0, 0, 0, 1, 0, 0, 0, 0];
    
    var sample = array_create(i * 8, 0);
    
    repeat (i)
        sample[(--i * 8) + 3] = 1;
    
    return sample;
}

function sample_update_bind(arg0, arg1)
{
    var boneNum = arg0.boneNum;
    
    if (boneNum <= 0)
        return [0, 0, 0, 1, 0, 0, 0, 0];
    
    var i = (8 * boneNum) - 1;
    
    while (i >= 0)
    {
        arg1[i] = (i % 8) == 3;
        i--;
    }
    
    return arg1;
}

function sample_set_uniform(arg0, arg1 = undefined)
{
    var aniUni = ds_map_find_value(global.AnimUniMap, string(arg0) + "ani");
    
    if (is_undefined(aniUni))
    {
        aniUni = shader_get_uniform(arg0, "u_animate");
        ds_map_set(global.AnimUniMap, string(arg0) + "ani", aniUni);
    }
    
    if (!is_array(arg1))
    {
        shader_set_uniform_i(aniUni, false);
        return false;
    }
    
    shader_set_uniform_i(aniUni, true);
    var smpUni = ds_map_find_value(global.AnimUniMap, string(arg0) + "smp");
    
    if (is_undefined(smpUni))
    {
        smpUni = shader_get_uniform(arg0, "u_boneDQ");
        ds_map_set(global.AnimUniMap, string(arg0) + "smp", smpUni);
    }
    
    shader_set_uniform_f_array(smpUni, arg1);
    return true;
}

function sample_lerp(arg0, arg1, arg2, arg3 = array_create(array_length(sample1)))
{
    var num = array_length(arg0);
    
    if (arg2 <= 0)
    {
        array_copy(arg3, 0, arg0, 0, num);
        return arg3;
    }
    
    if (arg2 >= 1)
    {
        array_copy(arg3, 0, arg1, 0, num);
        return arg3;
    }
    
    var dp = (arg0[0] * arg1[0]) + (arg0[1] * arg1[1]) + (arg0[2] * arg1[2]) + (arg0[3] * arg1[3]);
    
    if (abs(dp) < 0.5)
    {
        var T = array_create(8);
        var s = sign(dp);
        
        for (i = 0; i < 8; i++)
            T[i] = lerp(arg0[i], s * arg1[i], arg2);
        
        var D1 = smf_dq_multiply(T, smf_dq_get_conjugate(arg0));
        var u0 = D1[0];
        var u1 = D1[1];
        var u2 = D1[2];
        var u3 = D1[3];
        var u4 = D1[4];
        var u5 = D1[5];
        var u6 = D1[6];
        var u7 = D1[7];
        
        if (s < 0)
        {
            for (i = 0; i < 8; i++)
                T[i] *= -1;
        }
        
        var D2 = smf_dq_multiply(T, smf_dq_get_conjugate(arg1));
        var v0 = D2[0];
        var v1 = D2[1];
        var v2 = D2[2];
        var v3 = D2[3];
        var v4 = D2[4];
        var v5 = D2[5];
        var v6 = D2[6];
        var v7 = D2[7];
        
        for (i = 0; i < num; i += 8)
        {
            var s0 = arg0[i];
            var s1 = arg0[i + 1];
            var s2 = arg0[i + 2];
            var s3 = arg0[i + 3];
            var s4 = arg0[i + 4];
            var s5 = arg0[i + 5];
            var s6 = arg0[i + 6];
            var s7 = arg0[i + 7];
            var N0 = ((u3 * s0) + (u0 * s3) + (u1 * s2)) - (u2 * s1);
            var N1 = ((u3 * s1) - (u0 * s2)) + (u1 * s3) + (u2 * s0);
            var N2 = (((u3 * s2) + (u0 * s1)) - (u1 * s0)) + (u2 * s3);
            var N3 = (u3 * s3) - (u0 * s0) - (u1 * s1) - (u2 * s2);
            var N4 = (((((u3 * s4) + (u0 * s7) + (u1 * s6)) - (u2 * s5)) + (u4 * s3) + (u5 * s2)) - (u6 * s1)) + (u7 * s0);
            var N5 = ((((u3 * s5) - (u0 * s6)) + (u1 * s7) + (u2 * s4)) - (u4 * s2)) + (u5 * s3) + (u6 * s0) + (u7 * s1);
            var N6 = (((((u3 * s6) + (u0 * s5)) - (u1 * s4)) + (u2 * s7) + (u4 * s1)) - (u5 * s0)) + (u6 * s3) + (u7 * s2);
            var N7 = ((u3 * s7) - (u0 * s4) - (u1 * s5) - (u2 * s6) - (u4 * s0) - (u5 * s1) - (u6 * s2)) + (u7 * s3);
            s0 = arg1[i];
            s1 = arg1[i + 1];
            s2 = arg1[i + 2];
            s3 = arg1[i + 3];
            s4 = arg1[i + 4];
            s5 = arg1[i + 5];
            s6 = arg1[i + 6];
            s7 = arg1[i + 7];
            var M0 = ((v3 * s0) + (v0 * s3) + (v1 * s2)) - (v2 * s1);
            var M1 = ((v3 * s1) - (v0 * s2)) + (v1 * s3) + (v2 * s0);
            var M2 = (((v3 * s2) + (v0 * s1)) - (v1 * s0)) + (v2 * s3);
            var M3 = (v3 * s3) - (v0 * s0) - (v1 * s1) - (v2 * s2);
            var M4 = (((((v3 * s4) + (v0 * s7) + (v1 * s6)) - (v2 * s5)) + (v4 * s3) + (v5 * s2)) - (v6 * s1)) + (v7 * s0);
            var M5 = ((((v3 * s5) - (v0 * s6)) + (v1 * s7) + (v2 * s4)) - (v4 * s2)) + (v5 * s3) + (v6 * s0) + (v7 * s1);
            var M6 = (((((v3 * s6) + (v0 * s5)) - (v1 * s4)) + (v2 * s7) + (v4 * s1)) - (v5 * s0)) + (v6 * s3) + (v7 * s2);
            var M7 = ((v3 * s7) - (v0 * s4) - (v1 * s5) - (v2 * s6) - (v4 * s0) - (v5 * s1) - (v6 * s2)) + (v7 * s3);
            s = sign((N0 * M0) + (N1 * M1) + (N2 * M2) + (N3 * M3));
            arg3[i] = lerp(N0, M0 * s, arg2);
            arg3[i + 1] = lerp(N1, M1 * s, arg2);
            arg3[i + 2] = lerp(N2, M2 * s, arg2);
            arg3[i + 3] = lerp(N3, M3 * s, arg2);
            arg3[i + 4] = lerp(N4, M4 * s, arg2);
            arg3[i + 5] = lerp(N5, M5 * s, arg2);
            arg3[i + 6] = lerp(N6, M6 * s, arg2);
            arg3[i + 7] = lerp(N7, M7 * s, arg2);
        }
        
        return arg3;
    }
    
    var i = 0;
    
    while (i < num)
    {
        var s = sign((arg0[i] * arg1[i]) + (arg0[i + 1] * arg1[i + 1]) + (arg0[i + 2] * arg1[i + 2]) + (arg0[i + 3] * arg1[i + 3]));
        
        repeat (8)
        {
            arg3[i] = lerp(arg0[i], arg1[i] * s, arg2);
            i++;
        }
    }
    
    return arg3;
}

function sample_splice_branch(arg0, arg1, arg2, arg3, arg4)
{
    if (arg1 < 0 || arg1 > arg0.nodeNum)
        return arg2;
    
    var bindMap = arg0.bindMap;
    var nodeList = arg0.nodeList;
    var node = ds_list_find_value(nodeList, arg1);
    var descendants = node[(7 << 0)];
    var num = array_length(descendants);
    var parent = node[(5 << 0)];
    var parBone = ds_list_find_value(bindMap, parent);
    
    if (parBone < 0)
    {
        parBone = ds_list_find_value(bindMap, arg1);
        
        if (parBone < 0)
        {
            b = 8 * ds_list_find_value(bindMap, arg1);
            
            for (var i = 0; i <= num; i++)
            {
                if (b >= 0)
                {
                    arg2[b] += arg4 * (arg3[b] - arg2[b]);
                    arg2[b + 1] += arg4 * (arg3[b + 1] - arg2[b + 1]);
                    arg2[b + 2] += arg4 * (arg3[b + 2] - arg2[b + 2]);
                    arg2[b + 3] += arg4 * (arg3[b + 3] - arg2[b + 3]);
                    arg2[b + 4] += arg4 * (arg3[b + 4] - arg2[b + 4]);
                    arg2[b + 5] += arg4 * (arg3[b + 5] - arg2[b + 5]);
                    arg2[b + 6] += arg4 * (arg3[b + 6] - arg2[b + 6]);
                    arg2[b + 7] += arg4 * (arg3[b + 7] - arg2[b + 7]);
                }
                
                if (i < num)
                    b = 8 * ds_list_find_value(bindMap, array_get(descendants, i));
            }
            
            return arg2;
        }
    }
    
    var b = parBone * 8;
    var s0 = arg3[b];
    var s1 = arg3[b + 1];
    var s2 = arg3[b + 2];
    var s3 = arg3[b + 3];
    var s4 = arg3[b + 4];
    var s5 = arg3[b + 5];
    var s6 = arg3[b + 6];
    var s7 = arg3[b + 7];
    var d0 = arg2[b];
    var d1 = arg2[b + 1];
    var d2 = arg2[b + 2];
    var d3 = arg2[b + 3];
    var d4 = arg2[b + 4];
    var d5 = arg2[b + 5];
    var d6 = arg2[b + 6];
    var d7 = arg2[b + 7];
    var r0 = (((-d3 * s0) + (d0 * s3)) - (d1 * s2)) + (d2 * s1);
    var r1 = (((-d3 * s1) + (d1 * s3)) - (d2 * s0)) + (d0 * s2);
    var r2 = (((-d3 * s2) + (d2 * s3)) - (d0 * s1)) + (d1 * s0);
    var r3 = (d3 * s3) + (d0 * s0) + (d1 * s1) + (d2 * s2);
    var r4 = (((((((-d3 * s4) + (d0 * s7)) - (d1 * s6)) + (d2 * s5)) - (d7 * s0)) + (d4 * s3)) - (d5 * s2)) + (d6 * s1);
    var r5 = (((((((-d3 * s5) + (d1 * s7)) - (d2 * s4)) + (d0 * s6)) - (d7 * s1)) + (d5 * s3)) - (d6 * s0)) + (d4 * s2);
    var r6 = (((((((-d3 * s6) + (d2 * s7)) - (d0 * s5)) + (d1 * s4)) - (d7 * s2)) + (d6 * s3)) - (d4 * s1)) + (d5 * s0);
    var r7 = (d3 * s7) + (d0 * s4) + (d1 * s5) + (d2 * s6) + (d7 * s3) + (d4 * s0) + (d5 * s1) + (d6 * s2);
    b = 8 * ds_list_find_value(bindMap, arg1);
    
    for (var i = 0; i <= num; i++)
    {
        if (b >= 0)
        {
            s0 = arg3[b];
            s1 = arg3[b + 1];
            s2 = arg3[b + 2];
            s3 = arg3[b + 3];
            s4 = arg3[b + 4];
            s5 = arg3[b + 5];
            s6 = arg3[b + 6];
            s7 = arg3[b + 7];
            d0 = arg2[b];
            d1 = arg2[b + 1];
            d2 = arg2[b + 2];
            d3 = arg2[b + 3];
            d4 = arg2[b + 4];
            d5 = arg2[b + 5];
            d6 = arg2[b + 6];
            d7 = arg2[b + 7];
            arg2[b] += arg4 * (((r3 * s0) + (r0 * s3) + (r1 * s2)) - (r2 * s1) - d0);
            arg2[b + 1] += arg4 * (((r3 * s1) + (r1 * s3) + (r2 * s0)) - (r0 * s2) - d1);
            arg2[b + 2] += arg4 * (((r3 * s2) + (r2 * s3) + (r0 * s1)) - (r1 * s0) - d2);
            arg2[b + 3] += arg4 * ((r3 * s3) - (r0 * s0) - (r1 * s1) - (r2 * s2) - d3);
            arg2[b + 4] += arg4 * (((((r3 * s4) + (r0 * s7) + (r1 * s6)) - (r2 * s5)) + (r7 * s0) + (r4 * s3) + (r5 * s2)) - (r6 * s1) - d4);
            arg2[b + 5] += arg4 * (((((r3 * s5) + (r1 * s7) + (r2 * s4)) - (r0 * s6)) + (r7 * s1) + (r5 * s3) + (r6 * s0)) - (r4 * s2) - d5);
            arg2[b + 6] += arg4 * (((((r3 * s6) + (r2 * s7) + (r0 * s5)) - (r1 * s4)) + (r7 * s2) + (r6 * s3) + (r4 * s1)) - (r5 * s0) - d6);
            arg2[b + 7] += arg4 * ((((r3 * s7) - (r0 * s4) - (r1 * s5) - (r2 * s6)) + (r7 * s2)) - (r4 * s0) - (r5 * s1) - (r6 * s2) - d7);
        }
        
        if (i < num)
            b = 8 * ds_list_find_value(bindMap, array_get(descendants, i));
    }
    
    return arg2;
}

function sample_get_node_dq(arg0, arg1, arg2, arg3 = array_create(8))
{
    if (arg0.boneNum == 0 || arg1 >= arg0.nodeNum || arg1 < 0)
    {
        show_debug_message("ERROR in script sample_get_node_dq: Node " + string(arg1) + " does not exist");
        return arg3;
    }
    
    var nodeList = arg0.nodeList;
    var bindMap = arg0.bindMap;
    var node = ds_list_find_value(nodeList, arg1);
    var boneInd = ds_list_find_value(bindMap, arg1);
    
    if (boneInd < 0)
    {
        var children = node[(6 << 0)];
        
        if (array_length(children) <= 0)
        {
            show_debug_message("ERROR in script sample_get_node_dq: The given node " + string(arg1) + " is not mapped to any bone and does not have any children.");
            array_copy(arg3, 0, node[(1 << 0)], 0, 8);
            return arg3;
        }
        
        var i = array_length(children) - 1;
        
        while (i >= 0 && boneInd < 0)
        {
            boneInd = ds_list_find_value(bindMap, array_get(children, i));
            i--;
        }
        
        if (boneInd < 0)
        {
            show_debug_message("ERROR in script sample_get_node_dq: The given node " + string(arg1) + " is not mapped to any bone.");
            array_copy(arg3, 0, node[(1 << 0)], 0, 8);
            return arg3;
        }
    }
    
    var b = 8 * boneInd;
    
    if (b >= array_length(arg2))
        return arg3;
    
    var r3 = arg2[b + 3];
    
    if (is_undefined(r3))
    {
        array_copy(arg3, 0, node[(1 << 0)], 0, 8);
        return arg3;
    }
    
    var r4 = arg2[b + 4];
    var r5 = arg2[b + 5];
    var r6 = arg2[b + 6];
    
    if (r3 == 1 && r4 == 0 && r5 == 0 && r6 == 0)
    {
        array_copy(arg3, 0, node[(1 << 0)], 0, 8);
        return arg3;
    }
    
    var r0 = arg2[b];
    var r1 = arg2[b + 1];
    var r2 = arg2[b + 2];
    var r7 = arg2[b + 7];
    var S = node[(1 << 0)];
    var s0 = S[0];
    var s1 = S[1];
    var s2 = S[2];
    var s3 = S[3];
    var s4 = S[4];
    var s5 = S[5];
    var s6 = S[6];
    var s7 = S[7];
    arg3[0] = ((r3 * s0) + (r0 * s3) + (r1 * s2)) - (r2 * s1);
    arg3[1] = ((r3 * s1) + (r1 * s3) + (r2 * s0)) - (r0 * s2);
    arg3[2] = ((r3 * s2) + (r2 * s3) + (r0 * s1)) - (r1 * s0);
    arg3[3] = (r3 * s3) - (r0 * s0) - (r1 * s1) - (r2 * s2);
    arg3[4] = ((((r3 * s4) + (r0 * s7) + (r1 * s6)) - (r2 * s5)) + (r7 * s0) + (r4 * s3) + (r5 * s2)) - (r6 * s1);
    arg3[5] = ((((r3 * s5) + (r1 * s7) + (r2 * s4)) - (r0 * s6)) + (r7 * s1) + (r5 * s3) + (r6 * s0)) - (r4 * s2);
    arg3[6] = ((((r3 * s6) + (r2 * s7) + (r0 * s5)) - (r1 * s4)) + (r7 * s2) + (r6 * s3) + (r4 * s1)) - (r5 * s0);
    arg3[7] = (((r3 * s7) - (r0 * s4) - (r1 * s5) - (r2 * s6)) + (r7 * s3)) - (r4 * s0) - (r5 * s1) - (r6 * s2);
    return arg3;
}

function sample_get_node_matrix(arg0, arg1, arg2, arg3 = array_create(16))
{
    var tempQ = global.AnimTempQ4;
    sample_get_node_dq(arg0, arg1, arg2, tempQ);
    
    if (!is_array(tempQ))
        return matrix_build_identity();
    
    smf_dq_normalize(tempQ);
    return smf_mat_create_from_dualquat(tempQ, arg3);
}

function sample_get_node_position(arg0, arg1, arg2)
{
    return smf_dq_get_translation(sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ4));
}

function sample_fix(arg0, arg1)
{
    var S = arg1;
    var nodeList = arg0.nodeList;
    var bindMap = arg0.bindMap;
    var nodeNum = arg0.nodeNum;
    var worldDQ = global.AnimTempWorldDQ;
    
    if (nodeNum > array_length(worldDQ))
    {
        global.AnimTempWorldDQ = array_create(nodeNum);
        
        for (var i = 0; i < nodeNum; i++)
            global.AnimTempWorldDQ[i] = array_create(8);
        
        worldDQ = global.AnimTempWorldDQ;
    }
    
    for (var n = 0; n < nodeNum; n++)
    {
        var b = ds_list_find_value(bindMap, n);
        
        if (b < 0)
            continue;
        
        var node = ds_list_find_value(nodeList, n);
        var pNode = ds_list_find_value(nodeList, array_get(node, (5 << 0)));
        b *= 8;
        var s0 = S[b];
        var s1 = S[b + 1];
        var s2 = S[b + 2];
        var s3 = S[b + 3];
        var s4 = S[b + 4];
        var s5 = S[b + 5];
        var s6 = S[b + 6];
        var s7 = S[b + 7];
        var d = (s0 * s0) + (s1 * s1) + (s2 * s2) + (s3 * s3);
        
        if (d > 0 && d != 1)
        {
            var l = 1 / sqrt(d);
            s0 *= l;
            s1 *= l;
            s2 *= l;
            s3 *= l;
            d = (s0 * s4) + (s1 * s5) + (s2 * s6) + (s3 * s7);
            s4 = (s4 - (s0 * d)) * l;
            s5 = (s5 - (s1 * d)) * l;
            s6 = (s6 - (s2 * d)) * l;
            s7 = (s7 - (s3 * d)) * l;
        }
        
        var Q = node[(1 << 0)];
        var q0 = Q[0];
        var q1 = Q[1];
        var q2 = Q[2];
        var q3 = Q[3];
        var q4 = Q[4];
        var q5 = Q[5];
        var q6 = Q[6];
        var q7 = Q[7];
        var w0 = ((s3 * q0) + (s0 * q3) + (s1 * q2)) - (s2 * q1);
        var w1 = ((s3 * q1) + (s1 * q3) + (s2 * q0)) - (s0 * q2);
        var w2 = ((s3 * q2) + (s2 * q3) + (s0 * q1)) - (s1 * q0);
        var w3 = (s3 * q3) - (s0 * q0) - (s1 * q1) - (s2 * q2);
        var w4 = ((((s3 * q4) + (s0 * q7) + (s1 * q6)) - (s2 * q5)) + (s7 * q0) + (s4 * q3) + (s5 * q2)) - (s6 * q1);
        var w5 = ((((s3 * q5) + (s1 * q7) + (s2 * q4)) - (s0 * q6)) + (s7 * q1) + (s5 * q3) + (s6 * q0)) - (s4 * q2);
        var w6 = ((((s3 * q6) + (s2 * q7) + (s0 * q5)) - (s1 * q4)) + (s7 * q2) + (s6 * q3) + (s4 * q1)) - (s5 * q0);
        var w7 = (((s3 * q7) - (s0 * q4) - (s1 * q5) - (s2 * q6)) + (s7 * q3)) - (s4 * q0) - (s5 * q1) - (s6 * q2);
        
        if (!pNode[(8 << 0)])
        {
            var W = worldDQ[n];
            W[0] = w0;
            W[1] = w1;
            W[2] = w2;
            W[3] = w3;
            W[4] = w4;
            W[5] = w5;
            W[6] = w6;
            W[7] = w7;
        }
        else
        {
            var xto = ((w3 * w3) + (w0 * w0)) - (w1 * w1) - (w2 * w2);
            var yto = 2 * ((w0 * w1) + (w3 * w2));
            var zto = 2 * ((w0 * w2) - (w3 * w1));
            var P = worldDQ[node[(5 << 0)]];
            var p0 = P[0];
            var p1 = P[1];
            var p2 = P[2];
            var p3 = P[3];
            var p4 = P[4];
            var p5 = P[5];
            var p6 = P[6];
            var p7 = P[7];
            var px = ((-p7 * p0) + (p4 * p3) + (p6 * p1)) - (p5 * p2);
            var py = ((-p7 * p1) + (p5 * p3) + (p4 * p2)) - (p6 * p0);
            var pz = ((-p7 * p2) + (p6 * p3) + (p5 * p0)) - (p4 * p1);
            var l = point_distance_3d(0, 0, 0, xto, yto, zto);
            
            if (l != 0)
                l = (0.5 * node[(9 << 0)]) / l;
            
            var nx = px + (xto * l);
            var ny = py + (yto * l);
            var nz = pz + (zto * l);
            w4 = ((nx * w3) + (ny * w2)) - (nz * w1);
            w5 = ((ny * w3) + (nz * w0)) - (nx * w2);
            w6 = ((nz * w3) + (nx * w1)) - (ny * w0);
            w7 = -((nx * w0) + (ny * w1) + (nz * w2));
            var W = worldDQ[n];
            W[0] = w0;
            W[1] = w1;
            W[2] = w2;
            W[3] = w3;
            W[4] = w4;
            W[5] = w5;
            W[6] = w6;
            W[7] = w7;
            S[b] = (((-w3 * q0) + (w0 * q3)) - (w1 * q2)) + (w2 * q1);
            S[b + 1] = (((-w3 * q1) + (w1 * q3)) - (w2 * q0)) + (w0 * q2);
            S[b + 2] = (((-w3 * q2) + (w2 * q3)) - (w0 * q1)) + (w1 * q0);
            S[b + 3] = (w3 * q3) + (w0 * q0) + (w1 * q1) + (w2 * q2);
            S[b + 4] = (((((((-w3 * q4) + (w0 * q7)) - (w1 * q6)) + (w2 * q5)) - (w7 * q0)) + (w4 * q3)) - (w5 * q2)) + (w6 * q1);
            S[b + 5] = (((((((-w3 * q5) + (w1 * q7)) - (w2 * q4)) + (w0 * q6)) - (w7 * q1)) + (w5 * q3)) - (w6 * q0)) + (w4 * q2);
            S[b + 6] = (((((((-w3 * q6) + (w2 * q7)) - (w0 * q5)) + (w1 * q4)) - (w7 * q2)) + (w6 * q3)) - (w4 * q1)) + (w5 * q0);
            S[b + 7] = (w3 * q7) + (w0 * q4) + (w1 * q5) + (w2 * q6) + (w7 * q3) + (w4 * q0) + (w5 * q1) + (w6 * q2);
        }
    }
    
    return S;
}

function sample_node_drag(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    var nodeList = arg0.nodeList;
    var bindMap = arg0.bindMap;
    
    if (arg1 < 0 || arg1 >= arg0.nodeNum)
        return arg2;
    
    var cNode = ds_list_find_value(nodeList, arg1);
    var pNode = ds_list_find_value(nodeList, array_get(cNode, (5 << 0)));
    var b = 8 * ds_list_find_value(bindMap, arg1);
    
    if (!cNode[(8 << 0)])
    {
        var Q = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ1);
        dx = arg3 - (2 * (((-Q[7] * Q[0]) + (Q[4] * Q[3]) + (Q[6] * Q[1])) - (Q[5] * Q[2])));
        dy = arg4 - (2 * (((-Q[7] * Q[1]) + (Q[5] * Q[3]) + (Q[4] * Q[2])) - (Q[6] * Q[0])));
        dz = arg5 - (2 * (((-Q[7] * Q[2]) + (Q[6] * Q[3]) + (Q[5] * Q[0])) - (Q[4] * Q[1])));
        sample_node_translate(arg0, arg1, arg2, dx, dy, dz, true);
        exit;
    }
    
    var C = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ1);
    var c0 = C[0];
    var c1 = C[1];
    var c2 = C[2];
    var c3 = C[3];
    var c4 = C[4];
    var c5 = C[5];
    var c6 = C[6];
    var c7 = C[7];
    var cx = 2 * (((-c7 * c0) + (c4 * c3) + (c6 * c1)) - (c5 * c2));
    var cy = 2 * (((-c7 * c1) + (c5 * c3) + (c4 * c2)) - (c6 * c0));
    var cz = 2 * (((-c7 * c2) + (c6 * c3) + (c5 * c0)) - (c4 * c1));
    var cUpX = 2 * ((c0 * c2) + (c1 * c3));
    var cUpY = 2 * ((c1 * c2) - (c0 * c3));
    var cUpZ = ((c3 * c3) - (c0 * c0) - (c1 * c1)) + (c2 * c2);
    var pPos = sample_get_node_position(arg0, cNode[(5 << 0)], arg2);
    var px = pPos[0];
    var py = pPos[1];
    var pz = pPos[2];
    var M = global.AnimTempM;
    var dx = arg3 - px;
    var dy = arg4 - py;
    var dz = arg5 - pz;
    var l = (dx * dx) + (dy * dy) + (dz * dz);
    
    if (l <= 0)
        exit;
    
    l = 1 / sqrt(l);
    M[0] = dx * l;
    M[1] = dy * l;
    M[2] = dz * l;
    M[4] = (cUpY * M[2]) - (cUpZ * M[1]);
    M[5] = (cUpZ * M[0]) - (cUpX * M[2]);
    M[6] = (cUpX * M[1]) - (cUpY * M[0]);
    l = (M[4] * M[4]) + (M[5] * M[5]) + (M[6] * M[6]);
    
    if (l <= 0)
        exit;
    
    l = 1 / sqrt(l);
    M[4] *= l;
    M[5] *= l;
    M[6] *= l;
    M[8] = (M[1] * M[6]) - (M[2] * M[5]);
    M[9] = (M[2] * M[4]) - (M[0] * M[6]);
    M[10] = (M[0] * M[5]) - (M[1] * M[4]);
    var len = cNode[(9 << 0)];
    M[12] = px + (M[0] * len);
    M[13] = py + (M[1] * len);
    M[14] = pz + (M[2] * len);
    var R = smf_dq_create_from_matrix(M, global.AnimTempQ3);
    var r0 = R[0];
    var r1 = R[1];
    var r2 = R[2];
    var r3 = R[3];
    var r4 = R[4];
    var r5 = R[5];
    var r6 = R[6];
    var r7 = R[7];
    
    if (((r0 * c0) + (r1 * c1) + (r2 * c2) + (r3 * c3)) < 0)
    {
        r0 *= -1;
        r1 *= -1;
        r2 *= -1;
        r3 *= -1;
        r4 *= -1;
        r5 *= -1;
        r6 *= -1;
        r7 *= -1;
    }
    
    var S = cNode[(3 << 0)];
    var s0 = S[0];
    var s1 = S[1];
    var s2 = S[2];
    var s3 = S[3];
    var s4 = S[4];
    var s5 = S[5];
    var s6 = S[6];
    var s7 = S[7];
    arg2[b + 0] = ((r3 * s0) + (r0 * s3) + (r1 * s2)) - (r2 * s1);
    arg2[b + 1] = ((r3 * s1) + (r1 * s3) + (r2 * s0)) - (r0 * s2);
    arg2[b + 2] = ((r3 * s2) + (r2 * s3) + (r0 * s1)) - (r1 * s0);
    arg2[b + 3] = (r3 * s3) - (r0 * s0) - (r1 * s1) - (r2 * s2);
    arg2[b + 4] = ((((r3 * s4) + (r0 * s7) + (r1 * s6)) - (r2 * s5)) + (r7 * s0) + (r4 * s3) + (r5 * s2)) - (r6 * s1);
    arg2[b + 5] = ((((r3 * s5) + (r1 * s7) + (r2 * s4)) - (r0 * s6)) + (r7 * s1) + (r5 * s3) + (r6 * s0)) - (r4 * s2);
    arg2[b + 6] = ((((r3 * s6) + (r2 * s7) + (r0 * s5)) - (r1 * s4)) + (r7 * s2) + (r6 * s3) + (r4 * s1)) - (r5 * s0);
    arg2[b + 7] = (((r3 * s7) - (r0 * s4) - (r1 * s5) - (r2 * s6)) + (r7 * s3)) - (r4 * s0) - (r5 * s1) - (r6 * s2);
    var children = cNode[(6 << 0)];
    var num = array_length(children);
    
    if (num > 0)
    {
        if (arg6)
        {
            c0 = -c0;
            c1 = -c1;
            c2 = -c2;
            c4 = -c4;
            c5 = -c5;
            c6 = -c6;
            var Q = global.AnimTempQ2;
            Q[0] = ((r3 * c0) + (r0 * c3) + (r1 * c2)) - (r2 * c1);
            Q[1] = ((r3 * c1) + (r1 * c3) + (r2 * c0)) - (r0 * c2);
            Q[2] = ((r3 * c2) + (r2 * c3) + (r0 * c1)) - (r1 * c0);
            Q[3] = (r3 * c3) - (r0 * c0) - (r1 * c1) - (r2 * c2);
            Q[4] = ((((r3 * c4) + (r0 * c7) + (r1 * c6)) - (r2 * c5)) + (r7 * c0) + (r4 * c3) + (r5 * c2)) - (r6 * c1);
            Q[5] = ((((r3 * c5) + (r1 * c7) + (r2 * c4)) - (r0 * c6)) + (r7 * c1) + (r5 * c3) + (r6 * c0)) - (r4 * c2);
            Q[6] = ((((r3 * c6) + (r2 * c7) + (r0 * c5)) - (r1 * c4)) + (r7 * c2) + (r6 * c3) + (r4 * c1)) - (r5 * c0);
            Q[7] = (((r3 * c7) - (r0 * c4) - (r1 * c5) - (r2 * c6)) + (r7 * c3)) - (r4 * c0) - (r5 * c1) - (r6 * c2);
            
            for (var i = 0; i < num; i++)
                sample_node_transform(arg0, children[i], arg2, Q, arg6);
        }
        else
        {
            for (var i = 0; i < num; i++)
                sample_node_translate(arg0, children[i], arg2, M[12] - cx, M[13] - cy, M[14] - cz, true);
        }
    }
    
    return [M[12], M[13], M[14]];
}

function sample_node_yaw(arg0, arg1, arg2, arg3, arg4)
{
    var Q = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ4);
    
    if (!is_array(Q) || arg1 >= arg0.nodeNum)
        return arg2;
    
    var node = ds_list_find_value(arg0.nodeList, arg1);
    var q0 = Q[0];
    var q1 = Q[1];
    var q2 = Q[2];
    var q3 = Q[3];
    var q4 = Q[4];
    var q5 = Q[5];
    var q6 = Q[6];
    var q7 = Q[7];
    var s = sin(0.5 * arg3);
    var c = cos(0.5 * arg3);
    var aX = s * 2 * ((q2 * q0) + (q3 * q1));
    var aY = s * 2 * ((q2 * q1) - (q3 * q0));
    var aZ = s * (((q3 * q3) - (q0 * q0) - (q1 * q1)) + (q2 * q2));
    
    if (node[(8 << 0)])
    {
        smf_dq_multiply(Q, node[(4 << 0)], Q);
        q0 = Q[0];
        q1 = Q[1];
        q2 = Q[2];
        q3 = Q[3];
        q4 = Q[4];
        q5 = Q[5];
        q6 = Q[6];
        q7 = Q[7];
    }
    
    var pX = 2 * (((-q7 * q0) + (q4 * q3) + (q6 * q1)) - (q5 * q2));
    var pY = 2 * (((-q7 * q1) + (q5 * q3) + (q4 * q2)) - (q6 * q0));
    var pZ = 2 * (((-q7 * q2) + (q6 * q3) + (q5 * q0)) - (q4 * q1));
    Q[0] = aX;
    Q[1] = aY;
    Q[2] = aZ;
    Q[3] = c;
    Q[4] = (pY * aZ) - (pZ * aY);
    Q[5] = (pZ * aX) - (pX * aZ);
    Q[6] = (pX * aY) - (pY * aX);
    Q[7] = 0;
    sample_node_transform(arg0, arg1, arg2, Q, arg4);
    return arg2;
}

function sample_node_pitch(arg0, arg1, arg2, arg3, arg4)
{
    var Q = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ4);
    
    if (!is_array(Q) || arg1 >= arg0.nodeNum)
        return arg2;
    
    var node = ds_list_find_value(arg0.nodeList, arg1);
    var q0 = Q[0];
    var q1 = Q[1];
    var q2 = Q[2];
    var q3 = Q[3];
    var q4 = Q[4];
    var q5 = Q[5];
    var q6 = Q[6];
    var q7 = Q[7];
    var s = sin(0.5 * arg3);
    var c = cos(0.5 * arg3);
    var aX = s * 2 * ((q0 * q1) - (q2 * q3));
    var aY = s * ((((q3 * q3) - (q0 * q0)) + (q1 * q1)) - (q2 * q2));
    var aZ = s * 2 * ((q1 * q2) + (q0 * q3));
    
    if (node[(8 << 0)])
    {
        smf_dq_multiply(Q, node[(4 << 0)], Q);
        q0 = Q[0];
        q1 = Q[1];
        q2 = Q[2];
        q3 = Q[3];
        q4 = Q[4];
        q5 = Q[5];
        q6 = Q[6];
        q7 = Q[7];
    }
    
    var pX = 2 * (((-q7 * q0) + (q4 * q3) + (q6 * q1)) - (q5 * q2));
    var pY = 2 * (((-q7 * q1) + (q5 * q3) + (q4 * q2)) - (q6 * q0));
    var pZ = 2 * (((-q7 * q2) + (q6 * q3) + (q5 * q0)) - (q4 * q1));
    Q[0] = aX;
    Q[1] = aY;
    Q[2] = aZ;
    Q[3] = c;
    Q[4] = (pY * aZ) - (pZ * aY);
    Q[5] = (pZ * aX) - (pX * aZ);
    Q[6] = (pX * aY) - (pY * aX);
    Q[7] = 0;
    sample_node_transform(arg0, arg1, arg2, Q, arg4);
    return arg2;
}

function sample_node_roll(arg0, arg1, arg2, arg3, arg4)
{
    var Q = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ4);
    
    if (!is_array(Q) || arg1 >= arg0.nodeNum)
        return arg2;
    
    var node = ds_list_find_value(arg0.nodeList, arg1);
    var q0 = Q[0];
    var q1 = Q[1];
    var q2 = Q[2];
    var q3 = Q[3];
    var q4 = Q[4];
    var q5 = Q[5];
    var q6 = Q[6];
    var q7 = Q[7];
    var s = sin(0.5 * arg3);
    var c = cos(0.5 * arg3);
    var aX = s * (((q3 * q3) + (q0 * q0)) - (q1 * q1) - (q2 * q2));
    var aY = s * 2 * ((q0 * q1) + (q3 * q2));
    var aZ = s * 2 * ((q0 * q2) - (q3 * q1));
    
    if (node[(8 << 0)])
    {
        smf_dq_multiply(Q, node[(4 << 0)], Q);
        q0 = Q[0];
        q1 = Q[1];
        q2 = Q[2];
        q3 = Q[3];
        q4 = Q[4];
        q5 = Q[5];
        q6 = Q[6];
        q7 = Q[7];
    }
    
    var pX = 2 * (((-q7 * q0) + (q4 * q3) + (q6 * q1)) - (q5 * q2));
    var pY = 2 * (((-q7 * q1) + (q5 * q3) + (q4 * q2)) - (q6 * q0));
    var pZ = 2 * (((-q7 * q2) + (q6 * q3) + (q5 * q0)) - (q4 * q1));
    Q[0] = aX;
    Q[1] = aY;
    Q[2] = aZ;
    Q[3] = c;
    Q[4] = (pY * aZ) - (pZ * aY);
    Q[5] = (pZ * aX) - (pX * aZ);
    Q[6] = (pX * aY) - (pY * aX);
    Q[7] = 0;
    sample_node_transform(arg0, arg1, arg2, Q, arg4);
    return arg2;
}

function sample_node_rotate_x(arg0, arg1, arg2, arg3)
{
    if (arg1 < 0 || arg1 >= arg0.nodeNum)
        return arg2;
    
    var nodeList = arg0.nodeList;
    var bindMap = arg0.bindMap;
    var node = ds_list_find_value(nodeList, arg1);
    var Q = node[(8 << 0)] ? sample_get_node_dq(arg0, node[(5 << 0)], arg2, global.AnimTempQ1) : sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ1);
    
    if (!is_array(Q))
        return arg2;
    
    var s = sin(0.5 * arg3);
    var c = cos(0.5 * arg3);
    var pY = -s * 2 * (((-Q[7] * Q[1]) + (Q[5] * Q[3]) + (Q[4] * Q[2])) - (Q[6] * Q[0]));
    var pZ = s * 2 * (((-Q[7] * Q[2]) + (Q[6] * Q[3]) + (Q[5] * Q[0])) - (Q[4] * Q[1]));
    var descendants = node[(7 << 0)];
    var num = array_length(descendants);
    var b = ds_list_find_value(bindMap, arg1);
    
    for (var i = 0; i <= num; i++)
    {
        if (b >= 0)
        {
            b *= 8;
            var s0 = arg2[b];
            var s1 = arg2[b + 1];
            var s2 = arg2[b + 2];
            var s3 = arg2[b + 3];
            var s4 = arg2[b + 4];
            var s5 = arg2[b + 5];
            var s6 = arg2[b + 6];
            var s7 = arg2[b + 7];
            arg2[b] = (c * s0) + (s * s3);
            arg2[b + 1] = (c * s1) - (s * s2);
            arg2[b + 2] = (c * s2) + (s * s1);
            arg2[b + 3] = (c * s3) - (s * s0);
            arg2[b + 4] = (c * s4) + (s * s7) + (pZ * s2) + (pY * s1);
            arg2[b + 5] = (((c * s5) - (s * s6)) + (pZ * s3)) - (pY * s0);
            arg2[b + 6] = ((c * s6) + (s * s5)) - (pZ * s0) - (pY * s3);
            arg2[b + 7] = ((c * s7) - (s * s4) - (pZ * s1)) + (pY * s2);
        }
        
        if (i < num)
            b = ds_list_find_value(bindMap, array_get(descendants, i));
    }
    
    return arg2;
}

function sample_node_rotate_y(arg0, arg1, arg2, arg3)
{
    if (arg1 < 0 || arg1 >= arg0.nodeNum)
        return arg2;
    
    var nodeList = arg0.nodeList;
    var bindMap = arg0.bindMap;
    var node = ds_list_find_value(nodeList, arg1);
    var Q = node[(8 << 0)] ? sample_get_node_dq(arg0, node[(5 << 0)], arg2, global.AnimTempQ1) : sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ1);
    
    if (!is_array(Q))
        return arg2;
    
    var s = sin(0.5 * arg3);
    var c = cos(0.5 * arg3);
    var pX = s * 2 * (((-Q[7] * Q[0]) + (Q[4] * Q[3]) + (Q[6] * Q[1])) - (Q[5] * Q[2]));
    var pZ = -s * 2 * (((-Q[7] * Q[2]) + (Q[6] * Q[3]) + (Q[5] * Q[0])) - (Q[4] * Q[1]));
    var descendants = node[(7 << 0)];
    var num = array_length(descendants);
    var b = ds_list_find_value(bindMap, arg1);
    
    for (var i = 0; i <= num; i++)
    {
        if (b >= 0)
        {
            b *= 8;
            var s0 = arg2[b];
            var s1 = arg2[b + 1];
            var s2 = arg2[b + 2];
            var s3 = arg2[b + 3];
            var s4 = arg2[b + 4];
            var s5 = arg2[b + 5];
            var s6 = arg2[b + 6];
            var s7 = arg2[b + 7];
            arg2[b] = (c * s0) + (s * s2);
            arg2[b + 1] = (c * s1) + (s * s3);
            arg2[b + 2] = (c * s2) - (s * s0);
            arg2[b + 3] = (c * s3) - (s * s1);
            arg2[b + 4] = (((c * s4) + (s * s6)) - (pX * s1)) + (pZ * s3);
            arg2[b + 5] = ((c * s5) + (s * s7) + (pX * s0)) - (pZ * s2);
            arg2[b + 6] = ((c * s6) - (s * s4)) + (pX * s3) + (pZ * s1);
            arg2[b + 7] = (c * s7) - (s * s5) - (pX * s2) - (pZ * s0);
        }
        
        if (i < num)
            b = ds_list_find_value(bindMap, array_get(descendants, i));
    }
    
    return arg2;
}

function sample_node_rotate_z(arg0, arg1, arg2, arg3)
{
    if (arg1 < 0 || arg1 >= arg0.nodeNum)
        return arg2;
    
    var nodeList = arg0.nodeList;
    var bindMap = arg0.bindMap;
    var node = ds_list_find_value(nodeList, arg1);
    var Q = node[(8 << 0)] ? sample_get_node_dq(arg0, node[(5 << 0)], arg2, global.AnimTempQ1) : sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ1);
    
    if (!is_array(Q))
        return arg2;
    
    var s = sin(0.5 * arg3);
    var c = cos(0.5 * arg3);
    var pX = -s * 2 * (((-Q[7] * Q[0]) + (Q[4] * Q[3]) + (Q[6] * Q[1])) - (Q[5] * Q[2]));
    var pY = s * 2 * (((-Q[7] * Q[1]) + (Q[5] * Q[3]) + (Q[4] * Q[2])) - (Q[6] * Q[0]));
    var descendants = node[(7 << 0)];
    var num = array_length(descendants);
    var b = ds_list_find_value(bindMap, arg1);
    
    for (var i = 0; i <= num; i++)
    {
        if (b >= 0)
        {
            b *= 8;
            var s0 = arg2[b];
            var s1 = arg2[b + 1];
            var s2 = arg2[b + 2];
            var s3 = arg2[b + 3];
            var s4 = arg2[b + 4];
            var s5 = arg2[b + 5];
            var s6 = arg2[b + 6];
            var s7 = arg2[b + 7];
            arg2[b] = (c * s0) - (s * s1);
            arg2[b + 1] = (c * s1) + (s * s0);
            arg2[b + 2] = (c * s2) + (s * s3);
            arg2[b + 3] = (c * s3) - (s * s2);
            arg2[b + 4] = ((c * s4) - (s * s5)) + (pX * s2) + (pY * s3);
            arg2[b + 5] = ((c * s5) + (s * s4) + (pX * s3)) - (pY * s2);
            arg2[b + 6] = (((c * s6) + (s * s7)) - (pX * s0)) + (pY * s1);
            arg2[b + 7] = (c * s7) - (s * s6) - (pX * s1) - (pY * s0);
        }
        
        if (i < num)
            b = ds_list_find_value(bindMap, array_get(descendants, i));
    }
    
    return arg2;
}

function sample_node_rotate(arg0, arg1, arg2, arg3, arg4, arg5)
{
    if (arg1 < 0 || arg1 >= arg0.nodeNum)
        return arg2;
    
    var nodeList = arg0.nodeList;
    var node = ds_list_find_value(nodeList, arg1);
    var Q = node[(8 << 0)] ? sample_get_node_dq(arg0, node[(5 << 0)], arg2, global.AnimTempQ1) : sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ1);
    
    if (!is_array(Q))
        return arg2;
    
    var q0 = Q[0];
    var q1 = Q[1];
    var q2 = Q[2];
    var q3 = Q[3];
    var q4 = Q[4];
    var q5 = Q[5];
    var q6 = Q[6];
    var q7 = Q[7];
    var pX = 2 * (((-q7 * q0) + (q4 * q3) + (q6 * q1)) - (q5 * q2));
    var pY = 2 * (((-q7 * q1) + (q5 * q3) + (q4 * q2)) - (q6 * q0));
    var pZ = 2 * (((-q7 * q2) + (q6 * q3) + (q5 * q0)) - (q4 * q1));
    var xs = sin(0.5 * arg3);
    var xc = cos(0.5 * arg3);
    var ys = sin(0.5 * arg4);
    var yc = cos(0.5 * arg4);
    var zs = sin(0.5 * arg5);
    var zc = cos(0.5 * arg5);
    var r0 = (zc * xs * yc) - (zs * xc * ys);
    var r1 = (zc * xc * ys) + (zs * xs * yc);
    var r2 = (zc * xs * ys) + (zs * xc * yc);
    var r3 = (zc * xc * yc) - (zs * xs * ys);
    var r4 = (pY * r2) - (pZ * r1);
    var r5 = (pZ * r0) - (pX * r2);
    var r6 = (pX * r1) - (pY * r0);
    var bindMap = arg0.bindMap;
    var b = ds_list_find_value(arg0.bindMap, arg1);
    var descendants = node[(7 << 0)];
    var i = array_length(descendants);
    
    while (true)
    {
        if (b >= 0)
        {
            b *= 8;
            var s0 = arg2[b];
            var s1 = arg2[b + 1];
            var s2 = arg2[b + 2];
            var s3 = arg2[b + 3];
            var s4 = arg2[b + 4];
            var s5 = arg2[b + 5];
            var s6 = arg2[b + 6];
            var s7 = arg2[b + 7];
            arg2[b] = ((r3 * s0) + (r0 * s3) + (r1 * s2)) - (r2 * s1);
            arg2[b + 1] = ((r3 * s1) - (r0 * s2)) + (r1 * s3) + (r2 * s0);
            arg2[b + 2] = (((r3 * s2) + (r0 * s1)) - (r1 * s0)) + (r2 * s3);
            arg2[b + 3] = (r3 * s3) - (r0 * s0) - (r1 * s1) - (r2 * s2);
            arg2[b + 4] = ((((r3 * s4) + (r0 * s7) + (r1 * s6)) - (r2 * s5)) + (r4 * s3) + (r5 * s2)) - (r6 * s1);
            arg2[b + 5] = ((((r3 * s5) - (r0 * s6)) + (r1 * s7) + (r2 * s4)) - (r4 * s2)) + (r5 * s3) + (r6 * s0);
            arg2[b + 6] = (((((r3 * s6) + (r0 * s5)) - (r1 * s4)) + (r2 * s7) + (r4 * s1)) - (r5 * s0)) + (r6 * s3);
            arg2[b + 7] = (r3 * s7) - (r0 * s4) - (r1 * s5) - (r2 * s6) - (r4 * s0) - (r5 * s1) - (r6 * s2);
        }
        
        if (i <= 0)
            break;
        
        b = ds_list_find_value(bindMap, array_get(descendants, --i));
    }
    
    return arg2;
}

function sample_node_rotate_axis(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    if (arg1 < 0 || arg1 >= arg0.nodeNum)
        return arg2;
    
    var nodeList = arg0.nodeList;
    var node = ds_list_find_value(nodeList, arg1);
    var s = sin(0.5 * arg3);
    var c = cos(0.5 * arg3);
    arg4 *= s;
    arg5 *= s;
    arg6 *= s;
    var Q = node[(8 << 0)] ? sample_get_node_dq(arg0, node[(5 << 0)], arg2, global.AnimTempQ4) : sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ4);
    var pX = 2 * (((-Q[7] * Q[0]) + (Q[4] * Q[3]) + (Q[6] * Q[1])) - (Q[5] * Q[2]));
    var pY = 2 * (((-Q[7] * Q[1]) + (Q[5] * Q[3]) + (Q[4] * Q[2])) - (Q[6] * Q[0]));
    var pZ = 2 * (((-Q[7] * Q[2]) + (Q[6] * Q[3]) + (Q[5] * Q[0])) - (Q[4] * Q[1]));
    Q[0] = arg4;
    Q[1] = arg5;
    Q[2] = arg6;
    Q[3] = c;
    Q[4] = (pY * arg6) - (pZ * arg5);
    Q[5] = (pZ * arg4) - (pX * arg6);
    Q[6] = (pX * arg5) - (pY * arg4);
    Q[7] = 0;
    sample_node_transform(arg0, arg1, arg2, Q, arg7);
    return arg2;
}

function sample_normalize(arg0)
{
    var S = arg0;
    var i = array_length(S);
    
    repeat (i div 8)
    {
        i -= 8;
        var s0 = S[i];
        var s1 = S[i + 1];
        var s2 = S[i + 2];
        var s3 = S[i + 3];
        var s4 = S[i + 4];
        var s5 = S[i + 5];
        var s6 = S[i + 6];
        var s7 = S[i + 7];
        var l = (s0 * s0) + (s1 * s1) + (s2 * s2) + (s3 * s3);
        
        if (l != 1 && l != 0)
        {
            l = 1 / sqrt(l);
            s0 *= l;
            s1 *= l;
            s2 *= l;
            s3 *= l;
        }
        
        var d = (s0 * s4) + (s1 * s5) + (s2 * s6) + (s3 * s7);
        
        if (d != 0)
        {
            S[i] = s0;
            S[i + 1] = s1;
            S[i + 2] = s2;
            S[i + 3] = s3;
            S[i + 4] = (s4 - (s0 * d)) * l;
            S[i + 5] = (s5 - (s1 * d)) * l;
            S[i + 6] = (s6 - (s2 * d)) * l;
            S[i + 7] = (s7 - (s3 * d)) * l;
        }
    }
}

function sample_node_move(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var nodeList = arg0.nodeList;
    
    if (arg1 >= arg0.nodeNum)
    {
        show_debug_message("Error in sample_node_move_fast: Node does not exist in rig");
        exit;
    }
    
    var cNode = ds_list_find_value(nodeList, arg1);
    var pNode = ds_list_find_value(nodeList, array_get(cNode, (5 << 0)));
    
    if (cNode[(8 << 0)] && pNode[(8 << 0)] && !pNode[(11 << 0)])
    {
        sample_node_ik(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
        exit;
    }
    
    sample_node_drag(arg0, arg1, arg2, arg3, arg4, arg5, arg7);
}

function sample_node_move_fast(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var nodeList = arg0.nodeList;
    var bindMap = arg0.bindMap;
    
    if (arg1 >= arg0.nodeNum)
    {
        show_debug_message("Error in sample_node_move_fast: Node does not exist in rig");
        exit;
    }
    
    var cNode = ds_list_find_value(nodeList, arg1);
    var pNode = ds_list_find_value(nodeList, array_get(cNode, (5 << 0)));
    
    if (!cNode[(8 << 0)])
    {
        var Q = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ1);
        var dx = arg3 - (2 * (((-Q[7] * Q[0]) + (Q[4] * Q[3]) + (Q[6] * Q[1])) - (Q[5] * Q[2])));
        var dy = arg4 - (2 * (((-Q[7] * Q[1]) + (Q[5] * Q[3]) + (Q[4] * Q[2])) - (Q[6] * Q[0])));
        var dz = arg5 - (2 * (((-Q[7] * Q[2]) + (Q[6] * Q[3]) + (Q[5] * Q[0])) - (Q[4] * Q[1])));
        sample_node_translate(arg0, arg1, arg2, dx, dy, dz, true);
        return true;
    }
    
    if (pNode[(8 << 0)] && !pNode[(11 << 0)])
    {
        sample_node_ik_fast(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
        return true;
    }
    
    sample_node_drag(arg0, arg1, arg2, arg3, arg4, arg5, arg7);
    return true;
}

function sample_node_ik(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var bindMap = arg0.bindMap;
    var nodeList = arg0.nodeList;
    var cNode = ds_list_find_value(nodeList, arg1);
    var pNode = ds_list_find_value(nodeList, array_get(cNode, (5 << 0)));
    var gNode = ds_list_find_value(nodeList, array_get(pNode, (5 << 0)));
    
    if (!cNode[(8 << 0)] || !pNode[(8 << 0)])
    {
        show_debug_message("Error in script sample_node_ik: Cannot perform inverse kinematics on nodes that aren't bones");
        exit;
    }
    
    var Cb = 8 * ds_list_find_value(bindMap, arg1);
    var r0 = arg2[Cb];
    var r1 = arg2[Cb + 1];
    var r2 = arg2[Cb + 2];
    var r3 = arg2[Cb + 3];
    var r4 = arg2[Cb + 4];
    var r5 = arg2[Cb + 5];
    var r6 = arg2[Cb + 6];
    var r7 = arg2[Cb + 7];
    var S = cNode[(1 << 0)];
    var s0 = S[0];
    var s1 = S[1];
    var s2 = S[2];
    var s3 = S[3];
    var s4 = S[4];
    var s5 = S[5];
    var s6 = S[6];
    var s7 = S[7];
    var C0 = ((r3 * s0) + (r0 * s3) + (r1 * s2)) - (r2 * s1);
    var C1 = ((r3 * s1) + (r1 * s3) + (r2 * s0)) - (r0 * s2);
    var C2 = ((r3 * s2) + (r2 * s3) + (r0 * s1)) - (r1 * s0);
    var C3 = (r3 * s3) - (r0 * s0) - (r1 * s1) - (r2 * s2);
    var C4 = ((((r3 * s4) + (r0 * s7) + (r1 * s6)) - (r2 * s5)) + (r7 * s0) + (r4 * s3) + (r5 * s2)) - (r6 * s1);
    var C5 = ((((r3 * s5) + (r1 * s7) + (r2 * s4)) - (r0 * s6)) + (r7 * s1) + (r5 * s3) + (r6 * s0)) - (r4 * s2);
    var C6 = ((((r3 * s6) + (r2 * s7) + (r0 * s5)) - (r1 * s4)) + (r7 * s2) + (r6 * s3) + (r4 * s1)) - (r5 * s0);
    var C7 = (((r3 * s7) - (r0 * s4) - (r1 * s5) - (r2 * s6)) + (r7 * s3)) - (r4 * s0) - (r5 * s1) - (r6 * s2);
    var Cx = 2 * (((-C7 * C0) + (C4 * C3) + (C6 * C1)) - (C5 * C2));
    var Cy = 2 * (((-C7 * C1) + (C5 * C3) + (C4 * C2)) - (C6 * C0));
    var Cz = 2 * (((-C7 * C2) + (C6 * C3) + (C5 * C0)) - (C4 * C1));
    var Cupx = 2 * ((C0 * C2) + (C1 * C3));
    var Cupy = 2 * ((C1 * C2) - (C0 * C3));
    var Cupz = ((C3 * C3) - (C0 * C0) - (C1 * C1)) + (C2 * C2);
    var Pb = 8 * ds_list_find_value(bindMap, array_get(cNode, (5 << 0)));
    r0 = arg2[Pb];
    r1 = arg2[Pb + 1];
    r2 = arg2[Pb + 2];
    r3 = arg2[Pb + 3];
    r4 = arg2[Pb + 4];
    r5 = arg2[Pb + 5];
    r6 = arg2[Pb + 6];
    r7 = arg2[Pb + 7];
    S = pNode[(1 << 0)];
    s0 = S[0];
    s1 = S[1];
    s2 = S[2];
    s3 = S[3];
    s4 = S[4];
    s5 = S[5];
    s6 = S[6];
    s7 = S[7];
    var P0 = ((r3 * s0) + (r0 * s3) + (r1 * s2)) - (r2 * s1);
    var P1 = ((r3 * s1) + (r1 * s3) + (r2 * s0)) - (r0 * s2);
    var P2 = ((r3 * s2) + (r2 * s3) + (r0 * s1)) - (r1 * s0);
    var P3 = (r3 * s3) - (r0 * s0) - (r1 * s1) - (r2 * s2);
    var P4 = ((((r3 * s4) + (r0 * s7) + (r1 * s6)) - (r2 * s5)) + (r7 * s0) + (r4 * s3) + (r5 * s2)) - (r6 * s1);
    var P5 = ((((r3 * s5) + (r1 * s7) + (r2 * s4)) - (r0 * s6)) + (r7 * s1) + (r5 * s3) + (r6 * s0)) - (r4 * s2);
    var P6 = ((((r3 * s6) + (r2 * s7) + (r0 * s5)) - (r1 * s4)) + (r7 * s2) + (r6 * s3) + (r4 * s1)) - (r5 * s0);
    var P7 = (((r3 * s7) - (r0 * s4) - (r1 * s5) - (r2 * s6)) + (r7 * s3)) - (r4 * s0) - (r5 * s1) - (r6 * s2);
    var Px = 2 * (((-P7 * P0) + (P4 * P3) + (P6 * P1)) - (P5 * P2));
    var Py = 2 * (((-P7 * P1) + (P5 * P3) + (P4 * P2)) - (P6 * P0));
    var Pz = 2 * (((-P7 * P2) + (P6 * P3) + (P5 * P0)) - (P4 * P1));
    var Pupx = 2 * ((P0 * P2) + (P1 * P3));
    var Pupy = 2 * ((P1 * P2) - (P0 * P3));
    var Pupz = ((P3 * P3) - (P0 * P0) - (P1 * P1)) + (P2 * P2);
    S = gNode[(1 << 0)];
    s0 = S[0];
    s1 = S[1];
    s2 = S[2];
    s3 = S[3];
    s4 = S[4];
    s5 = S[5];
    s6 = S[6];
    s7 = S[7];
    var G0 = ((r3 * s0) + (r0 * s3) + (r1 * s2)) - (r2 * s1);
    var G1 = ((r3 * s1) + (r1 * s3) + (r2 * s0)) - (r0 * s2);
    var G2 = ((r3 * s2) + (r2 * s3) + (r0 * s1)) - (r1 * s0);
    var G3 = (r3 * s3) - (r0 * s0) - (r1 * s1) - (r2 * s2);
    var G4 = ((((r3 * s4) + (r0 * s7) + (r1 * s6)) - (r2 * s5)) + (r7 * s0) + (r4 * s3) + (r5 * s2)) - (r6 * s1);
    var G5 = ((((r3 * s5) + (r1 * s7) + (r2 * s4)) - (r0 * s6)) + (r7 * s1) + (r5 * s3) + (r6 * s0)) - (r4 * s2);
    var G6 = ((((r3 * s6) + (r2 * s7) + (r0 * s5)) - (r1 * s4)) + (r7 * s2) + (r6 * s3) + (r4 * s1)) - (r5 * s0);
    var G7 = (((r3 * s7) - (r0 * s4) - (r1 * s5) - (r2 * s6)) + (r7 * s3)) - (r4 * s0) - (r5 * s1) - (r6 * s2);
    var Gx = 2 * (((-G7 * G0) + (G4 * G3) + (G6 * G1)) - (G5 * G2));
    var Gy = 2 * (((-G7 * G1) + (G5 * G3) + (G4 * G2)) - (G6 * G0));
    var Gz = 2 * (((-G7 * G2) + (G6 * G3) + (G5 * G0)) - (G4 * G1));
    var oldX = Cx;
    var oldY = Cy;
    var oldZ = Cz;
    var pOldX = Px;
    var pOldY = Py;
    var pOldZ = Pz;
    var GtoCx = Cx - Gx;
    var GtoCy = Cy - Gy;
    var GtoCz = Cz - Gz;
    var GtoPx = Px - Gx;
    var GtoPy = Py - Gy;
    var GtoPz = Pz - Gz;
    var GtoNx = arg3 - Gx;
    var GtoNy = arg4 - Gy;
    var GtoNz = arg5 - Gz;
    var p_c = cNode[(9 << 0)];
    var g_p = pNode[(9 << 0)];
    var g_n = sqrt((GtoNx * GtoNx) + (GtoNy * GtoNy) + (GtoNz * GtoNz));
    var a = clamp(g_n, abs(g_p - p_c) + (g_p * 0.01), (g_p + p_c) * 0.99);
    
    if (a != g_n)
    {
        d = a / g_n;
        GtoNx *= d;
        GtoNy *= d;
        GtoNz *= d;
        arg3 = Gx + GtoNx;
        arg4 = Gy + GtoNy;
        arg5 = Gz + GtoNz;
        g_n = a;
    }
    
    var g_nsqr = g_n * g_n;
    var p_csqr = p_c * p_c;
    var g_psqr = g_p * g_p;
    var intersectionRadius = sqrt(p_csqr - (sqr(g_psqr - p_csqr - g_nsqr) / (4 * g_nsqr)));
    var l = sqrt(g_psqr - (intersectionRadius * intersectionRadius)) / g_n;
    
    if (g_nsqr < (p_csqr - g_psqr))
        l = -l;
    
    var middleX = Gx + (GtoNx * l);
    var middleY = Gy + (GtoNy * l);
    var middleZ = Gz + (GtoNz * l);
    var primaryAxis = cNode[(10 << 0)];
    var primX, primY, primZ;
    
    if (!arg6 && is_array(primaryAxis))
    {
        primX = primaryAxis[0];
        primY = primaryAxis[1];
        primZ = primaryAxis[2];
    }
    else
    {
        primX = Cx - Px;
        primY = Cy - Py;
        primZ = Cz - Pz;
        var axisX = GtoPx + GtoCx;
        var axisY = GtoPy + GtoCy;
        var axisZ = GtoPz + GtoCz;
        dp = ((primX * axisX) + (primY * axisY) + (primZ * axisZ)) / ((axisX * axisX) + (axisY * axisY) + (axisZ * axisZ));
        primX -= (axisX * dp);
        primY -= (axisY * dp);
        primZ -= (axisZ * dp);
        l = (primX * primX) + (primY * primY) + (primZ * primZ);
        
        if (l == 0)
            return false;
        
        l = 1 / sqrt(l);
        primX *= l;
        primY *= l;
        primZ *= l;
        
        if (!arg6)
            cNode[(10 << 0)] = [primX, primY, primZ];
    }
    
    var dp = (primX * GtoCx) + (primY * GtoCy) + (primZ * GtoCz);
    var oldDx = GtoCx - (dp * primX);
    var oldDy = GtoCy - (dp * primY);
    var oldDz = GtoCz - (dp * primZ);
    dp = (primX * GtoNx) + (primY * GtoNy) + (primZ * GtoNz);
    var newDx = GtoNx - (dp * primX);
    var newDy = GtoNy - (dp * primY);
    var newDz = GtoNz - (dp * primZ);
    l = ((oldDx * oldDx) + (oldDy * oldDy) + (oldDz * oldDz)) * ((newDx * newDx) + (newDy * newDy) + (newDz * newDz));
    
    if (l == 0)
        return false;
    
    l = 1 / sqrt(l);
    var _sin = l * ((((oldDy * newDz) - (oldDz * newDy)) * primX) + (((oldDz * newDx) - (oldDx * newDz)) * primY) + (((oldDx * newDy) - (oldDy * newDx)) * primZ));
    var _cos = l * ((oldDx * newDx) + (oldDy * newDy) + (oldDz * newDz));
    var rx = GtoCx;
    var ry = GtoCy;
    var rz = GtoCz;
    var d = (1 - _cos) * ((primX * rx) + (primY * ry) + (primZ * rz));
    GtoCx = (rx * _cos) + (primX * d) + (((primY * rz) - (primZ * ry)) * _sin);
    GtoCy = (ry * _cos) + (primY * d) + (((primZ * rx) - (primX * rz)) * _sin);
    GtoCz = (rz * _cos) + (primZ * d) + (((primX * ry) - (primY * rx)) * _sin);
    rx = Cupx;
    ry = Cupy;
    rz = Cupz;
    d = (1 - _cos) * ((primX * rx) + (primY * ry) + (primZ * rz));
    Cupx = (rx * _cos) + (primX * d) + (((primY * rz) - (primZ * ry)) * _sin);
    Cupy = (ry * _cos) + (primY * d) + (((primZ * rx) - (primX * rz)) * _sin);
    Cupz = (rz * _cos) + (primZ * d) + (((primX * ry) - (primY * rx)) * _sin);
    rx = GtoPx;
    ry = GtoPy;
    rz = GtoPz;
    d = (1 - _cos) * ((primX * rx) + (primY * ry) + (primZ * rz));
    GtoPx = (rx * _cos) + (primX * d) + (((primY * rz) - (primZ * ry)) * _sin);
    GtoPy = (ry * _cos) + (primY * d) + (((primZ * rx) - (primX * rz)) * _sin);
    GtoPz = (rz * _cos) + (primZ * d) + (((primX * ry) - (primY * rx)) * _sin);
    rx = Pupx;
    ry = Pupy;
    rz = Pupz;
    d = (1 - _cos) * ((primX * rx) + (primY * ry) + (primZ * rz));
    Pupx = (rx * _cos) + (primX * d) + (((primY * rz) - (primZ * ry)) * _sin);
    Pupy = (ry * _cos) + (primY * d) + (((primZ * rx) - (primX * rz)) * _sin);
    Pupz = (rz * _cos) + (primZ * d) + (((primX * ry) - (primY * rx)) * _sin);
    var secX = (GtoCy * primZ) - (GtoCz * primY);
    var secY = (GtoCz * primX) - (GtoCx * primZ);
    var secZ = (GtoCx * primY) - (GtoCy * primX);
    l = (secX * secX) + (secY * secY) + (secZ * secZ);
    
    if (l == 0)
        return false;
    
    l = 1 / sqrt(l);
    secX *= l;
    secY *= l;
    secZ *= l;
    dp = (secX * GtoCx) + (secY * GtoCy) + (secZ * GtoCz);
    oldDx = GtoCx - (dp * secX);
    oldDy = GtoCy - (dp * secY);
    oldDz = GtoCz - (dp * secZ);
    dp = (secX * GtoNx) + (secY * GtoNy) + (secZ * GtoNz);
    newDx = GtoNx - (dp * secX);
    newDy = GtoNy - (dp * secY);
    newDz = GtoNz - (dp * secZ);
    l = ((oldDx * oldDx) + (oldDy * oldDy) + (oldDz * oldDz)) * ((newDx * newDx) + (newDy * newDy) + (newDz * newDz));
    
    if (l == 0)
        return false;
    
    l = 1 / sqrt(l);
    _sin = l * ((((oldDy * newDz) - (oldDz * newDy)) * secX) + (((oldDz * newDx) - (oldDx * newDz)) * secY) + (((oldDx * newDy) - (oldDy * newDx)) * secZ));
    _cos = l * ((oldDx * newDx) + (oldDy * newDy) + (oldDz * newDz));
    rx = Cupx;
    ry = Cupy;
    rz = Cupz;
    d = (1 - _cos) * ((secX * rx) + (secY * ry) + (secZ * rz));
    Cupx = (rx * _cos) + (secX * d) + (((secY * rz) - (secZ * ry)) * _sin);
    Cupy = (ry * _cos) + (secY * d) + (((secZ * rx) - (secX * rz)) * _sin);
    Cupz = (rz * _cos) + (secZ * d) + (((secX * ry) - (secY * rx)) * _sin);
    rx = GtoPx;
    ry = GtoPy;
    rz = GtoPz;
    d = (1 - _cos) * ((secX * rx) + (secY * ry) + (secZ * rz));
    GtoPx = (rx * _cos) + (secX * d) + (((secY * rz) - (secZ * ry)) * _sin);
    GtoPy = (ry * _cos) + (secY * d) + (((secZ * rx) - (secX * rz)) * _sin);
    GtoPz = (rz * _cos) + (secZ * d) + (((secX * ry) - (secY * rx)) * _sin);
    rx = Pupx;
    ry = Pupy;
    rz = Pupz;
    d = (1 - _cos) * ((secX * rx) + (secY * ry) + (secZ * rz));
    Pupx = (rx * _cos) + (secX * d) + (((secY * rz) - (secZ * ry)) * _sin);
    Pupy = (ry * _cos) + (secY * d) + (((secZ * rx) - (secX * rz)) * _sin);
    Pupz = (rz * _cos) + (secZ * d) + (((secX * ry) - (secY * rx)) * _sin);
    var mx = (Gx + GtoPx) - middleX;
    var my = (Gy + GtoPy) - middleY;
    var mz = (Gz + GtoPz) - middleZ;
    dp = (mx * secX) + (my * secY) + (mz * secZ);
    mx -= (secX * dp);
    my -= (secY * dp);
    mz -= (secZ * dp);
    dp = ((mx * GtoNx) + (my * GtoNy) + (mz * GtoNz)) / g_nsqr;
    mx -= (GtoNx * dp);
    my -= (GtoNy * dp);
    mz -= (GtoNz * dp);
    var m = (mx * mx) + (my * my) + (mz * mz);
    
    if (m > 0)
        m = intersectionRadius / sqrt(m);
    
    Px = middleX + (mx * m);
    Py = middleY + (my * m);
    Pz = middleZ + (mz * m);
    var M0 = (Px - Gx) / g_p;
    var M1 = (Py - Gy) / g_p;
    var M2 = (Pz - Gz) / g_p;
    var M4 = (Pupy * M2) - (Pupz * M1);
    var M5 = (Pupz * M0) - (Pupx * M2);
    var M6 = (Pupx * M1) - (Pupy * M0);
    m = (M4 * M4) + (M5 * M5) + (M6 * M6);
    
    if (m == 0)
        return false;
    
    l = 1 / sqrt(m);
    M4 *= l;
    M5 *= l;
    M6 *= l;
    var M8 = (M1 * M6) - (M2 * M5);
    var M9 = (M2 * M4) - (M0 * M6);
    var M10 = (M0 * M5) - (M1 * M4);
    var T = 1 + M0 + M5 + M10;
    var Q0, Q1, Q2, Q3;
    
    if (T > 0)
    {
        S = sqrt(T) * 2;
        Q0 = (M9 - M6) / S;
        Q1 = (M2 - M8) / S;
        Q2 = (M4 - M1) / S;
        Q3 = -0.25 * S;
    }
    else if (M0 > M5 && M0 > M10)
    {
        S = sqrt((1 + M0) - M5 - M10) * 2;
        Q0 = 0.25 * S;
        Q1 = (M4 + M1) / S;
        Q2 = (M2 + M8) / S;
        Q3 = (M9 - M6) / S;
    }
    else if (M5 > M10)
    {
        S = sqrt((1 + M5) - M0 - M10) * 2;
        Q0 = (M4 + M1) / S;
        Q1 = 0.25 * S;
        Q2 = (M9 + M6) / S;
        Q3 = (M2 - M8) / S;
    }
    else
    {
        S = sqrt((1 + M10) - M0 - M5) * 2;
        Q0 = (M2 + M8) / S;
        Q1 = (M9 + M6) / S;
        Q2 = 0.25 * S;
        Q3 = (M4 - M1) / S;
    }
    
    if (((Q0 * P0) + (Q1 * P1) + (Q2 * P2) + (Q3 * P3)) < 0)
    {
        Q0 = -Q0;
        Q1 = -Q1;
        Q2 = -Q2;
        Q3 = -Q3;
    }
    
    var Q4 = 0.5 * (((Px * Q3) + (Py * Q2)) - (Pz * Q1));
    var Q5 = 0.5 * (((Py * Q3) + (Pz * Q0)) - (Px * Q2));
    var Q6 = 0.5 * (((Pz * Q3) + (Px * Q1)) - (Py * Q0));
    var Q7 = -0.5 * ((Px * Q0) + (Py * Q1) + (Pz * Q2));
    S = pNode[(3 << 0)];
    s0 = S[0];
    s1 = S[1];
    s2 = S[2];
    s3 = S[3];
    s4 = S[4];
    s5 = S[5];
    s6 = S[6];
    s7 = S[7];
    arg2[Pb] = ((Q3 * s0) + (Q0 * s3) + (Q1 * s2)) - (Q2 * s1);
    arg2[Pb + 1] = ((Q3 * s1) + (Q1 * s3) + (Q2 * s0)) - (Q0 * s2);
    arg2[Pb + 2] = ((Q3 * s2) + (Q2 * s3) + (Q0 * s1)) - (Q1 * s0);
    arg2[Pb + 3] = (Q3 * s3) - (Q0 * s0) - (Q1 * s1) - (Q2 * s2);
    arg2[Pb + 4] = ((((Q3 * s4) + (Q0 * s7) + (Q1 * s6)) - (Q2 * s5)) + (Q7 * s0) + (Q4 * s3) + (Q5 * s2)) - (Q6 * s1);
    arg2[Pb + 5] = ((((Q3 * s5) + (Q1 * s7) + (Q2 * s4)) - (Q0 * s6)) + (Q7 * s1) + (Q5 * s3) + (Q6 * s0)) - (Q4 * s2);
    arg2[Pb + 6] = ((((Q3 * s6) + (Q2 * s7) + (Q0 * s5)) - (Q1 * s4)) + (Q7 * s2) + (Q6 * s3) + (Q4 * s1)) - (Q5 * s0);
    arg2[Pb + 7] = (((Q3 * s7) - (Q0 * s4) - (Q1 * s5) - (Q2 * s6)) + (Q7 * s3)) - (Q4 * s0) - (Q5 * s1) - (Q6 * s2);
    var children = pNode[(6 << 0)];
    var childNum = array_length(children);
    
    if (childNum > 0)
    {
        if (arg7)
        {
            var R = global.AnimTempQ1;
            R[0] = (((-Q3 * P0) + (Q0 * P3)) - (Q1 * P2)) + (Q2 * P1);
            R[1] = (((-Q3 * P1) + (Q1 * P3)) - (Q2 * P0)) + (Q0 * P2);
            R[2] = (((-Q3 * P2) + (Q2 * P3)) - (Q0 * P1)) + (Q1 * P0);
            R[3] = (Q3 * P3) + (Q0 * P0) + (Q1 * P1) + (Q2 * P2);
            R[4] = (((((((-Q3 * P4) + (Q0 * P7)) - (Q1 * P6)) + (Q2 * P5)) - (Q7 * P0)) + (Q4 * P3)) - (Q5 * P2)) + (Q6 * P1);
            R[5] = (((((((-Q3 * P5) + (Q1 * P7)) - (Q2 * P4)) + (Q0 * P6)) - (Q7 * P1)) + (Q5 * P3)) - (Q6 * P0)) + (Q4 * P2);
            R[6] = (((((((-Q3 * P6) + (Q2 * P7)) - (Q0 * P5)) + (Q1 * P4)) - (Q7 * P2)) + (Q6 * P3)) - (Q4 * P1)) + (Q5 * P0);
            R[7] = (Q3 * P7) + (Q0 * P4) + (Q1 * P5) + (Q2 * P6) + (Q7 * P3) + (Q4 * P0) + (Q5 * P1) + (Q6 * P2);
            
            for (var i = 0; i < childNum; i++)
            {
                var child = children[i];
                
                if (child == arg1)
                    continue;
                
                sample_node_transform(arg0, child, arg2, R, true);
            }
        }
        else
        {
            var dx = arg3 - pOldX;
            var dy = arg4 - pOldY;
            var dz = arg5 - pOldZ;
            
            for (var i = 0; i < childNum; i++)
            {
                var child = children[i];
                
                if (child == arg1)
                    continue;
                
                sample_node_translate(arg0, child, arg2, dx, dy, dz, true);
            }
        }
    }
    
    M0 = (arg3 - Px) / p_c;
    M1 = (arg4 - Py) / p_c;
    M2 = (arg5 - Pz) / p_c;
    M4 = (Cupy * M2) - (Cupz * M1);
    M5 = (Cupz * M0) - (Cupx * M2);
    M6 = (Cupx * M1) - (Cupy * M0);
    m = (M4 * M4) + (M5 * M5) + (M6 * M6);
    
    if (m == 0)
        return false;
    
    l = 1 / sqrt(m);
    M4 *= l;
    M5 *= l;
    M6 *= l;
    M8 = (M1 * M6) - (M2 * M5);
    M9 = (M2 * M4) - (M0 * M6);
    M10 = (M0 * M5) - (M1 * M4);
    T = 1 + M0 + M5 + M10;
    
    if (T > 0)
    {
        S = sqrt(T) * 2;
        Q0 = (M9 - M6) / S;
        Q1 = (M2 - M8) / S;
        Q2 = (M4 - M1) / S;
        Q3 = -0.25 * S;
    }
    else if (M0 > M5 && M0 > M10)
    {
        S = sqrt((1 + M0) - M5 - M10) * 2;
        Q0 = 0.25 * S;
        Q1 = (M4 + M1) / S;
        Q2 = (M2 + M8) / S;
        Q3 = (M9 - M6) / S;
    }
    else if (M5 > M10)
    {
        S = sqrt((1 + M5) - M0 - M10) * 2;
        Q0 = (M4 + M1) / S;
        Q1 = 0.25 * S;
        Q2 = (M9 + M6) / S;
        Q3 = (M2 - M8) / S;
    }
    else
    {
        S = sqrt((1 + M10) - M0 - M5) * 2;
        Q0 = (M2 + M8) / S;
        Q1 = (M9 + M6) / S;
        Q2 = 0.25 * S;
        Q3 = (M4 - M1) / S;
    }
    
    if (((Q0 * C0) + (Q1 * C1) + (Q2 * C2) + (Q3 * C3)) < 0)
    {
        Q0 = -Q0;
        Q1 = -Q1;
        Q2 = -Q2;
        Q3 = -Q3;
    }
    
    Q4 = 0.5 * (((arg3 * Q3) + (arg4 * Q2)) - (arg5 * Q1));
    Q5 = 0.5 * (((arg4 * Q3) + (arg5 * Q0)) - (arg3 * Q2));
    Q6 = 0.5 * (((arg5 * Q3) + (arg3 * Q1)) - (arg4 * Q0));
    Q7 = -0.5 * ((arg3 * Q0) + (arg4 * Q1) + (arg5 * Q2));
    S = cNode[(3 << 0)];
    s0 = S[0];
    s1 = S[1];
    s2 = S[2];
    s3 = S[3];
    s4 = S[4];
    s5 = S[5];
    s6 = S[6];
    s7 = S[7];
    arg2[Cb] = ((Q3 * s0) + (Q0 * s3) + (Q1 * s2)) - (Q2 * s1);
    arg2[Cb + 1] = ((Q3 * s1) + (Q1 * s3) + (Q2 * s0)) - (Q0 * s2);
    arg2[Cb + 2] = ((Q3 * s2) + (Q2 * s3) + (Q0 * s1)) - (Q1 * s0);
    arg2[Cb + 3] = (Q3 * s3) - (Q0 * s0) - (Q1 * s1) - (Q2 * s2);
    arg2[Cb + 4] = ((((Q3 * s4) + (Q0 * s7) + (Q1 * s6)) - (Q2 * s5)) + (Q7 * s0) + (Q4 * s3) + (Q5 * s2)) - (Q6 * s1);
    arg2[Cb + 5] = ((((Q3 * s5) + (Q1 * s7) + (Q2 * s4)) - (Q0 * s6)) + (Q7 * s1) + (Q5 * s3) + (Q6 * s0)) - (Q4 * s2);
    arg2[Cb + 6] = ((((Q3 * s6) + (Q2 * s7) + (Q0 * s5)) - (Q1 * s4)) + (Q7 * s2) + (Q6 * s3) + (Q4 * s1)) - (Q5 * s0);
    arg2[Cb + 7] = (((Q3 * s7) - (Q0 * s4) - (Q1 * s5) - (Q2 * s6)) + (Q7 * s3)) - (Q4 * s0) - (Q5 * s1) - (Q6 * s2);
    var descendants = cNode[(7 << 0)];
    var descendantNum = array_length(descendants);
    
    if (descendantNum > 0)
    {
        if (arg7)
        {
            var R0 = (((-Q3 * C0) + (Q0 * C3)) - (Q1 * C2)) + (Q2 * C1);
            var R1 = (((-Q3 * C1) + (Q1 * C3)) - (Q2 * C0)) + (Q0 * C2);
            var R2 = (((-Q3 * C2) + (Q2 * C3)) - (Q0 * C1)) + (Q1 * C0);
            var R3 = (Q3 * C3) + (Q0 * C0) + (Q1 * C1) + (Q2 * C2);
            var R4 = (((((((-Q3 * C4) + (Q0 * C7)) - (Q1 * C6)) + (Q2 * C5)) - (Q7 * C0)) + (Q4 * C3)) - (Q5 * C2)) + (Q6 * C1);
            var R5 = (((((((-Q3 * C5) + (Q1 * C7)) - (Q2 * C4)) + (Q0 * C6)) - (Q7 * C1)) + (Q5 * C3)) - (Q6 * C0)) + (Q4 * C2);
            var R6 = (((((((-Q3 * C6) + (Q2 * C7)) - (Q0 * C5)) + (Q1 * C4)) - (Q7 * C2)) + (Q6 * C3)) - (Q4 * C1)) + (Q5 * C0);
            var R7 = (Q3 * C7) + (Q0 * C4) + (Q1 * C5) + (Q2 * C6) + (Q7 * C3) + (Q4 * C0) + (Q5 * C1) + (Q6 * C2);
            
            for (var i = 0; i < descendantNum; i++)
            {
                var b = ds_list_find_value(bindMap, array_get(descendants, i));
                
                if (b >= 0)
                {
                    b *= 8;
                    s0 = arg2[b];
                    s1 = arg2[b + 1];
                    s2 = arg2[b + 2];
                    s3 = arg2[b + 3];
                    s4 = arg2[b + 4];
                    s5 = arg2[b + 5];
                    s6 = arg2[b + 6];
                    s7 = arg2[b + 7];
                    arg2[b] = ((R3 * s0) + (R0 * s3) + (R1 * s2)) - (R2 * s1);
                    arg2[b + 1] = ((R3 * s1) - (R0 * s2)) + (R1 * s3) + (R2 * s0);
                    arg2[b + 2] = (((R3 * s2) + (R0 * s1)) - (R1 * s0)) + (R2 * s3);
                    arg2[b + 3] = (R3 * s3) - (R0 * s0) - (R1 * s1) - (R2 * s2);
                    arg2[b + 4] = (((((R3 * s4) + (R0 * s7) + (R1 * s6)) - (R2 * s5)) + (R4 * s3) + (R5 * s2)) - (R6 * s1)) + (R7 * s0);
                    arg2[b + 5] = ((((R3 * s5) - (R0 * s6)) + (R1 * s7) + (R2 * s4)) - (R4 * s2)) + (R5 * s3) + (R6 * s0) + (R7 * s1);
                    arg2[b + 6] = (((((R3 * s6) + (R0 * s5)) - (R1 * s4)) + (R2 * s7) + (R4 * s1)) - (R5 * s0)) + (R6 * s3) + (R7 * s2);
                    arg2[b + 7] = ((R3 * s7) - (R0 * s4) - (R1 * s5) - (R2 * s6) - (R4 * s0) - (R5 * s1) - (R6 * s2)) + (R7 * s3);
                }
            }
        }
        else
        {
            var dx = (arg3 - oldX) * 0.5;
            var dy = (arg4 - oldY) * 0.5;
            var dz = (arg5 - oldZ) * 0.5;
            
            for (var i = 0; i < descendantNum; i++)
            {
                var b = ds_list_find_value(bindMap, array_get(descendants, i));
                
                if (b < 0)
                    continue;
                
                b *= 8;
                s0 = arg2[b];
                s1 = arg2[b + 1];
                s2 = arg2[b + 2];
                s3 = arg2[b + 3];
                arg2[b + 4] += ((dx * s3) + (dy * s2)) - (dz * s1);
                arg2[b + 5] += (-dx * s2) + (dy * s3) + (dz * s0);
                arg2[b + 6] += ((dx * s1) - (dy * s0)) + (dz * s3);
                arg2[b + 7] += (-dx * s0) - (dy * s1) - (dz * s2);
            }
        }
    }
    
    return true;
}

function sample_node_ik_fast(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var bindMap = arg0.bindMap;
    var nodeList = arg0.nodeList;
    var cNode = ds_list_find_value(nodeList, arg1);
    var pNode = ds_list_find_value(nodeList, array_get(cNode, (5 << 0)));
    var gNode = ds_list_find_value(nodeList, array_get(pNode, (5 << 0)));
    
    if (!cNode[(8 << 0)] || !pNode[(8 << 0)])
    {
        show_debug_message("Error in script sample_node_ik_fast: Cannot perform inverse kinematics on nodes that aren't bones");
        exit;
    }
    
    var Cb = 8 * ds_list_find_value(bindMap, arg1);
    var c0 = arg2[Cb];
    var c1 = arg2[Cb + 1];
    var c2 = arg2[Cb + 2];
    var c3 = arg2[Cb + 3];
    var c4 = arg2[Cb + 4];
    var c5 = arg2[Cb + 5];
    var c6 = arg2[Cb + 6];
    var c7 = arg2[Cb + 7];
    var C = cNode[(1 << 0)];
    var s0 = C[0];
    var s1 = C[1];
    var s2 = C[2];
    var s3 = C[3];
    var s4 = C[4];
    var s5 = C[5];
    var s6 = C[6];
    var s7 = C[7];
    var C0 = ((c3 * s0) + (c0 * s3) + (c1 * s2)) - (c2 * s1);
    var C1 = ((c3 * s1) + (c1 * s3) + (c2 * s0)) - (c0 * s2);
    var C2 = ((c3 * s2) + (c2 * s3) + (c0 * s1)) - (c1 * s0);
    var C3 = (c3 * s3) - (c0 * s0) - (c1 * s1) - (c2 * s2);
    var C4 = ((((c3 * s4) + (c0 * s7) + (c1 * s6)) - (c2 * s5)) + (c7 * s0) + (c4 * s3) + (c5 * s2)) - (c6 * s1);
    var C5 = ((((c3 * s5) + (c1 * s7) + (c2 * s4)) - (c0 * s6)) + (c7 * s1) + (c5 * s3) + (c6 * s0)) - (c4 * s2);
    var C6 = ((((c3 * s6) + (c2 * s7) + (c0 * s5)) - (c1 * s4)) + (c7 * s2) + (c6 * s3) + (c4 * s1)) - (c5 * s0);
    var C7 = (((c3 * s7) - (c0 * s4) - (c1 * s5) - (c2 * s6)) + (c7 * s3)) - (c4 * s0) - (c5 * s1) - (c6 * s2);
    var Cx = 2 * (((-C7 * C0) + (C4 * C3) + (C6 * C1)) - (C5 * C2));
    var Cy = 2 * (((-C7 * C1) + (C5 * C3) + (C4 * C2)) - (C6 * C0));
    var Cz = 2 * (((-C7 * C2) + (C6 * C3) + (C5 * C0)) - (C4 * C1));
    var Cupx = 2 * ((C0 * C2) + (C1 * C3));
    var Cupy = 2 * ((C1 * C2) - (C0 * C3));
    var Cupz = ((C3 * C3) - (C0 * C0) - (C1 * C1)) + (C2 * C2);
    var Pb = 8 * ds_list_find_value(bindMap, array_get(cNode, (5 << 0)));
    var p0 = arg2[Pb];
    var p1 = arg2[Pb + 1];
    var p2 = arg2[Pb + 2];
    var p3 = arg2[Pb + 3];
    var p4 = arg2[Pb + 4];
    var p5 = arg2[Pb + 5];
    var p6 = arg2[Pb + 6];
    var p7 = arg2[Pb + 7];
    var G = gNode[(1 << 0)];
    s0 = G[0];
    s1 = G[1];
    s2 = G[2];
    s3 = G[3];
    s4 = G[4];
    s5 = G[5];
    s6 = G[6];
    s7 = G[7];
    var G0 = ((p3 * s0) + (p0 * s3) + (p1 * s2)) - (p2 * s1);
    var G1 = ((p3 * s1) + (p1 * s3) + (p2 * s0)) - (p0 * s2);
    var G2 = ((p3 * s2) + (p2 * s3) + (p0 * s1)) - (p1 * s0);
    var G3 = (p3 * s3) - (p0 * s0) - (p1 * s1) - (p2 * s2);
    var G4 = ((((p3 * s4) + (p0 * s7) + (p1 * s6)) - (p2 * s5)) + (p7 * s0) + (p4 * s3) + (p5 * s2)) - (p6 * s1);
    var G5 = ((((p3 * s5) + (p1 * s7) + (p2 * s4)) - (p0 * s6)) + (p7 * s1) + (p5 * s3) + (p6 * s0)) - (p4 * s2);
    var G6 = ((((p3 * s6) + (p2 * s7) + (p0 * s5)) - (p1 * s4)) + (p7 * s2) + (p6 * s3) + (p4 * s1)) - (p5 * s0);
    var G7 = (((p3 * s7) - (p0 * s4) - (p1 * s5) - (p2 * s6)) + (p7 * s3)) - (p4 * s0) - (p5 * s1) - (p6 * s2);
    var Gx = 2 * (((-G7 * G0) + (G4 * G3) + (G6 * G1)) - (G5 * G2));
    var Gy = 2 * (((-G7 * G1) + (G5 * G3) + (G4 * G2)) - (G6 * G0));
    var Gz = 2 * (((-G7 * G2) + (G6 * G3) + (G5 * G0)) - (G4 * G1));
    var P = pNode[(1 << 0)];
    s0 = P[0];
    s1 = P[1];
    s2 = P[2];
    s3 = P[3];
    var P0 = ((p3 * s0) + (p0 * s3) + (p1 * s2)) - (p2 * s1);
    var P1 = ((p3 * s1) + (p1 * s3) + (p2 * s0)) - (p0 * s2);
    var P2 = ((p3 * s2) + (p2 * s3) + (p0 * s1)) - (p1 * s0);
    var P3 = (p3 * s3) - (p0 * s0) - (p1 * s1) - (p2 * s2);
    var P4 = ((((p3 * s4) + (p0 * s7) + (p1 * s6)) - (p2 * s5)) + (p7 * s0) + (p4 * s3) + (p5 * s2)) - (p6 * s1);
    var P5 = ((((p3 * s5) + (p1 * s7) + (p2 * s4)) - (p0 * s6)) + (p7 * s1) + (p5 * s3) + (p6 * s0)) - (p4 * s2);
    var P6 = ((((p3 * s6) + (p2 * s7) + (p0 * s5)) - (p1 * s4)) + (p7 * s2) + (p6 * s3) + (p4 * s1)) - (p5 * s0);
    var P7 = (((p3 * s7) - (p0 * s4) - (p1 * s5) - (p2 * s6)) + (p7 * s3)) - (p4 * s0) - (p5 * s1) - (p6 * s2);
    var Px = 2 * (((-P7 * P0) + (P4 * P3) + (P6 * P1)) - (P5 * P2));
    var Py = 2 * (((-P7 * P1) + (P5 * P3) + (P4 * P2)) - (P6 * P0));
    var Pz = 2 * (((-P7 * P2) + (P6 * P3) + (P5 * P0)) - (P4 * P1));
    var Pupx = 2 * ((P0 * P2) + (P1 * P3));
    var Pupy = 2 * ((P1 * P2) - (P0 * P3));
    var Pupz = ((P3 * P3) - (P0 * P0) - (P1 * P1)) + (P2 * P2);
    var oldX = Cx;
    var oldY = Cy;
    var oldZ = Cz;
    var pOldX = Px;
    var pOldY = Py;
    var pOldZ = Pz;
    var GtoNx = arg3 - Gx;
    var GtoNy = arg4 - Gy;
    var GtoNz = arg5 - Gz;
    var p_c = cNode[(9 << 0)];
    var g_p = pNode[(9 << 0)];
    var g_n = sqrt((GtoNx * GtoNx) + (GtoNy * GtoNy) + (GtoNz * GtoNz));
    var a = clamp(g_n, abs(g_p - p_c) + (g_p * 0.001), (g_p + p_c) * 0.999);
    
    if (a != g_n)
    {
        var d = a / g_n;
        GtoNx *= d;
        GtoNy *= d;
        GtoNz *= d;
        arg3 = Gx + GtoNx;
        arg4 = Gy + GtoNy;
        arg5 = Gz + GtoNz;
        g_n = a;
    }
    
    var g_nsqr = g_n * g_n;
    var p_csqr = p_c * p_c;
    var g_psqr = g_p * g_p;
    var intersectionRadius = sqrt(max(p_csqr - (sqr(g_psqr - p_csqr - g_nsqr) / (4 * g_nsqr)), 0));
    var l = sqrt(max(g_psqr - (intersectionRadius * intersectionRadius), 0)) / g_n;
    
    if (g_nsqr < (p_csqr - g_psqr))
        l = -l;
    
    var middleX = Gx + (GtoNx * l);
    var middleY = Gy + (GtoNy * l);
    var middleZ = Gz + (GtoNz * l);
    var primaryAxis = cNode[(10 << 0)];
    var primZ, primY, primX;
    
    if (!arg6 && is_array(primaryAxis))
    {
        primX = primaryAxis[0];
        primY = primaryAxis[1];
        primZ = primaryAxis[2];
    }
    else
    {
        primX = Cx - Px;
        primY = Cy - Py;
        primZ = Cz - Pz;
        var axisX = (Px + Cx) - (2 * Gx);
        var axisY = (Py + Cy) - (2 * Gz);
        var axisZ = (Pz + Cz) - (2 * Gz);
        dp = ((primX * axisX) + (primY * axisY) + (primZ * axisZ)) / ((axisX * axisX) + (axisY * axisY) + (axisZ * axisZ));
        primX -= (axisX * dp);
        primY -= (axisY * dp);
        primZ -= (axisZ * dp);
        l = (primX * primX) + (primY * primY) + (primZ * primZ);
        
        if (l == 0)
            return false;
        
        l = 1 / sqrt(l);
        primX *= l;
        primY *= l;
        primZ *= l;
        
        if (!arg6)
            cNode[(10 << 0)] = [primX, primY, primZ];
    }
    
    if (arg6)
    {
        var crossX = ((p1 * primZ) - (p2 * primY)) + (p3 * primX);
        var crossY = ((p2 * primX) - (p0 * primZ)) + (p3 * primY);
        var crossZ = ((p0 * primY) - (p1 * primX)) + (p3 * primZ);
        primX += (2 * ((p1 * crossZ) - (p2 * crossY)));
        primY += (2 * ((p2 * crossX) - (p0 * crossZ)));
        primZ += (2 * ((p0 * crossY) - (p1 * crossX)));
    }
    
    var dp = ((primX * GtoNx) + (primY * GtoNy) + (primZ * GtoNz)) / g_nsqr;
    var mx = primX - (GtoNx * dp);
    var my = primY - (GtoNy * dp);
    var mz = primZ - (GtoNz * dp);
    var m = (mx * mx) + (my * my) + (mz * mz);
    
    if (m > 0)
        m = intersectionRadius / sqrt(m);
    
    Px = middleX + (mx * m);
    Py = middleY + (my * m);
    Pz = middleZ + (mz * m);
    var M0 = (Px - Gx) / g_p;
    var M1 = (Py - Gy) / g_p;
    var M2 = (Pz - Gz) / g_p;
    var M4 = (Pupy * M2) - (Pupz * M1);
    var M5 = (Pupz * M0) - (Pupx * M2);
    var M6 = (Pupx * M1) - (Pupy * M0);
    m = (M4 * M4) + (M5 * M5) + (M6 * M6);
    
    if (m == 0)
        return false;
    
    l = 1 / sqrt(m);
    M4 *= l;
    M5 *= l;
    M6 *= l;
    var M8 = (M1 * M6) - (M2 * M5);
    var M9 = (M2 * M4) - (M0 * M6);
    var M10 = (M0 * M5) - (M1 * M4);
    var T = 1 + M0 + M5 + M10;
    var Q0, Q1, Q2, Q3;
    
    if (T > 0)
    {
        var S = sqrt(T) * 2;
        Q0 = (M9 - M6) / S;
        Q1 = (M2 - M8) / S;
        Q2 = (M4 - M1) / S;
        Q3 = -0.25 * S;
    }
    else if (M0 > M5 && M0 > M10)
    {
        var S = sqrt((1 + M0) - M5 - M10) * 2;
        Q0 = 0.25 * S;
        Q1 = (M4 + M1) / S;
        Q2 = (M2 + M8) / S;
        Q3 = (M9 - M6) / S;
    }
    else if (M5 > M10)
    {
        var S = sqrt((1 + M5) - M0 - M10) * 2;
        Q0 = (M4 + M1) / S;
        Q1 = 0.25 * S;
        Q2 = (M9 + M6) / S;
        Q3 = (M2 - M8) / S;
    }
    else
    {
        var S = sqrt((1 + M10) - M0 - M5) * 2;
        Q0 = (M2 + M8) / S;
        Q1 = (M9 + M6) / S;
        Q2 = 0.25 * S;
        Q3 = (M4 - M1) / S;
    }
    
    if (((Q0 * P0) + (Q1 * P1) + (Q2 * P2) + (Q3 * P3)) < 0)
    {
        Q0 = -Q0;
        Q1 = -Q1;
        Q2 = -Q2;
        Q3 = -Q3;
    }
    
    var Q4 = 0.5 * (((Px * Q3) + (Py * Q2)) - (Pz * Q1));
    var Q5 = 0.5 * (((Py * Q3) + (Pz * Q0)) - (Px * Q2));
    var Q6 = 0.5 * (((Pz * Q3) + (Px * Q1)) - (Py * Q0));
    var Q7 = -0.5 * ((Px * Q0) + (Py * Q1) + (Pz * Q2));
    s0 = -P[0];
    s1 = -P[1];
    s2 = -P[2];
    s3 = P[3];
    s4 = -P[4];
    s5 = -P[5];
    s6 = -P[6];
    s7 = P[7];
    arg2[Pb] = ((Q3 * s0) + (Q0 * s3) + (Q1 * s2)) - (Q2 * s1);
    arg2[Pb + 1] = ((Q3 * s1) + (Q1 * s3) + (Q2 * s0)) - (Q0 * s2);
    arg2[Pb + 2] = ((Q3 * s2) + (Q2 * s3) + (Q0 * s1)) - (Q1 * s0);
    arg2[Pb + 3] = (Q3 * s3) - (Q0 * s0) - (Q1 * s1) - (Q2 * s2);
    arg2[Pb + 4] = ((((Q3 * s4) + (Q0 * s7) + (Q1 * s6)) - (Q2 * s5)) + (Q7 * s0) + (Q4 * s3) + (Q5 * s2)) - (Q6 * s1);
    arg2[Pb + 5] = ((((Q3 * s5) + (Q1 * s7) + (Q2 * s4)) - (Q0 * s6)) + (Q7 * s1) + (Q5 * s3) + (Q6 * s0)) - (Q4 * s2);
    arg2[Pb + 6] = ((((Q3 * s6) + (Q2 * s7) + (Q0 * s5)) - (Q1 * s4)) + (Q7 * s2) + (Q6 * s3) + (Q4 * s1)) - (Q5 * s0);
    arg2[Pb + 7] = (((Q3 * s7) - (Q0 * s4) - (Q1 * s5) - (Q2 * s6)) + (Q7 * s3)) - (Q4 * s0) - (Q5 * s1) - (Q6 * s2);
    var children = pNode[(6 << 0)];
    var childNum = array_length(children);
    
    if (childNum > 0)
    {
        if (arg7)
        {
            var R = global.AnimTempQ1;
            R[0] = (((-Q3 * P0) + (Q0 * P3)) - (Q1 * P2)) + (Q2 * P1);
            R[1] = (((-Q3 * P1) + (Q1 * P3)) - (Q2 * P0)) + (Q0 * P2);
            R[2] = (((-Q3 * P2) + (Q2 * P3)) - (Q0 * P1)) + (Q1 * P0);
            R[3] = (Q3 * P3) + (Q0 * P0) + (Q1 * P1) + (Q2 * P2);
            R[4] = (((((((-Q3 * P4) + (Q0 * P7)) - (Q1 * P6)) + (Q2 * P5)) - (Q7 * P0)) + (Q4 * P3)) - (Q5 * P2)) + (Q6 * P1);
            R[5] = (((((((-Q3 * P5) + (Q1 * P7)) - (Q2 * P4)) + (Q0 * P6)) - (Q7 * P1)) + (Q5 * P3)) - (Q6 * P0)) + (Q4 * P2);
            R[6] = (((((((-Q3 * P6) + (Q2 * P7)) - (Q0 * P5)) + (Q1 * P4)) - (Q7 * P2)) + (Q6 * P3)) - (Q4 * P1)) + (Q5 * P0);
            R[7] = (Q3 * P7) + (Q0 * P4) + (Q1 * P5) + (Q2 * P6) + (Q7 * P3) + (Q4 * P0) + (Q5 * P1) + (Q6 * P2);
            
            for (var i = 0; i < childNum; i++)
            {
                var child = children[i];
                
                if (child == arg1)
                    continue;
                
                sample_node_transform(arg0, child, arg2, R, true);
            }
        }
        else
        {
            var dx = arg3 - pOldX;
            var dy = arg4 - pOldY;
            var dz = arg5 - pOldZ;
            
            for (var i = 0; i < childNum; i++)
            {
                var child = children[i];
                
                if (child == arg1)
                    continue;
                
                sample_node_translate(arg0, child, arg2, dx, dy, dz, true);
            }
        }
    }
    
    children = pNode[(6 << 0)];
    childNum = array_length(children);
    
    if (childNum > 0)
    {
        if (arg7)
        {
            var R = global.AnimTempQ1;
            R[0] = (((-Q3 * P0) + (Q0 * P3)) - (Q1 * P2)) + (Q2 * P1);
            R[1] = (((-Q3 * P1) + (Q1 * P3)) - (Q2 * P0)) + (Q0 * P2);
            R[2] = (((-Q3 * P2) + (Q2 * P3)) - (Q0 * P1)) + (Q1 * P0);
            R[3] = (Q3 * P3) + (Q0 * P0) + (Q1 * P1) + (Q2 * P2);
            R[4] = (((((((-Q3 * P4) + (Q0 * P7)) - (Q1 * P6)) + (Q2 * P5)) - (Q7 * P0)) + (Q4 * P3)) - (Q5 * P2)) + (Q6 * P1);
            R[5] = (((((((-Q3 * P5) + (Q1 * P7)) - (Q2 * P4)) + (Q0 * P6)) - (Q7 * P1)) + (Q5 * P3)) - (Q6 * P0)) + (Q4 * P2);
            R[6] = (((((((-Q3 * P6) + (Q2 * P7)) - (Q0 * P5)) + (Q1 * P4)) - (Q7 * P2)) + (Q6 * P3)) - (Q4 * P1)) + (Q5 * P0);
            R[7] = (Q3 * P7) + (Q0 * P4) + (Q1 * P5) + (Q2 * P6) + (Q7 * P3) + (Q4 * P0) + (Q5 * P1) + (Q6 * P2);
            
            for (var i = 0; i < childNum; i++)
            {
                var child = children[i];
                
                if (child == arg1)
                    continue;
                
                sample_node_transform(arg0, child, arg2, R, true);
            }
        }
        else
        {
            var dx = arg3 - oldX;
            var dy = arg4 - oldY;
            var dz = arg5 - oldZ;
            
            for (var i = 0; i < childNum; i++)
            {
                var child = children[i];
                
                if (child == arg1)
                    continue;
                
                sample_node_translate(arg0, child, arg2, dx, dy, dz, true);
            }
        }
    }
    
    M0 = (arg3 - Px) / p_c;
    M1 = (arg4 - Py) / p_c;
    M2 = (arg5 - Pz) / p_c;
    M4 = (Cupy * M2) - (Cupz * M1);
    M5 = (Cupz * M0) - (Cupx * M2);
    M6 = (Cupx * M1) - (Cupy * M0);
    m = (M4 * M4) + (M5 * M5) + (M6 * M6);
    
    if (m == 0)
        return false;
    
    l = 1 / sqrt(m);
    M4 *= l;
    M5 *= l;
    M6 *= l;
    M8 = (M1 * M6) - (M2 * M5);
    M9 = (M2 * M4) - (M0 * M6);
    M10 = (M0 * M5) - (M1 * M4);
    T = 1 + M0 + M5 + M10;
    
    if (T > 0)
    {
        var S = sqrt(T) * 2;
        Q0 = (M9 - M6) / S;
        Q1 = (M2 - M8) / S;
        Q2 = (M4 - M1) / S;
        Q3 = -0.25 * S;
    }
    else if (M0 > M5 && M0 > M10)
    {
        var S = sqrt((1 + M0) - M5 - M10) * 2;
        Q0 = 0.25 * S;
        Q1 = (M4 + M1) / S;
        Q2 = (M2 + M8) / S;
        Q3 = (M9 - M6) / S;
    }
    else if (M5 > M10)
    {
        var S = sqrt((1 + M5) - M0 - M10) * 2;
        Q0 = (M4 + M1) / S;
        Q1 = 0.25 * S;
        Q2 = (M9 + M6) / S;
        Q3 = (M2 - M8) / S;
    }
    else
    {
        var S = sqrt((1 + M10) - M0 - M5) * 2;
        Q0 = (M2 + M8) / S;
        Q1 = (M9 + M6) / S;
        Q2 = 0.25 * S;
        Q3 = (M4 - M1) / S;
    }
    
    if (((Q0 * C0) + (Q1 * C1) + (Q2 * C2) + (Q3 * C3)) < 0)
    {
        Q0 = -Q0;
        Q1 = -Q1;
        Q2 = -Q2;
        Q3 = -Q3;
    }
    
    Q4 = 0.5 * (((arg3 * Q3) + (arg4 * Q2)) - (arg5 * Q1));
    Q5 = 0.5 * (((arg4 * Q3) + (arg5 * Q0)) - (arg3 * Q2));
    Q6 = 0.5 * (((arg5 * Q3) + (arg3 * Q1)) - (arg4 * Q0));
    Q7 = -0.5 * ((arg3 * Q0) + (arg4 * Q1) + (arg5 * Q2));
    s0 = -C[0];
    s1 = -C[1];
    s2 = -C[2];
    s3 = C[3];
    s4 = -C[4];
    s5 = -C[5];
    s6 = -C[6];
    s7 = C[7];
    arg2[Cb] = ((Q3 * s0) + (Q0 * s3) + (Q1 * s2)) - (Q2 * s1);
    arg2[Cb + 1] = ((Q3 * s1) + (Q1 * s3) + (Q2 * s0)) - (Q0 * s2);
    arg2[Cb + 2] = ((Q3 * s2) + (Q2 * s3) + (Q0 * s1)) - (Q1 * s0);
    arg2[Cb + 3] = (Q3 * s3) - (Q0 * s0) - (Q1 * s1) - (Q2 * s2);
    arg2[Cb + 4] = ((((Q3 * s4) + (Q0 * s7) + (Q1 * s6)) - (Q2 * s5)) + (Q7 * s0) + (Q4 * s3) + (Q5 * s2)) - (Q6 * s1);
    arg2[Cb + 5] = ((((Q3 * s5) + (Q1 * s7) + (Q2 * s4)) - (Q0 * s6)) + (Q7 * s1) + (Q5 * s3) + (Q6 * s0)) - (Q4 * s2);
    arg2[Cb + 6] = ((((Q3 * s6) + (Q2 * s7) + (Q0 * s5)) - (Q1 * s4)) + (Q7 * s2) + (Q6 * s3) + (Q4 * s1)) - (Q5 * s0);
    arg2[Cb + 7] = (((Q3 * s7) - (Q0 * s4) - (Q1 * s5) - (Q2 * s6)) + (Q7 * s3)) - (Q4 * s0) - (Q5 * s1) - (Q6 * s2);
    var descendants = cNode[(7 << 0)];
    var descendantNum = array_length(descendants);
    
    if (descendantNum > 0)
    {
        if (arg7)
        {
            var R0 = (((-Q3 * C0) + (Q0 * C3)) - (Q1 * C2)) + (Q2 * C1);
            var R1 = (((-Q3 * C1) + (Q1 * C3)) - (Q2 * C0)) + (Q0 * C2);
            var R2 = (((-Q3 * C2) + (Q2 * C3)) - (Q0 * C1)) + (Q1 * C0);
            var R3 = (Q3 * C3) + (Q0 * C0) + (Q1 * C1) + (Q2 * C2);
            var R4 = (((((((-Q3 * C4) + (Q0 * C7)) - (Q1 * C6)) + (Q2 * C5)) - (Q7 * C0)) + (Q4 * C3)) - (Q5 * C2)) + (Q6 * C1);
            var R5 = (((((((-Q3 * C5) + (Q1 * C7)) - (Q2 * C4)) + (Q0 * C6)) - (Q7 * C1)) + (Q5 * C3)) - (Q6 * C0)) + (Q4 * C2);
            var R6 = (((((((-Q3 * C6) + (Q2 * C7)) - (Q0 * C5)) + (Q1 * C4)) - (Q7 * C2)) + (Q6 * C3)) - (Q4 * C1)) + (Q5 * C0);
            var R7 = (Q3 * C7) + (Q0 * C4) + (Q1 * C5) + (Q2 * C6) + (Q7 * C3) + (Q4 * C0) + (Q5 * C1) + (Q6 * C2);
            
            for (var i = 0; i < descendantNum; i++)
            {
                var b = ds_list_find_value(bindMap, array_get(descendants, i));
                
                if (b >= 0)
                {
                    b *= 8;
                    s0 = arg2[b];
                    s1 = arg2[b + 1];
                    s2 = arg2[b + 2];
                    s3 = arg2[b + 3];
                    s4 = arg2[b + 4];
                    s5 = arg2[b + 5];
                    s6 = arg2[b + 6];
                    s7 = arg2[b + 7];
                    arg2[b] = ((R3 * s0) + (R0 * s3) + (R1 * s2)) - (R2 * s1);
                    arg2[b + 1] = ((R3 * s1) - (R0 * s2)) + (R1 * s3) + (R2 * s0);
                    arg2[b + 2] = (((R3 * s2) + (R0 * s1)) - (R1 * s0)) + (R2 * s3);
                    arg2[b + 3] = (R3 * s3) - (R0 * s0) - (R1 * s1) - (R2 * s2);
                    arg2[b + 4] = (((((R3 * s4) + (R0 * s7) + (R1 * s6)) - (R2 * s5)) + (R4 * s3) + (R5 * s2)) - (R6 * s1)) + (R7 * s0);
                    arg2[b + 5] = ((((R3 * s5) - (R0 * s6)) + (R1 * s7) + (R2 * s4)) - (R4 * s2)) + (R5 * s3) + (R6 * s0) + (R7 * s1);
                    arg2[b + 6] = (((((R3 * s6) + (R0 * s5)) - (R1 * s4)) + (R2 * s7) + (R4 * s1)) - (R5 * s0)) + (R6 * s3) + (R7 * s2);
                    arg2[b + 7] = ((R3 * s7) - (R0 * s4) - (R1 * s5) - (R2 * s6) - (R4 * s0) - (R5 * s1) - (R6 * s2)) + (R7 * s3);
                }
            }
        }
        else
        {
            var dx = (arg3 * 0.5) - (((-C7 * C0) + (C4 * C3) + (C6 * C1)) - (C5 * C2));
            var dy = (arg4 * 0.5) - (((-C7 * C1) + (C5 * C3) + (C4 * C2)) - (C6 * C0));
            var dz = (arg5 * 0.5) - (((-C7 * C2) + (C6 * C3) + (C5 * C0)) - (C4 * C1));
            
            for (var i = 0; i < descendantNum; i++)
            {
                var b = ds_list_find_value(bindMap, array_get(descendants, i));
                
                if (b < 0)
                    continue;
                
                b *= 8;
                s0 = arg2[b];
                s1 = arg2[b + 1];
                s2 = arg2[b + 2];
                s3 = arg2[b + 3];
                arg2[b + 4] += ((dx * s3) + (dy * s2)) - (dz * s1);
                arg2[b + 5] += (-dx * s2) + (dy * s3) + (dz * s0);
                arg2[b + 6] += ((dx * s1) - (dy * s0)) + (dz * s3);
                arg2[b + 7] += (-dx * s0) - (dy * s1) - (dz * s2);
            }
        }
    }
    
    return true;
}

function sample_node_set_dq(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var node = ds_list_find_value(arg0.nodeList, arg1);
    var px = smf_dq_get_x(arg3);
    var py = smf_dq_get_y(arg3);
    var pz = smf_dq_get_z(arg3);
    var to = smf_quat_get_to(arg3);
    
    if (!node[(8 << 0)])
    {
        sample_node_move(arg0, arg1, arg2, px, py, pz, arg4, true);
        exit;
    }
    
    var b = ds_list_find_value(arg0.bindMap, arg1);
    
    if (b > 0)
    {
        var SQ = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ4);
        var deltaDQ = smf_dq_multiply(arg3, smf_dq_get_conjugate(SQ, SQ), global.AnimTempQ4);
        sample_node_transform(arg0, arg1, arg2, deltaDQ, arg5);
    }
    
    px -= (to[0] * node[(9 << 0)]);
    py -= (to[1] * node[(9 << 0)]);
    pz -= (to[2] * node[(9 << 0)]);
    sample_node_move(arg0, node[(5 << 0)], arg2, px, py, pz, arg4, false);
}

function sample_node_set_matrix(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var node = ds_list_find_value(arg0.nodeList, arg1);
    
    if (!node[(8 << 0)])
    {
        sample_node_move(arg0, arg1, arg2, arg3[12], arg3[13], arg3[14], arg4, true);
        exit;
    }
    
    var b = ds_list_find_value(arg0.bindMap, arg1);
    
    if (b > 0)
    {
        var DQ = smf_dq_create_from_matrix(arg3, global.AnimTempQ2);
        var SQ = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ1);
        var deltaDQ = smf_dq_multiply(DQ, smf_dq_get_conjugate(SQ, SQ), DQ);
        sample_node_transform(arg0, arg1, arg2, deltaDQ, arg5);
    }
    
    var px = arg3[12] - (arg3[0] * node[(9 << 0)]);
    var py = arg3[13] - (arg3[1] * node[(9 << 0)]);
    var pz = arg3[14] - (arg3[2] * node[(9 << 0)]);
    sample_node_move(arg0, node[(5 << 0)], arg2, px, py, pz, arg4, false);
}

function sample_node_transform(arg0, arg1, arg2, arg3, arg4)
{
    var b = ds_list_find_value(arg0.bindMap, arg1);
    var node = ds_list_find_value(arg0.nodeList, arg1);
    var children = node[(6 << 0)];
    var num = array_length(children);
    var r0 = arg3[0];
    var r1 = arg3[1];
    var r2 = arg3[2];
    var r3 = arg3[3];
    var r4 = arg3[4];
    var r5 = arg3[5];
    var r6 = arg3[6];
    var r7 = arg3[7];
    
    if (b >= 0)
    {
        var PQ;
        
        if (!arg4)
            PQ = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ1);
        
        b *= 8;
        var s0 = arg2[b];
        var s1 = arg2[b + 1];
        var s2 = arg2[b + 2];
        var s3 = arg2[b + 3];
        var s4 = arg2[b + 4];
        var s5 = arg2[b + 5];
        var s6 = arg2[b + 6];
        var s7 = arg2[b + 7];
        arg2[b] = ((r3 * s0) + (r0 * s3) + (r1 * s2)) - (r2 * s1);
        arg2[b + 1] = ((r3 * s1) - (r0 * s2)) + (r1 * s3) + (r2 * s0);
        arg2[b + 2] = (((r3 * s2) + (r0 * s1)) - (r1 * s0)) + (r2 * s3);
        arg2[b + 3] = (r3 * s3) - (r0 * s0) - (r1 * s1) - (r2 * s2);
        arg2[b + 4] = (((((r3 * s4) + (r0 * s7) + (r1 * s6)) - (r2 * s5)) + (r4 * s3) + (r5 * s2)) - (r6 * s1)) + (r7 * s0);
        arg2[b + 5] = ((((r3 * s5) - (r0 * s6)) + (r1 * s7) + (r2 * s4)) - (r4 * s2)) + (r5 * s3) + (r6 * s0) + (r7 * s1);
        arg2[b + 6] = (((((r3 * s6) + (r0 * s5)) - (r1 * s4)) + (r2 * s7) + (r4 * s1)) - (r5 * s0)) + (r6 * s3) + (r7 * s2);
        arg2[b + 7] = ((r3 * s7) - (r0 * s4) - (r1 * s5) - (r2 * s6) - (r4 * s0) - (r5 * s1) - (r6 * s2)) + (r7 * s3);
        
        if (!arg4)
        {
            var NQ = sample_get_node_dq(arg0, arg1, arg2, global.AnimTempQ2);
            var dx = smf_dq_get_x(NQ) - smf_dq_get_x(PQ);
            var dy = smf_dq_get_y(NQ) - smf_dq_get_y(PQ);
            var dz = smf_dq_get_z(NQ) - smf_dq_get_z(PQ);
            
            for (var i = 0; i < num; i++)
                sample_node_translate(arg0, children[i], arg2, dx, dy, dz, true);
        }
    }
    
    if (arg4 || b < 0)
    {
        for (var i = 0; i < num; i++)
            sample_node_transform(arg0, children[i], arg2, arg3, arg4);
    }
    
    return arg2;
}

function sample_node_translate(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    var b = ds_list_find_value(arg0.bindMap, arg1);
    var node = ds_list_find_value(arg0.nodeList, arg1);
    var children = node[(6 << 0)];
    var num = array_length(children);
    
    if (b >= 0)
    {
        b *= 8;
        var s0 = arg2[b];
        var s1 = arg2[b + 1];
        var s2 = arg2[b + 2];
        var s3 = arg2[b + 3];
        var tx = arg3 * 0.5;
        var ty = arg4 * 0.5;
        var tz = arg5 * 0.5;
        arg2[b + 4] += ((tx * s3) + (ty * s2)) - (tz * s1);
        arg2[b + 5] += (-tx * s2) + (ty * s3) + (tz * s0);
        arg2[b + 6] += ((tx * s1) - (ty * s0)) + (tz * s3);
        arg2[b + 7] += (-tx * s0) - (ty * s1) - (tz * s2);
    }
    
    if (arg6 || b < 0)
    {
        for (var i = 0; i < num; i++)
            sample_node_translate(arg0, children[i], arg2, arg3, arg4, arg5, arg6);
    }
    
    return arg2;
}

function sample_update_locked_bones(arg0, arg1, arg2, arg3)
{
    var nodeList = arg0.nodeList;
    var node = ds_list_find_value(nodeList, arg1);
    var descendants = node[(7 << 0)];
    var num = array_length(descendants);
    
    for (var i = 0; i < num; i++)
    {
        var cNode = ds_list_find_value(nodeList, array_get(descendants, i));
        
        if (!cNode[(11 << 0)])
            continue;
        
        var p = cNode[(12 << 0)];
        
        if (!is_array(p))
            continue;
        
        if (cNode[(5 << 0)] == arg1)
            sample_node_drag(arg0, descendants[i], arg2, p[0], p[1], p[2], arg3);
        else
            sample_node_move(arg0, descendants[i], arg2, p[0], p[1], p[2], true, arg3);
    }
}
