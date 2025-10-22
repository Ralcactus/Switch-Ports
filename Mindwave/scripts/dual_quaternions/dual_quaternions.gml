function smf_dq_create(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    arg0 *= 0.5;
    var c = cos(arg0);
    var s = sin(arg0);
    arg1 *= s;
    arg2 *= s;
    arg3 *= s;
    return [arg1, arg2, arg3, c, 0.5 * (((arg4 * c) + (arg5 * arg3)) - (arg6 * arg1)), 0.5 * (((arg5 * c) + (arg6 * arg1)) - (arg4 * arg3)), 0.5 * (((arg6 * c) + (arg4 * arg2)) - (arg5 * arg1)), 0.5 * ((-arg4 * arg1) - (arg5 * arg2) - (arg6 * arg3))];
}

function smf_dq_create_from_matrix(arg0, arg1)
{
    var T = 1 + arg0[0] + arg0[5] + arg0[10];
    
    if (T > 0)
    {
        var S = sqrt(T) * 2;
        arg1[0] = (arg0[9] - arg0[6]) / S;
        arg1[1] = (arg0[2] - arg0[8]) / S;
        arg1[2] = (arg0[4] - arg0[1]) / S;
        arg1[3] = -0.25 * S;
    }
    else if (arg0[0] > arg0[5] && arg0[0] > arg0[10])
    {
        var S = sqrt(max(0, (1 + arg0[0]) - arg0[5] - arg0[10])) * 2;
        arg1[0] = 0.25 * S;
        arg1[1] = (arg0[4] + arg0[1]) / S;
        arg1[2] = (arg0[2] + arg0[8]) / S;
        arg1[3] = (arg0[9] - arg0[6]) / S;
    }
    else if (arg0[5] > arg0[10])
    {
        var S = sqrt(max(0, (1 + arg0[5]) - arg0[0] - arg0[10])) * 2;
        arg1[0] = (arg0[4] + arg0[1]) / S;
        arg1[1] = 0.25 * S;
        arg1[2] = (arg0[9] + arg0[6]) / S;
        arg1[3] = (arg0[2] - arg0[8]) / S;
    }
    else
    {
        var S = sqrt(max(0, (1 + arg0[10]) - arg0[0] - arg0[5])) * 2;
        arg1[0] = (arg0[2] + arg0[8]) / S;
        arg1[1] = (arg0[9] + arg0[6]) / S;
        arg1[2] = 0.25 * S;
        arg1[3] = (arg0[4] - arg0[1]) / S;
    }
    
    arg1[4] = 0.5 * (((arg0[12] * arg1[3]) + (arg0[13] * arg1[2])) - (arg0[14] * arg1[1]));
    arg1[5] = 0.5 * (((arg0[13] * arg1[3]) + (arg0[14] * arg1[0])) - (arg0[12] * arg1[2]));
    arg1[6] = 0.5 * (((arg0[14] * arg1[3]) + (arg0[12] * arg1[1])) - (arg0[13] * arg1[0]));
    arg1[7] = -0.5 * ((arg0[12] * arg1[0]) + (arg0[13] * arg1[1]) + (arg0[14] * arg1[2]));
    return arg1;
}

function smf_dq_duplicate(arg0)
{
    var Q = array_create(8);
    array_copy(Q, 0, arg0, 0, 8);
    return Q;
}

function smf_dq_get_conjugate(arg0, arg1 = array_create(8))
{
    arg1[0] = -arg0[0];
    arg1[1] = -arg0[1];
    arg1[2] = -arg0[2];
    arg1[3] = arg0[3];
    arg1[4] = -arg0[4];
    arg1[5] = -arg0[5];
    arg1[6] = -arg0[6];
    arg1[7] = arg0[7];
    return arg1;
}

function smf_dq_get_translation(arg0)
{
    var q0 = arg0[0];
    var q1 = arg0[1];
    var q2 = arg0[2];
    var q3 = arg0[3];
    var q4 = arg0[4];
    var q5 = arg0[5];
    var q6 = arg0[6];
    var q7 = arg0[7];
    return [2 * (((-q7 * q0) + (q4 * q3) + (q6 * q1)) - (q5 * q2)), 2 * (((-q7 * q1) + (q5 * q3) + (q4 * q2)) - (q6 * q0)), 2 * (((-q7 * q2) + (q6 * q3) + (q5 * q0)) - (q4 * q1))];
}

function smf_dq_get_x(arg0)
{
    return 2 * (((-arg0[7] * arg0[0]) + (arg0[4] * arg0[3]) + (arg0[6] * arg0[1])) - (arg0[5] * arg0[2]));
}

function smf_dq_get_y(arg0)
{
    return 2 * (((-arg0[7] * arg0[1]) + (arg0[5] * arg0[3]) + (arg0[4] * arg0[2])) - (arg0[6] * arg0[0]));
}

function smf_dq_get_z(arg0)
{
    return 2 * (((-arg0[7] * arg0[2]) + (arg0[6] * arg0[3]) + (arg0[5] * arg0[0])) - (arg0[4] * arg0[1]));
}

function smf_dq_invert(arg0, arg1 = arg0)
{
    arg1[0] = -arg0[0];
    arg1[1] = -arg0[1];
    arg1[2] = -arg0[2];
    arg1[3] = -arg0[3];
    arg1[4] = -arg0[4];
    arg1[5] = -arg0[5];
    arg1[6] = -arg0[6];
    arg1[7] = -arg0[7];
    return arg1;
}

function smf_dq_lerp(arg0, arg1, arg2, arg3 = array_create(8))
{
    arg3[0] = lerp(arg0[0], arg1[0], arg2);
    arg3[1] = lerp(arg0[1], arg1[1], arg2);
    arg3[2] = lerp(arg0[2], arg1[2], arg2);
    arg3[3] = lerp(arg0[3], arg1[3], arg2);
    arg3[4] = lerp(arg0[4], arg1[4], arg2);
    arg3[5] = lerp(arg0[5], arg1[5], arg2);
    arg3[6] = lerp(arg0[6], arg1[6], arg2);
    arg3[7] = lerp(arg0[7], arg1[7], arg2);
    return arg3;
}

function smf_dq_multiply(arg0, arg1, arg2 = array_create(8))
{
    var r0 = arg0[0];
    var r1 = arg0[1];
    var r2 = arg0[2];
    var r3 = arg0[3];
    var r4 = arg0[4];
    var r5 = arg0[5];
    var r6 = arg0[6];
    var r7 = arg0[7];
    var s0 = arg1[0];
    var s1 = arg1[1];
    var s2 = arg1[2];
    var s3 = arg1[3];
    var s4 = arg1[4];
    var s5 = arg1[5];
    var s6 = arg1[6];
    var s7 = arg1[7];
    arg2[0] = ((r3 * s0) + (r0 * s3) + (r1 * s2)) - (r2 * s1);
    arg2[1] = ((r3 * s1) + (r1 * s3) + (r2 * s0)) - (r0 * s2);
    arg2[2] = ((r3 * s2) + (r2 * s3) + (r0 * s1)) - (r1 * s0);
    arg2[3] = (r3 * s3) - (r0 * s0) - (r1 * s1) - (r2 * s2);
    arg2[4] = ((((r3 * s4) + (r0 * s7) + (r1 * s6)) - (r2 * s5)) + (r7 * s0) + (r4 * s3) + (r5 * s2)) - (r6 * s1);
    arg2[5] = ((((r3 * s5) + (r1 * s7) + (r2 * s4)) - (r0 * s6)) + (r7 * s1) + (r5 * s3) + (r6 * s0)) - (r4 * s2);
    arg2[6] = ((((r3 * s6) + (r2 * s7) + (r0 * s5)) - (r1 * s4)) + (r7 * s2) + (r6 * s3) + (r4 * s1)) - (r5 * s0);
    arg2[7] = (((r3 * s7) - (r0 * s4) - (r1 * s5) - (r2 * s6)) + (r7 * s3)) - (r4 * s0) - (r5 * s1) - (r6 * s2);
    return arg2;
}

function smf_dq_normalize(arg0, arg1 = arg0)
{
    var q0 = arg0[0];
    var q1 = arg0[1];
    var q2 = arg0[2];
    var q3 = arg0[3];
    var q4 = arg0[4];
    var q5 = arg0[5];
    var q6 = arg0[6];
    var q7 = arg0[7];
    var l = 1 / sqrt((q0 * q0) + (q1 * q1) + (q2 * q2) + (q3 * q3));
    arg1[0] = q0 * l;
    arg1[1] = q1 * l;
    arg1[2] = q2 * l;
    arg1[3] = q3 * l;
    var d = l * ((q0 * q4) + (q1 * q5) + (q2 * q6) + (q3 * q7));
    arg1[4] = (q4 - (q0 * d)) * l;
    arg1[5] = (q5 - (q1 * d)) * l;
    arg1[6] = (q6 - (q2 * d)) * l;
    arg1[7] = (q7 - (q3 * d)) * l;
    return arg1;
}

function smf_dq_quadratic_interpolate(arg0, arg1, arg2, arg3, arg4 = array_create(8))
{
    var t0 = 0.5 * sqr(1 - arg3);
    var t1 = 0.5 * arg3 * arg3;
    var t2 = 2 * arg3 * (1 - arg3);
    var b0 = arg1[0];
    var b1 = arg1[1];
    var b2 = arg1[2];
    var b3 = arg1[3];
    var b4 = arg1[4];
    var b5 = arg1[5];
    var b6 = arg1[6];
    var b7 = arg1[7];
    arg4[0] = (t0 * (arg0[0] + b0)) + (t1 * (b0 + arg2[0])) + (t2 * b0);
    arg4[1] = (t0 * (arg0[1] + b1)) + (t1 * (b1 + arg2[1])) + (t2 * b1);
    arg4[2] = (t0 * (arg0[2] + b2)) + (t1 * (b2 + arg2[2])) + (t2 * b2);
    arg4[3] = (t0 * (arg0[3] + b3)) + (t1 * (b3 + arg2[3])) + (t2 * b3);
    arg4[4] = (t0 * (arg0[4] + b4)) + (t1 * (b4 + arg2[4])) + (t2 * b4);
    arg4[5] = (t0 * (arg0[5] + b5)) + (t1 * (b5 + arg2[5])) + (t2 * b5);
    arg4[6] = (t0 * (arg0[6] + b6)) + (t1 * (b6 + arg2[6])) + (t2 * b6);
    arg4[7] = (t0 * (arg0[7] + b7)) + (t1 * (b7 + arg2[7])) + (t2 * b7);
    return arg4;
}

function smf_dq_set_translation(arg0, arg1, arg2, arg3)
{
    arg0[4] = 0.5 * (((arg1 * arg0[3]) + (arg2 * arg0[2])) - (arg3 * arg0[1]));
    arg0[5] = 0.5 * (((arg2 * arg0[3]) + (arg3 * arg0[0])) - (arg1 * arg0[2]));
    arg0[6] = 0.5 * (((arg3 * arg0[3]) + (arg1 * arg0[1])) - (arg2 * arg0[0]));
    arg0[7] = -0.5 * ((arg1 * arg0[0]) + (arg2 * arg0[1]) + (arg3 * arg0[2]));
}
