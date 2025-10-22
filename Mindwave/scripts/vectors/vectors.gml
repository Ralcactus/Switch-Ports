function smf_vector_cross(arg0, arg1)
{
    return [(arg0[1] * arg1[2]) - (arg0[2] * arg1[1]), (arg0[2] * arg1[0]) - (arg0[0] * arg1[2]), (arg0[0] * arg1[1]) - (arg0[1] * arg1[0])];
}

function smf_vector_dot(arg0, arg1)
{
    return (arg0[0] * arg1[0]) + (arg0[1] * arg1[1]) + (arg0[2] * arg1[2]);
}

function smf_vector_normalize(arg0)
{
    var l = (arg0[0] * arg0[0]) + (arg0[1] * arg0[1]) + (arg0[2] * arg0[2]);
    
    if (l == 0)
        return [0, 0, 1, 0];
    
    l = sqrt(l);
    var j = 1 / l;
    return [arg0[0] * j, arg0[1] * j, arg0[2] * j, l];
}

function smf_vector_orthogonalize(arg0, arg1)
{
    var l = (arg0[0] * arg1[0]) + (arg0[1] * arg1[1]) + (arg0[2] * arg1[2]);
    return [arg1[0] - (arg0[0] * l), arg1[1] - (arg0[1] * l), arg1[2] - (arg0[2] * l)];
}

function smf_vector_rotate(arg0, arg1, arg2)
{
    var a = arg1;
    var c = cos(arg2);
    var s = sin(arg2);
    var d = (1 - c) * ((a[0] * arg0[0]) + (a[1] * arg0[1]) + (a[2] * arg0[2]));
    return [(arg0[0] * c) + (a[0] * d) + (((a[1] * arg0[2]) - (a[2] * arg0[1])) * s), (arg0[1] * c) + (a[1] * d) + (((a[2] * arg0[0]) - (a[0] * arg0[2])) * s), (arg0[2] * c) + (a[2] * d) + (((a[0] * arg0[1]) - (a[1] * arg0[0])) * s)];
}

function smf_cast_ray_sphere(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10 = false)
{
    static ret = array_create(3);
    
    var dx = arg0 - arg4;
    var dy = arg1 - arg5;
    var dz = arg2 - arg6;
    var vx = arg7 - arg4;
    var vy = arg8 - arg5;
    var vz = arg9 - arg6;
    var v = dot_product_3d(vx, vy, vz, vx, vy, vz);
    var d = dot_product_3d(dx, dy, dz, dx, dy, dz);
    var t = dot_product_3d(vx, vy, vz, dx, dy, dz);
    var u = (t * t) + (v * ((arg3 * arg3) - d));
    
    if (u < 0)
        return -1;
    
    u = sqrt(max(u, 0));
    
    if (t < u)
    {
        if (!arg10)
            return -1;
        
        t += u;
        
        if (t < 0)
            return -1;
    }
    else
    {
        t -= u;
        
        if (t > v)
            return -1;
    }
    
    t /= v;
    ret[0] = arg4 + (vx * t);
    ret[1] = arg5 + (vy * t);
    ret[2] = arg6 + (vz * t);
    return ret;
}
