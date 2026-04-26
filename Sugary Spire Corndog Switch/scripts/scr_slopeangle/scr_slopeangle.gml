function scr_slopeangle(arg0 = x, arg1 = y, arg2 = 2)
{
    return 0;
}

function scr_slopeanglenonplayer(arg0, arg1, arg2 = 1)
{
    return 0;
}

function scr_checkSlopeAngle()
{
    return 0//scr_checkPositionSolidAngle(x, bbox_bottom, abs(x - bbox_left), abs(x - bbox_right) - 1, (bbox_bottom - bbox_top) / 2, -90, undefined, true);
}
