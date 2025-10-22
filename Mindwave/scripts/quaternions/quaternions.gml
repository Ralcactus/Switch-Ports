function smf_quat_create_from_matrix(arg0, arg1)
{
    var Q = arg1;
    var T = 1 + arg0[0] + arg0[5] + arg0[10];
    
    if (T > 0)
    {
        var S = sqrt(T) * 2;
        Q[0] = (arg0[9] - arg0[6]) / S;
        Q[1] = (arg0[2] - arg0[8]) / S;
        Q[2] = (arg0[4] - arg0[1]) / S;
        Q[3] = -0.25 * S;
    }
    else if (arg0[0] > arg0[5] && arg0[0] > arg0[10])
    {
        var S = sqrt((1 + arg0[0]) - arg0[5] - arg0[10]) * 2;
        Q[0] = 0.25 * S;
        Q[1] = (arg0[4] + arg0[1]) / S;
        Q[2] = (arg0[2] + arg0[8]) / S;
        Q[3] = (arg0[9] - arg0[6]) / S;
    }
    else if (arg0[5] > arg0[10])
    {
        var S = sqrt((1 + arg0[5]) - arg0[0] - arg0[10]) * 2;
        Q[0] = (arg0[4] + arg0[1]) / S;
        Q[1] = 0.25 * S;
        Q[2] = (arg0[9] + arg0[6]) / S;
        Q[3] = (arg0[2] - arg0[8]) / S;
    }
    else
    {
        var S = sqrt((1 + arg0[10]) - arg0[0] - arg0[5]) * 2;
        Q[0] = (arg0[2] + arg0[8]) / S;
        Q[1] = (arg0[9] + arg0[6]) / S;
        Q[2] = 0.25 * S;
        Q[3] = (arg0[4] - arg0[1]) / S;
    }
    
    return Q;
}

function smf_quat_dot(arg0, arg1)
{
    return (arg0[0] * arg1[0]) + (arg0[1] * arg1[1]) + (arg0[2] * arg1[2]) + (arg0[3] * arg1[3]);
}

function smf_quat_get_conjugate(arg0)
{
    return [-arg0[0], -arg0[1], -arg0[2], arg0[3]];
}

function smf_quat_get_si(arg0)
{
    return [2 * ((arg0[0] * arg0[1]) - (arg0[2] * arg0[3])), ((sqr(arg0[3]) - sqr(arg0[0])) + sqr(arg0[1])) - sqr(arg0[2]), 2 * ((arg0[1] * arg0[2]) + (arg0[0] * arg0[3]))];
}

function smf_quat_get_to(arg0)
{
    return [(sqr(arg0[3]) + sqr(arg0[0])) - sqr(arg0[1]) - sqr(arg0[2]), 2 * ((arg0[0] * arg0[1]) + (arg0[3] * arg0[2])), 2 * ((arg0[0] * arg0[2]) - (arg0[3] * arg0[1]))];
}

function smf_quat_get_up(arg0)
{
    return [2 * ((arg0[2] * arg0[0]) + (arg0[3] * arg0[1])), 2 * ((arg0[2] * arg0[1]) - (arg0[3] * arg0[0])), (sqr(arg0[3]) - sqr(arg0[0]) - sqr(arg0[1])) + sqr(arg0[2])];
}

function smf_quat_multiply(arg0, arg1, arg2)
{
    var T = arg2;
    var Qx = ((arg0[3] * arg1[0]) + (arg0[0] * arg1[3]) + (arg0[1] * arg1[2])) - (arg0[2] * arg1[1]);
    var Qy = ((arg0[3] * arg1[1]) + (arg0[1] * arg1[3]) + (arg0[2] * arg1[0])) - (arg0[0] * arg1[2]);
    var Qz = ((arg0[3] * arg1[2]) + (arg0[2] * arg1[3]) + (arg0[0] * arg1[1])) - (arg0[1] * arg1[0]);
    var Qw = (arg0[3] * arg1[3]) - (arg0[0] * arg1[0]) - (arg0[1] * arg1[1]) - (arg0[2] * arg1[2]);
    T[0] = Qx;
    T[1] = Qy;
    T[2] = Qz;
    T[3] = Qw;
    return T;
}

function smf_quat_transform_vector(arg0, arg1, arg2, arg3)
{
    var crossX = ((arg0[1] * arg3) - (arg0[2] * arg2)) + (arg0[3] * arg1);
    var crossY = ((arg0[2] * arg1) - (arg0[0] * arg3)) + (arg0[3] * arg2);
    var crossZ = ((arg0[0] * arg2) - (arg0[1] * arg1)) + (arg0[3] * arg3);
    var r = global.animTempV;
    r[0] = (arg1 + (2 * arg0[1] * crossZ)) - (arg0[2] * crossY);
    r[1] = (arg2 + (2 * arg0[2] * crossX)) - (arg0[0] * crossZ);
    r[2] = (arg3 + (2 * arg0[0] * crossY)) - (arg0[1] * crossX);
    return r;
}
