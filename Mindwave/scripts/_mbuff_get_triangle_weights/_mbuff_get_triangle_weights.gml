function _mbuff_get_triangle_weights(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var v1x = arg0;
    var v1y = arg1;
    var v2x = arg2;
    var v2y = arg3;
    var v3x = arg4;
    var v3y = arg5;
    var u = arg6;
    var v = arg7;
    var d = ((v2y - v3y) * (v1x - v3x)) + ((v3x - v2x) * (v1y - v3y));
    
    if (d == 0)
        return [1, 0, 0];
    
    d = 1 / d;
    var w1 = d * (((v2y - v3y) * (u - v3x)) + ((v3x - v2x) * (v - v3y)));
    var w2 = d * (((v3y - v1y) * (u - v3x)) + ((v1x - v3x) * (v - v3y)));
    var w3 = 1 - w1 - w2;
    return [w1, w2, w3];
}
