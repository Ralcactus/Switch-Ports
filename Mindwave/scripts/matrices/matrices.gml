function smf_mat_create(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
{
    var l = sqrt((arg3 * arg3) + (arg4 * arg4) + (arg5 * arg5));
    
    if (l > 0)
        l = 1 / l;
    else
        show_debug_message("ERROR in script smf_mat_create: Supplied zero-length vector for to-vector.");
    
    arg3 *= l;
    arg4 *= l;
    arg5 *= l;
    var dot = (arg6 * arg3) + (arg7 * arg4) + (arg8 * arg5);
    arg6 -= (arg3 * dot);
    arg7 -= (arg4 * dot);
    arg8 -= (arg5 * dot);
    l = sqrt((arg6 * arg6) + (arg7 * arg7) + (arg8 * arg8));
    
    if (l > 0)
        l = 1 / l;
    else
        show_debug_message("ERROR in script smf_mat_create: Supplied zero-length vector for up-vector, or the up- and to-vectors are parallel.");
    
    arg6 *= l;
    arg7 *= l;
    arg8 *= l;
    var siX = (arg7 * arg5) - (arg8 * arg4);
    var siY = (arg8 * arg3) - (arg6 * arg5);
    var siZ = (arg6 * arg4) - (arg7 * arg3);
    return [arg3 * arg9, arg4 * arg9, arg5 * arg9, 0, siX * arg10, siY * arg10, siZ * arg10, 0, arg6 * arg11, arg7 * arg11, arg8 * arg11, 0, arg0, arg1, arg2, 1];
}

function smf_mat_create_from_axisangle(arg0, arg1, arg2, arg3)
{
    var l = sqrt((arg0 * arg0) + (arg1 * arg1) + (arg2 * arg2));
    
    if (l != 0 && l != 1)
    {
        l = 1 / l;
        arg0 *= l;
        arg1 *= l;
        arg2 *= l;
    }
    
    var c = cos(-arg3);
    var s = sin(-arg3);
    var omc = 1 - c;
    var R = array_create(16, 0);
    R[0] = (omc * arg0 * arg0) + c;
    R[1] = (omc * arg0 * arg1) + (s * arg2);
    R[2] = (omc * arg0 * arg2) - (s * arg1);
    R[4] = (omc * arg1 * arg0) - (s * arg2);
    R[5] = (omc * arg1 * arg1) + c;
    R[6] = (omc * arg1 * arg2) + (s * arg0);
    R[8] = (omc * arg2 * arg0) + (s * arg1);
    R[9] = (omc * arg2 * arg1) - (s * arg0);
    R[10] = (omc * arg2 * arg2) + c;
    R[15] = 1;
    return R;
}

function smf_mat_create_from_dualquat(arg0, arg1 = array_create(16))
{
    var q0 = arg0[0];
    var q1 = arg0[1];
    var q2 = arg0[2];
    var q3 = arg0[3];
    var q4 = arg0[4];
    var q5 = arg0[5];
    var q6 = arg0[6];
    var q7 = arg0[7];
    arg1[0] = ((q3 * q3) + (q0 * q0)) - (q1 * q1) - (q2 * q2);
    arg1[1] = 2 * ((q0 * q1) + (q2 * q3));
    arg1[2] = 2 * ((q0 * q2) - (q1 * q3));
    arg1[3] = 0;
    arg1[4] = 2 * ((q0 * q1) - (q2 * q3));
    arg1[5] = (((q3 * q3) - (q0 * q0)) + (q1 * q1)) - (q2 * q2);
    arg1[6] = 2 * ((q1 * q2) + (q0 * q3));
    arg1[7] = 0;
    arg1[8] = 2 * ((q0 * q2) + (q1 * q3));
    arg1[9] = 2 * ((q1 * q2) - (q0 * q3));
    arg1[10] = ((q3 * q3) - (q0 * q0) - (q1 * q1)) + (q2 * q2);
    arg1[11] = 0;
    arg1[12] = 2 * (((-q7 * q0) + (q4 * q3) + (q6 * q1)) - (q5 * q2));
    arg1[13] = 2 * (((-q7 * q1) + (q5 * q3) + (q4 * q2)) - (q6 * q0));
    arg1[14] = 2 * (((-q7 * q2) + (q6 * q3) + (q5 * q0)) - (q4 * q1));
    arg1[15] = 1;
    return arg1;
}

function smf_mat_invert(arg0, arg1)
{
    var m0 = arg0[0];
    var m1 = arg0[1];
    var m2 = arg0[2];
    var m3 = arg0[3];
    var m4 = arg0[4];
    var m5 = arg0[5];
    var m6 = arg0[6];
    var m7 = arg0[7];
    var m8 = arg0[8];
    var m9 = arg0[9];
    var m10 = arg0[10];
    var m11 = arg0[11];
    var m12 = arg0[12];
    var m13 = arg0[13];
    var m14 = arg0[14];
    var m15 = arg0[15];
    var I = is_undefined(arg1) ? array_create(16) : arg1;
    I[0] = (((m5 * m10 * m15) - (m5 * m11 * m14) - (m9 * m6 * m15)) + (m9 * m7 * m14) + (m13 * m6 * m11)) - (m13 * m7 * m10);
    I[1] = (((-m1 * m10 * m15) + (m1 * m11 * m14) + (m9 * m2 * m15)) - (m9 * m3 * m14) - (m13 * m2 * m11)) + (m13 * m3 * m10);
    I[2] = (((m1 * m6 * m15) - (m1 * m7 * m14) - (m5 * m2 * m15)) + (m5 * m3 * m14) + (m13 * m2 * m7)) - (m13 * m3 * m6);
    I[3] = (((-m1 * m6 * m11) + (m1 * m7 * m10) + (m5 * m2 * m11)) - (m5 * m3 * m10) - (m9 * m2 * m7)) + (m9 * m3 * m6);
    I[4] = (((-m4 * m10 * m15) + (m4 * m11 * m14) + (m8 * m6 * m15)) - (m8 * m7 * m14) - (m12 * m6 * m11)) + (m12 * m7 * m10);
    I[5] = (((m0 * m10 * m15) - (m0 * m11 * m14) - (m8 * m2 * m15)) + (m8 * m3 * m14) + (m12 * m2 * m11)) - (m12 * m3 * m10);
    I[6] = (((-m0 * m6 * m15) + (m0 * m7 * m14) + (m4 * m2 * m15)) - (m4 * m3 * m14) - (m12 * m2 * m7)) + (m12 * m3 * m6);
    I[7] = (((m0 * m6 * m11) - (m0 * m7 * m10) - (m4 * m2 * m11)) + (m4 * m3 * m10) + (m8 * m2 * m7)) - (m8 * m3 * m6);
    I[8] = (((m4 * m9 * m15) - (m4 * m11 * m13) - (m8 * m5 * m15)) + (m8 * m7 * m13) + (m12 * m5 * m11)) - (m12 * m7 * m9);
    I[9] = (((-m0 * m9 * m15) + (m0 * m11 * m13) + (m8 * m1 * m15)) - (m8 * m3 * m13) - (m12 * m1 * m11)) + (m12 * m3 * m9);
    I[10] = (((m0 * m5 * m15) - (m0 * m7 * m13) - (m4 * m1 * m15)) + (m4 * m3 * m13) + (m12 * m1 * m7)) - (m12 * m3 * m5);
    I[11] = (((-m0 * m5 * m11) + (m0 * m7 * m9) + (m4 * m1 * m11)) - (m4 * m3 * m9) - (m8 * m1 * m7)) + (m8 * m3 * m5);
    I[12] = (m12 * ((m6 * m9) - (m5 * m10))) + (m13 * ((m4 * m10) - (m8 * m6))) + (m14 * ((m8 * m5) - (m4 * m9)));
    I[13] = (m12 * ((m1 * m10) - (m2 * m9))) + (m13 * ((m8 * m2) - (m0 * m10))) + (m14 * ((m0 * m9) - (m8 * m1)));
    I[14] = (m12 * ((m5 * m2) - (m1 * m6))) + (m13 * ((m0 * m6) - (m4 * m2))) + (m14 * ((m4 * m1) - (m0 * m5)));
    I[15] = (((m0 * m5 * m10) - (m0 * m6 * m9) - (m4 * m1 * m10)) + (m4 * m2 * m9) + (m8 * m1 * m6)) - (m8 * m2 * m5);
    var _det = (m0 * I[0]) + (m1 * I[4]) + (m2 * I[8]) + (m3 * I[12]);
    
    if (_det == 0)
    {
        show_debug_message("Error in function smf_mat_invert: The determinant is zero.");
        return I;
    }
    
    _det = 1 / _det;
    
    for (var i = 0; i < 16; i++)
        I[i] *= _det;
    
    return I;
}

function smf_mat_invert_fast(arg0, arg1)
{
    var m0 = arg0[0];
    var m1 = arg0[1];
    var m2 = arg0[2];
    var m4 = arg0[4];
    var m5 = arg0[5];
    var m6 = arg0[6];
    var m8 = arg0[8];
    var m9 = arg0[9];
    var m10 = arg0[10];
    var m12 = arg0[12];
    var m13 = arg0[13];
    var m14 = arg0[14];
    var I = is_undefined(arg1) ? array_create(16) : arg1;
    I[0] = (m5 * m10) - (m9 * m6);
    I[1] = (m9 * m2) - (m1 * m10);
    I[2] = (m1 * m6) - (m5 * m2);
    I[3] = 0;
    I[4] = (m8 * m6) - (m4 * m10);
    I[5] = (m0 * m10) - (m8 * m2);
    I[6] = (m4 * m2) - (m0 * m6);
    I[7] = 0;
    I[8] = (m4 * m9) - (m8 * m5);
    I[9] = (m8 * m1) - (m0 * m9);
    I[10] = (m0 * m5) - (m4 * m1);
    I[11] = 0;
    I[12] = (-m12 * I[0]) - (m13 * I[4]) - (m14 * I[8]);
    I[13] = (-m12 * I[1]) - (m13 * I[5]) - (m14 * I[9]);
    I[14] = (-m12 * I[2]) - (m13 * I[6]) - (m14 * I[10]);
    I[15] = 1;
    var _det = (m0 * I[0]) + (m1 * I[4]) + (m2 * I[8]);
    
    if (_det == 0)
    {
        show_debug_message("Error in function smf_mat_invert_fast: The determinant is zero.");
        return I;
    }
    
    _det = 1 / _det;
    
    for (var i = 0; i < 16; i++)
        I[i] *= _det;
    
    return I;
}

function smf_mat_orthogonalize(arg0)
{
    var l = sqrt((arg0[8] * arg0[8]) + (arg0[9] * arg0[9]) + (arg0[10] * arg0[10]));
    
    if (l == 0)
        return false;
    
    l = 1 / l;
    arg0[8] *= l;
    arg0[9] *= l;
    arg0[10] *= l;
    arg0[4] = (arg0[9] * arg0[2]) - (arg0[10] * arg0[1]);
    arg0[5] = (arg0[10] * arg0[0]) - (arg0[8] * arg0[2]);
    arg0[6] = (arg0[8] * arg0[1]) - (arg0[9] * arg0[0]);
    l = sqrt((arg0[4] * arg0[4]) + (arg0[5] * arg0[5]) + (arg0[6] * arg0[6]));
    
    if (l == 0)
        return false;
    
    l = 1 / l;
    arg0[4] *= l;
    arg0[5] *= l;
    arg0[6] *= l;
    arg0[0] = (arg0[10] * arg0[5]) - (arg0[9] * arg0[6]);
    arg0[1] = (arg0[8] * arg0[6]) - (arg0[10] * arg0[4]);
    arg0[2] = (arg0[9] * arg0[4]) - (arg0[8] * arg0[5]);
    return arg0;
}
